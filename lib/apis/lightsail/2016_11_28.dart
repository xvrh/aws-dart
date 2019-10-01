import 'package:meta/meta.dart';

/// Amazon Lightsail is the easiest way to get started with AWS for developers
/// who just need virtual private servers. Lightsail includes everything you
/// need to launch your project quickly - a virtual machine, a managed database,
/// SSD-based storage, data transfer, DNS management, and a static IP - for a
/// low, predictable price. You manage those Lightsail servers through the
/// Lightsail console or by using the API or command-line interface (CLI).
///
/// For more information about Lightsail concepts and tasks, see the
/// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/all).
///
/// To use the Lightsail API or the CLI, you will need to use AWS Identity and
/// Access Management (IAM) to generate access keys. For details about how to
/// set this up, see the
/// [Lightsail Dev Guide](http://lightsail.aws.amazon.com/ls/docs/how-to/article/lightsail-how-to-set-up-access-keys-to-use-sdk-api-cli).
class LightsailApi {
  /// Allocates a static IP address.
  ///
  /// [staticIpName]: The name of the static IP address.
  Future<AllocateStaticIpResult> allocateStaticIp(String staticIpName) async {
    return AllocateStaticIpResult.fromJson({});
  }

  /// Attaches a block storage disk to a running or stopped Lightsail instance
  /// and exposes it to the instance with the specified disk name.
  ///
  /// The `attach disk` operation supports tag-based access control via resource
  /// tags applied to the resource identified by diskName. For more information,
  /// see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [diskName]: The unique Lightsail disk name (e.g., `my-disk`).
  ///
  /// [instanceName]: The name of the Lightsail instance where you want to
  /// utilize the storage disk.
  ///
  /// [diskPath]: The disk path to expose to the instance (e.g., `/dev/xvdf`).
  Future<AttachDiskResult> attachDisk(
      {@required String diskName,
      @required String instanceName,
      @required String diskPath}) async {
    return AttachDiskResult.fromJson({});
  }

  /// Attaches one or more Lightsail instances to a load balancer.
  ///
  /// After some time, the instances are attached to the load balancer and the
  /// health check status is available.
  ///
  /// The `attach instances to load balancer` operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// loadBalancerName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [instanceNames]: An array of strings representing the instance name(s) you
  /// want to attach to your load balancer.
  ///
  /// An instance must be `running` before you can attach it to your load
  /// balancer.
  ///
  /// There are no additional limits on the number of instances you can attach
  /// to your load balancer, aside from the limit of Lightsail instances you can
  /// create in your account (20).
  Future<AttachInstancesToLoadBalancerResult> attachInstancesToLoadBalancer(
      {@required String loadBalancerName,
      @required List<String> instanceNames}) async {
    return AttachInstancesToLoadBalancerResult.fromJson({});
  }

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
  /// loadBalancerName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [loadBalancerName]: The name of the load balancer to which you want to
  /// associate the SSL/TLS certificate.
  ///
  /// [certificateName]: The name of your SSL/TLS certificate.
  Future<AttachLoadBalancerTlsCertificateResult>
      attachLoadBalancerTlsCertificate(
          {@required String loadBalancerName,
          @required String certificateName}) async {
    return AttachLoadBalancerTlsCertificateResult.fromJson({});
  }

  /// Attaches a static IP address to a specific Amazon Lightsail instance.
  ///
  /// [staticIpName]: The name of the static IP.
  ///
  /// [instanceName]: The instance name to which you want to attach the static
  /// IP address.
  Future<AttachStaticIpResult> attachStaticIp(
      {@required String staticIpName, @required String instanceName}) async {
    return AttachStaticIpResult.fromJson({});
  }

  /// Closes the public ports on a specific Amazon Lightsail instance.
  ///
  /// The `close instance public ports` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// instanceName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [portInfo]: Information about the public port you are trying to close.
  ///
  /// [instanceName]: The name of the instance on which you're attempting to
  /// close the public ports.
  Future<CloseInstancePublicPortsResult> closeInstancePublicPorts(
      {@required PortInfo portInfo, @required String instanceName}) async {
    return CloseInstancePublicPortsResult.fromJson({});
  }

  /// Copies an instance or disk snapshot from one AWS Region to another in
  /// Amazon Lightsail.
  ///
  /// [sourceSnapshotName]: The name of the source instance or disk snapshot to
  /// be copied.
  ///
  /// [targetSnapshotName]: The name of the new instance or disk snapshot to be
  /// created as a copy.
  ///
  /// [sourceRegion]: The AWS Region where the source snapshot is located.
  Future<CopySnapshotResult> copySnapshot(
      {@required String sourceSnapshotName,
      @required String targetSnapshotName,
      @required String sourceRegion}) async {
    return CopySnapshotResult.fromJson({});
  }

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
  ///
  /// [instances]: An array of parameters that will be used to create the new
  /// Amazon EC2 instance. You can only pass one instance entry at a time in
  /// this array. You will get an invalid parameter error if you pass more than
  /// one instance entry in this array.
  Future<CreateCloudFormationStackResult> createCloudFormationStack(
      List<InstanceEntry> instances) async {
    return CreateCloudFormationStackResult.fromJson({});
  }

  /// Creates a block storage disk that can be attached to a Lightsail instance
  /// in the same Availability Zone (e.g., `us-east-2a`). The disk is created in
  /// the regional endpoint that you send the HTTP request to. For more
  /// information, see
  /// [Regions and Availability Zones in Lightsail](https://lightsail.aws.amazon.com/ls/docs/overview/article/understanding-regions-and-availability-zones-in-amazon-lightsail).
  ///
  /// The `create disk` operation supports tag-based access control via request
  /// tags. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [diskName]: The unique Lightsail disk name (e.g., `my-disk`).
  ///
  /// [availabilityZone]: The Availability Zone where you want to create the
  /// disk (e.g., `us-east-2a`). Choose the same Availability Zone as the
  /// Lightsail instance where you want to create the disk.
  ///
  /// Use the GetRegions operation to list the Availability Zones where
  /// Lightsail is currently available.
  ///
  /// [sizeInGb]: The size of the disk in GB (e.g., `32`).
  ///
  /// [tags]: The tag keys and optional values to add to the resource during
  /// create.
  ///
  /// To tag a resource after it has been created, see the `tag resource`
  /// operation.
  Future<CreateDiskResult> createDisk(
      {@required String diskName,
      @required String availabilityZone,
      @required int sizeInGb,
      List<Tag> tags}) async {
    return CreateDiskResult.fromJson({});
  }

  /// Creates a block storage disk from a disk snapshot that can be attached to
  /// a Lightsail instance in the same Availability Zone (e.g., `us-east-2a`).
  /// The disk is created in the regional endpoint that you send the HTTP
  /// request to. For more information, see
  /// [Regions and Availability Zones in Lightsail](https://lightsail.aws.amazon.com/ls/docs/overview/article/understanding-regions-and-availability-zones-in-amazon-lightsail).
  ///
  /// The `create disk from snapshot` operation supports tag-based access
  /// control via request tags and resource tags applied to the resource
  /// identified by diskSnapshotName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [diskName]: The unique Lightsail disk name (e.g., `my-disk`).
  ///
  /// [diskSnapshotName]: The name of the disk snapshot (e.g., `my-snapshot`)
  /// from which to create the new storage disk.
  ///
  /// [availabilityZone]: The Availability Zone where you want to create the
  /// disk (e.g., `us-east-2a`). Choose the same Availability Zone as the
  /// Lightsail instance where you want to create the disk.
  ///
  /// Use the GetRegions operation to list the Availability Zones where
  /// Lightsail is currently available.
  ///
  /// [sizeInGb]: The size of the disk in GB (e.g., `32`).
  ///
  /// [tags]: The tag keys and optional values to add to the resource during
  /// create.
  ///
  /// To tag a resource after it has been created, see the `tag resource`
  /// operation.
  Future<CreateDiskFromSnapshotResult> createDiskFromSnapshot(
      {@required String diskName,
      @required String diskSnapshotName,
      @required String availabilityZone,
      @required int sizeInGb,
      List<Tag> tags}) async {
    return CreateDiskFromSnapshotResult.fromJson({});
  }

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
  /// request tags. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [diskName]: The unique name of the source disk (e.g., `Disk-Virginia-1`).
  ///
  ///
  ///
  /// This parameter cannot be defined together with the `instance name`
  /// parameter. The `disk name` and `instance name` parameters are mutually
  /// exclusive.
  ///
  /// [diskSnapshotName]: The name of the destination disk snapshot (e.g.,
  /// `my-disk-snapshot`) based on the source disk.
  ///
  /// [instanceName]: The unique name of the source instance (e.g.,
  /// `Amazon_Linux-512MB-Virginia-1`). When this is defined, a snapshot of the
  /// instance's system volume is created.
  ///
  ///
  ///
  /// This parameter cannot be defined together with the `disk name` parameter.
  /// The `instance name` and `disk name` parameters are mutually exclusive.
  ///
  /// [tags]: The tag keys and optional values to add to the resource during
  /// create.
  ///
  /// To tag a resource after it has been created, see the `tag resource`
  /// operation.
  Future<CreateDiskSnapshotResult> createDiskSnapshot(String diskSnapshotName,
      {String diskName, String instanceName, List<Tag> tags}) async {
    return CreateDiskSnapshotResult.fromJson({});
  }

  /// Creates a domain resource for the specified domain (e.g., example.com).
  ///
  /// The `create domain` operation supports tag-based access control via
  /// request tags. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [domainName]: The domain name to manage (e.g., `example.com`).
  ///
  ///
  ///
  /// You cannot register a new domain name using Lightsail. You must register a
  /// domain name using Amazon Route 53 or another domain name registrar. If you
  /// have already registered your domain, you can enter its name in this
  /// parameter to manage the DNS records for that domain.
  ///
  /// [tags]: The tag keys and optional values to add to the resource during
  /// create.
  ///
  /// To tag a resource after it has been created, see the `tag resource`
  /// operation.
  Future<CreateDomainResult> createDomain(String domainName,
      {List<Tag> tags}) async {
    return CreateDomainResult.fromJson({});
  }

  /// Creates one of the following entry records associated with the domain:
  /// Address (A), canonical name (CNAME), mail exchanger (MX), name server
  /// (NS), start of authority (SOA), service locator (SRV), or text (TXT).
  ///
  /// The `create domain entry` operation supports tag-based access control via
  /// resource tags applied to the resource identified by domainName. For more
  /// information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [domainName]: The domain name (e.g., `example.com`) for which you want to
  /// create the domain entry.
  ///
  /// [domainEntry]: An array of key-value pairs containing information about
  /// the domain entry request.
  Future<CreateDomainEntryResult> createDomainEntry(
      {@required String domainName, @required DomainEntry domainEntry}) async {
    return CreateDomainEntryResult.fromJson({});
  }

  /// Creates a snapshot of a specific virtual private server, or _instance_.
  /// You can use a snapshot to create a new instance that is based on that
  /// snapshot.
  ///
  /// The `create instance snapshot` operation supports tag-based access control
  /// via request tags. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [instanceSnapshotName]: The name for your new snapshot.
  ///
  /// [instanceName]: The Lightsail instance on which to base your snapshot.
  ///
  /// [tags]: The tag keys and optional values to add to the resource during
  /// create.
  ///
  /// To tag a resource after it has been created, see the `tag resource`
  /// operation.
  Future<CreateInstanceSnapshotResult> createInstanceSnapshot(
      {@required String instanceSnapshotName,
      @required String instanceName,
      List<Tag> tags}) async {
    return CreateInstanceSnapshotResult.fromJson({});
  }

  /// Creates one or more Amazon Lightsail virtual private servers, or
  /// _instances_. Create instances using active blueprints. Inactive blueprints
  /// are listed to support customers with existing instances but are not
  /// necessarily available for launch of new instances. Blueprints are marked
  /// inactive when they become outdated due to operating system updates or new
  /// application releases. Use the get blueprints operation to return a list of
  /// available blueprints.
  ///
  /// The `create instances` operation supports tag-based access control via
  /// request tags. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [instanceNames]: The names to use for your new Lightsail instances.
  /// Separate multiple values using quotation marks and commas, for example:
  /// `["MyFirstInstance","MySecondInstance"]`
  ///
  /// [availabilityZone]: The Availability Zone in which to create your
  /// instance. Use the following format: `us-east-2a` (case sensitive). You can
  /// get a list of Availability Zones by using the
  /// [get regions](http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html)
  /// operation. Be sure to add the `include Availability Zones` parameter to
  /// your request.
  ///
  /// [customImageName]: (Deprecated) The name for your custom image.
  ///
  ///
  ///
  /// In releases prior to June 12, 2017, this parameter was ignored by the API.
  /// It is now deprecated.
  ///
  /// [blueprintId]: The ID for a virtual private server image (e.g.,
  /// `app_wordpress_4_4` or `app_lamp_7_0`). Use the get blueprints operation
  /// to return a list of available images (or _blueprints_).
  ///
  /// [bundleId]: The bundle of specification information for your virtual
  /// private server (or _instance_), including the pricing plan (e.g.,
  /// `micro_1_0`).
  ///
  /// [userData]: A launch script you can create that configures a server with
  /// additional user data. For example, you might want to run `apt-get -y
  /// update`.
  ///
  ///
  ///
  /// Depending on the machine image you choose, the command to get software on
  /// your instance varies. Amazon Linux and CentOS use `yum`, Debian and Ubuntu
  /// use `apt-get`, and FreeBSD uses `pkg`. For a complete list, see the
  /// [Dev Guide](https://lightsail.aws.amazon.com/ls/docs/getting-started/article/compare-options-choose-lightsail-instance-image).
  ///
  /// [keyPairName]: The name of your key pair.
  ///
  /// [tags]: The tag keys and optional values to add to the resource during
  /// create.
  ///
  /// To tag a resource after it has been created, see the `tag resource`
  /// operation.
  Future<CreateInstancesResult> createInstances(
      {@required List<String> instanceNames,
      @required String availabilityZone,
      String customImageName,
      @required String blueprintId,
      @required String bundleId,
      String userData,
      String keyPairName,
      List<Tag> tags}) async {
    return CreateInstancesResult.fromJson({});
  }

  /// Uses a specific snapshot as a blueprint for creating one or more new
  /// instances that are based on that identical configuration.
  ///
  /// The `create instances from snapshot` operation supports tag-based access
  /// control via request tags and resource tags applied to the resource
  /// identified by instanceSnapshotName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [instanceNames]: The names for your new instances.
  ///
  /// [attachedDiskMapping]: An object containing information about one or more
  /// disk mappings.
  ///
  /// [availabilityZone]: The Availability Zone where you want to create your
  /// instances. Use the following formatting: `us-east-2a` (case sensitive).
  /// You can get a list of Availability Zones by using the
  /// [get regions](http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html)
  /// operation. Be sure to add the `include Availability Zones` parameter to
  /// your request.
  ///
  /// [instanceSnapshotName]: The name of the instance snapshot on which you are
  /// basing your new instances. Use the get instance snapshots operation to
  /// return information about your existing snapshots.
  ///
  /// [bundleId]: The bundle of specification information for your virtual
  /// private server (or _instance_), including the pricing plan (e.g.,
  /// `micro_1_0`).
  ///
  /// [userData]: You can create a launch script that configures a server with
  /// additional user data. For example, `apt-get -y update`.
  ///
  ///
  ///
  /// Depending on the machine image you choose, the command to get software on
  /// your instance varies. Amazon Linux and CentOS use `yum`, Debian and Ubuntu
  /// use `apt-get`, and FreeBSD uses `pkg`. For a complete list, see the
  /// [Dev Guide](https://lightsail.aws.amazon.com/ls/docs/getting-started/article/compare-options-choose-lightsail-instance-image).
  ///
  /// [keyPairName]: The name for your key pair.
  ///
  /// [tags]: The tag keys and optional values to add to the resource during
  /// create.
  ///
  /// To tag a resource after it has been created, see the `tag resource`
  /// operation.
  Future<CreateInstancesFromSnapshotResult> createInstancesFromSnapshot(
      {@required List<String> instanceNames,
      Map<String, List<DiskMap>> attachedDiskMapping,
      @required String availabilityZone,
      @required String instanceSnapshotName,
      @required String bundleId,
      String userData,
      String keyPairName,
      List<Tag> tags}) async {
    return CreateInstancesFromSnapshotResult.fromJson({});
  }

  /// Creates an SSH key pair.
  ///
  /// The `create key pair` operation supports tag-based access control via
  /// request tags. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [keyPairName]: The name for your new key pair.
  ///
  /// [tags]: The tag keys and optional values to add to the resource during
  /// create.
  ///
  /// To tag a resource after it has been created, see the `tag resource`
  /// operation.
  Future<CreateKeyPairResult> createKeyPair(String keyPairName,
      {List<Tag> tags}) async {
    return CreateKeyPairResult.fromJson({});
  }

  /// Creates a Lightsail load balancer. To learn more about deciding whether to
  /// load balance your application, see
  /// [Configure your Lightsail instances for load balancing](https://lightsail.aws.amazon.com/ls/docs/how-to/article/configure-lightsail-instances-for-load-balancing).
  /// You can create up to 5 load balancers per AWS Region in your account.
  ///
  /// When you create a load balancer, you can specify a unique name and port
  /// settings. To change additional load balancer settings, use the
  /// `UpdateLoadBalancerAttribute` operation.
  ///
  /// The `create load balancer` operation supports tag-based access control via
  /// request tags. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [loadBalancerName]: The name of your load balancer.
  ///
  /// [instancePort]: The instance port where you're creating your load
  /// balancer.
  ///
  /// [healthCheckPath]: The path you provided to perform the load balancer
  /// health check. If you didn't specify a health check path, Lightsail uses
  /// the root path of your website (e.g., `"/"`).
  ///
  /// You may want to specify a custom health check path other than the root of
  /// your application if your home page loads slowly or has a lot of media or
  /// scripting on it.
  ///
  /// [certificateName]: The name of the SSL/TLS certificate.
  ///
  /// If you specify `certificateName`, then `certificateDomainName` is required
  /// (and vice-versa).
  ///
  /// [certificateDomainName]: The domain name with which your certificate is
  /// associated (e.g., `example.com`).
  ///
  /// If you specify `certificateDomainName`, then `certificateName` is required
  /// (and vice-versa).
  ///
  /// [certificateAlternativeNames]: The optional alternative domains and
  /// subdomains to use with your SSL/TLS certificate (e.g., `www.example.com`,
  /// `example.com`, `m.example.com`, `blog.example.com`).
  ///
  /// [tags]: The tag keys and optional values to add to the resource during
  /// create.
  ///
  /// To tag a resource after it has been created, see the `tag resource`
  /// operation.
  Future<CreateLoadBalancerResult> createLoadBalancer(
      {@required String loadBalancerName,
      @required int instancePort,
      String healthCheckPath,
      String certificateName,
      String certificateDomainName,
      List<String> certificateAlternativeNames,
      List<Tag> tags}) async {
    return CreateLoadBalancerResult.fromJson({});
  }

  /// Creates a Lightsail load balancer TLS certificate.
  ///
  /// TLS is just an updated, more secure version of Secure Socket Layer (SSL).
  ///
  /// The `create load balancer tls certificate` operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// loadBalancerName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [loadBalancerName]: The load balancer name where you want to create the
  /// SSL/TLS certificate.
  ///
  /// [certificateName]: The SSL/TLS certificate name.
  ///
  /// You can have up to 10 certificates in your account at one time. Each
  /// Lightsail load balancer can have up to 2 certificates associated with it
  /// at one time. There is also an overall limit to the number of certificates
  /// that can be issue in a 365-day period. For more information, see
  /// [Limits](http://docs.aws.amazon.com/acm/latest/userguide/acm-limits.html).
  ///
  /// [certificateDomainName]: The domain name (e.g., `example.com`) for your
  /// SSL/TLS certificate.
  ///
  /// [certificateAlternativeNames]: An array of strings listing alternative
  /// domains and subdomains for your SSL/TLS certificate. Lightsail will
  /// de-dupe the names for you. You can have a maximum of 9 alternative names
  /// (in addition to the 1 primary domain). We do not support wildcards (e.g.,
  /// `*.example.com`).
  ///
  /// [tags]: The tag keys and optional values to add to the resource during
  /// create.
  ///
  /// To tag a resource after it has been created, see the `tag resource`
  /// operation.
  Future<CreateLoadBalancerTlsCertificateResult>
      createLoadBalancerTlsCertificate(
          {@required String loadBalancerName,
          @required String certificateName,
          @required String certificateDomainName,
          List<String> certificateAlternativeNames,
          List<Tag> tags}) async {
    return CreateLoadBalancerTlsCertificateResult.fromJson({});
  }

  /// Creates a new database in Amazon Lightsail.
  ///
  /// The `create relational database` operation supports tag-based access
  /// control via request tags. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [relationalDatabaseName]: The name to use for your new database.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 2 to 255 alphanumeric characters, or hyphens.
  ///
  /// *   The first and last character must be a letter or number.
  ///
  /// [availabilityZone]: The Availability Zone in which to create your new
  /// database. Use the `us-east-2a` case-sensitive format.
  ///
  /// You can get a list of Availability Zones by using the `get regions`
  /// operation. Be sure to add the `include relational database Availability
  /// Zones` parameter to your request.
  ///
  /// [relationalDatabaseBlueprintId]: The blueprint ID for your new database. A
  /// blueprint describes the major engine version of a database.
  ///
  /// You can get a list of database blueprints IDs by using the `get relational
  /// database blueprints` operation.
  ///
  /// [relationalDatabaseBundleId]: The bundle ID for your new database. A
  /// bundle describes the performance specifications for your database.
  ///
  /// You can get a list of database bundle IDs by using the `get relational
  /// database bundles` operation.
  ///
  /// [masterDatabaseName]: The name of the master database created when the
  /// Lightsail database resource is created.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 64 alphanumeric characters.
  ///
  /// *   Cannot be a word reserved by the specified database engine
  ///
  /// [masterUsername]: The master user name for your new database.
  ///
  /// Constraints:
  ///
  /// *   Master user name is required.
  ///
  /// *   Must contain from 1 to 16 alphanumeric characters.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Cannot be a reserved word for the database engine you choose.
  ///
  ///     For more information about reserved words in MySQL 5.6 or 5.7, see the
  /// Keywords and Reserved Words articles for
  /// [MySQL 5.6](https://dev.mysql.com/doc/refman/5.6/en/keywords.html) or
  /// [MySQL 5.7](https://dev.mysql.com/doc/refman/5.7/en/keywords.html)
  /// respectively.
  ///
  /// [masterUserPassword]: The password for the master user of your new
  /// database. The password can include any printable ASCII character except
  /// "/", """, or "@".
  ///
  /// Constraints: Must contain 8 to 41 characters.
  ///
  /// [preferredBackupWindow]: The daily time range during which automated
  /// backups are created for your new database if automated backups are
  /// enabled.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region. For more information about the preferred
  /// backup window time blocks for each region, see the
  /// [Working With Backups](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow)
  /// guide in the Amazon Relational Database Service (Amazon RDS)
  /// documentation.
  ///
  /// Constraints:
  ///
  /// *   Must be in the `hh24:mi-hh24:mi` format.
  ///
  ///     Example: `16:00-16:30`
  ///
  /// *   Specified in Universal Coordinated Time (UTC).
  ///
  /// *   Must not conflict with the preferred maintenance window.
  ///
  /// *   Must be at least 30 minutes.
  ///
  /// [preferredMaintenanceWindow]: The weekly time range during which system
  /// maintenance can occur on your new database.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region, occurring on a random day of the week.
  ///
  /// Constraints:
  ///
  /// *   Must be in the `ddd:hh24:mi-ddd:hh24:mi` format.
  ///
  /// *   Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// *   Must be at least 30 minutes.
  ///
  /// *   Specified in Universal Coordinated Time (UTC).
  ///
  /// *   Example: `Tue:17:00-Tue:17:30`
  ///
  /// [publiclyAccessible]: Specifies the accessibility options for your new
  /// database. A value of `true` specifies a database that is available to
  /// resources outside of your Lightsail account. A value of `false` specifies
  /// a database that is available only to your Lightsail resources in the same
  /// region as your database.
  ///
  /// [tags]: The tag keys and optional values to add to the resource during
  /// create.
  ///
  /// To tag a resource after it has been created, see the `tag resource`
  /// operation.
  Future<CreateRelationalDatabaseResult> createRelationalDatabase(
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
      List<Tag> tags}) async {
    return CreateRelationalDatabaseResult.fromJson({});
  }

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
  /// information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [relationalDatabaseName]: The name to use for your new database.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 2 to 255 alphanumeric characters, or hyphens.
  ///
  /// *   The first and last character must be a letter or number.
  ///
  /// [availabilityZone]: The Availability Zone in which to create your new
  /// database. Use the `us-east-2a` case-sensitive format.
  ///
  /// You can get a list of Availability Zones by using the `get regions`
  /// operation. Be sure to add the `include relational database Availability
  /// Zones` parameter to your request.
  ///
  /// [publiclyAccessible]: Specifies the accessibility options for your new
  /// database. A value of `true` specifies a database that is available to
  /// resources outside of your Lightsail account. A value of `false` specifies
  /// a database that is available only to your Lightsail resources in the same
  /// region as your database.
  ///
  /// [relationalDatabaseSnapshotName]: The name of the database snapshot from
  /// which to create your new database.
  ///
  /// [relationalDatabaseBundleId]: The bundle ID for your new database. A
  /// bundle describes the performance specifications for your database.
  ///
  /// You can get a list of database bundle IDs by using the `get relational
  /// database bundles` operation.
  ///
  /// When creating a new database from a snapshot, you cannot choose a bundle
  /// that is smaller than the bundle of the source database.
  ///
  /// [sourceRelationalDatabaseName]: The name of the source database.
  ///
  /// [restoreTime]: The date and time to restore your database from.
  ///
  /// Constraints:
  ///
  /// *   Must be before the latest restorable time for the database.
  ///
  /// *   Cannot be specified if the `use latest restorable time` parameter is
  /// `true`.
  ///
  /// *   Specified in Universal Coordinated Time (UTC).
  ///
  /// *   Specified in the Unix time format.
  ///
  ///     For example, if you wish to use a restore time of October 1, 2018, at
  /// 8 PM UTC, then you input `1538424000` as the restore time.
  ///
  /// [useLatestRestorableTime]: Specifies whether your database is restored
  /// from the latest backup time. A value of `true` restores from the latest
  /// backup time.
  ///
  /// Default: `false`
  ///
  /// Constraints: Cannot be specified if the `restore time` parameter is
  /// provided.
  ///
  /// [tags]: The tag keys and optional values to add to the resource during
  /// create.
  ///
  /// To tag a resource after it has been created, see the `tag resource`
  /// operation.
  Future<CreateRelationalDatabaseFromSnapshotResult>
      createRelationalDatabaseFromSnapshot(String relationalDatabaseName,
          {String availabilityZone,
          bool publiclyAccessible,
          String relationalDatabaseSnapshotName,
          String relationalDatabaseBundleId,
          String sourceRelationalDatabaseName,
          DateTime restoreTime,
          bool useLatestRestorableTime,
          List<Tag> tags}) async {
    return CreateRelationalDatabaseFromSnapshotResult.fromJson({});
  }

  /// Creates a snapshot of your database in Amazon Lightsail. You can use
  /// snapshots for backups, to make copies of a database, and to save data
  /// before deleting a database.
  ///
  /// The `create relational database snapshot` operation supports tag-based
  /// access control via request tags. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [relationalDatabaseName]: The name of the database on which to base your
  /// new snapshot.
  ///
  /// [relationalDatabaseSnapshotName]: The name for your new database snapshot.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 2 to 255 alphanumeric characters, or hyphens.
  ///
  /// *   The first and last character must be a letter or number.
  ///
  /// [tags]: The tag keys and optional values to add to the resource during
  /// create.
  ///
  /// To tag a resource after it has been created, see the `tag resource`
  /// operation.
  Future<CreateRelationalDatabaseSnapshotResult>
      createRelationalDatabaseSnapshot(
          {@required String relationalDatabaseName,
          @required String relationalDatabaseSnapshotName,
          List<Tag> tags}) async {
    return CreateRelationalDatabaseSnapshotResult.fromJson({});
  }

  /// Deletes the specified block storage disk. The disk must be in the
  /// `available` state (not attached to a Lightsail instance).
  ///
  ///  The disk may remain in the `deleting` state for several minutes.
  ///
  /// The `delete disk` operation supports tag-based access control via resource
  /// tags applied to the resource identified by diskName. For more information,
  /// see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [diskName]: The unique name of the disk you want to delete (e.g.,
  /// `my-disk`).
  Future<DeleteDiskResult> deleteDisk(String diskName) async {
    return DeleteDiskResult.fromJson({});
  }

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
  /// more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [diskSnapshotName]: The name of the disk snapshot you want to delete
  /// (e.g., `my-disk-snapshot`).
  Future<DeleteDiskSnapshotResult> deleteDiskSnapshot(
      String diskSnapshotName) async {
    return DeleteDiskSnapshotResult.fromJson({});
  }

  /// Deletes the specified domain recordset and all of its domain records.
  ///
  /// The `delete domain` operation supports tag-based access control via
  /// resource tags applied to the resource identified by domainName. For more
  /// information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [domainName]: The specific domain name to delete.
  Future<DeleteDomainResult> deleteDomain(String domainName) async {
    return DeleteDomainResult.fromJson({});
  }

  /// Deletes a specific domain entry.
  ///
  /// The `delete domain entry` operation supports tag-based access control via
  /// resource tags applied to the resource identified by domainName. For more
  /// information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [domainName]: The name of the domain entry to delete.
  ///
  /// [domainEntry]: An array of key-value pairs containing information about
  /// your domain entries.
  Future<DeleteDomainEntryResult> deleteDomainEntry(
      {@required String domainName, @required DomainEntry domainEntry}) async {
    return DeleteDomainEntryResult.fromJson({});
  }

  /// Deletes a specific Amazon Lightsail virtual private server, or _instance_.
  ///
  /// The `delete instance` operation supports tag-based access control via
  /// resource tags applied to the resource identified by instanceName. For more
  /// information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [instanceName]: The name of the instance to delete.
  Future<DeleteInstanceResult> deleteInstance(String instanceName) async {
    return DeleteInstanceResult.fromJson({});
  }

  /// Deletes a specific snapshot of a virtual private server (or _instance_).
  ///
  /// The `delete instance snapshot` operation supports tag-based access control
  /// via resource tags applied to the resource identified by
  /// instanceSnapshotName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [instanceSnapshotName]: The name of the snapshot to delete.
  Future<DeleteInstanceSnapshotResult> deleteInstanceSnapshot(
      String instanceSnapshotName) async {
    return DeleteInstanceSnapshotResult.fromJson({});
  }

  /// Deletes a specific SSH key pair.
  ///
  /// The `delete key pair` operation supports tag-based access control via
  /// resource tags applied to the resource identified by keyPairName. For more
  /// information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [keyPairName]: The name of the key pair to delete.
  Future<DeleteKeyPairResult> deleteKeyPair(String keyPairName) async {
    return DeleteKeyPairResult.fromJson({});
  }

  /// Deletes the known host key or certificate used by the Amazon Lightsail
  /// browser-based SSH or RDP clients to authenticate an instance. This
  /// operation enables the Lightsail browser-based SSH or RDP clients to
  /// connect to the instance after a host key mismatch.
  ///
  ///
  ///
  /// Perform this operation only if you were expecting the host key or
  /// certificate mismatch or if you are familiar with the new host key or
  /// certificate on the instance. For more information, see
  /// [Troubleshooting connection issues when using the Amazon Lightsail browser-based SSH or RDP client](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-troubleshooting-browser-based-ssh-rdp-client-connection).
  ///
  /// [instanceName]: The name of the instance for which you want to reset the
  /// host key or certificate.
  Future<DeleteKnownHostKeysResult> deleteKnownHostKeys(
      String instanceName) async {
    return DeleteKnownHostKeysResult.fromJson({});
  }

  /// Deletes a Lightsail load balancer and all its associated SSL/TLS
  /// certificates. Once the load balancer is deleted, you will need to create a
  /// new load balancer, create a new certificate, and verify domain ownership
  /// again.
  ///
  /// The `delete load balancer` operation supports tag-based access control via
  /// resource tags applied to the resource identified by loadBalancerName. For
  /// more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [loadBalancerName]: The name of the load balancer you want to delete.
  Future<DeleteLoadBalancerResult> deleteLoadBalancer(
      String loadBalancerName) async {
    return DeleteLoadBalancerResult.fromJson({});
  }

  /// Deletes an SSL/TLS certificate associated with a Lightsail load balancer.
  ///
  /// The `delete load balancer tls certificate` operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// loadBalancerName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [loadBalancerName]: The load balancer name.
  ///
  /// [certificateName]: The SSL/TLS certificate name.
  ///
  /// [force]: When `true`, forces the deletion of an SSL/TLS certificate.
  ///
  /// There can be two certificates associated with a Lightsail load balancer:
  /// the primary and the backup. The `force` parameter is required when the
  /// primary SSL/TLS certificate is in use by an instance attached to the load
  /// balancer.
  Future<DeleteLoadBalancerTlsCertificateResult>
      deleteLoadBalancerTlsCertificate(
          {@required String loadBalancerName,
          @required String certificateName,
          bool force}) async {
    return DeleteLoadBalancerTlsCertificateResult.fromJson({});
  }

  /// Deletes a database in Amazon Lightsail.
  ///
  /// The `delete relational database` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [relationalDatabaseName]: The name of the database that you are deleting.
  ///
  /// [skipFinalSnapshot]: Determines whether a final database snapshot is
  /// created before your database is deleted. If `true` is specified, no
  /// database snapshot is created. If `false` is specified, a database snapshot
  /// is created before your database is deleted.
  ///
  /// You must specify the `final relational database snapshot name` parameter
  /// if the `skip final snapshot` parameter is `false`.
  ///
  /// Default: `false`
  ///
  /// [finalRelationalDatabaseSnapshotName]: The name of the database snapshot
  /// created if `skip final snapshot` is `false`, which is the default value
  /// for that parameter.
  ///
  ///  Specifying this parameter and also specifying the `skip final snapshot`
  /// parameter to `true` results in an error.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 2 to 255 alphanumeric characters, or hyphens.
  ///
  /// *   The first and last character must be a letter or number.
  Future<DeleteRelationalDatabaseResult> deleteRelationalDatabase(
      String relationalDatabaseName,
      {bool skipFinalSnapshot,
      String finalRelationalDatabaseSnapshotName}) async {
    return DeleteRelationalDatabaseResult.fromJson({});
  }

  /// Deletes a database snapshot in Amazon Lightsail.
  ///
  /// The `delete relational database snapshot` operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [relationalDatabaseSnapshotName]: The name of the database snapshot that
  /// you are deleting.
  Future<DeleteRelationalDatabaseSnapshotResult>
      deleteRelationalDatabaseSnapshot(
          String relationalDatabaseSnapshotName) async {
    return DeleteRelationalDatabaseSnapshotResult.fromJson({});
  }

  /// Detaches a stopped block storage disk from a Lightsail instance. Make sure
  /// to unmount any file systems on the device within your operating system
  /// before stopping the instance and detaching the disk.
  ///
  /// The `detach disk` operation supports tag-based access control via resource
  /// tags applied to the resource identified by diskName. For more information,
  /// see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [diskName]: The unique name of the disk you want to detach from your
  /// instance (e.g., `my-disk`).
  Future<DetachDiskResult> detachDisk(String diskName) async {
    return DetachDiskResult.fromJson({});
  }

  /// Detaches the specified instances from a Lightsail load balancer.
  ///
  /// This operation waits until the instances are no longer needed before they
  /// are detached from the load balancer.
  ///
  /// The `detach instances from load balancer` operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// loadBalancerName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [loadBalancerName]: The name of the Lightsail load balancer.
  ///
  /// [instanceNames]: An array of strings containing the names of the instances
  /// you want to detach from the load balancer.
  Future<DetachInstancesFromLoadBalancerResult> detachInstancesFromLoadBalancer(
      {@required String loadBalancerName,
      @required List<String> instanceNames}) async {
    return DetachInstancesFromLoadBalancerResult.fromJson({});
  }

  /// Detaches a static IP from the Amazon Lightsail instance to which it is
  /// attached.
  ///
  /// [staticIpName]: The name of the static IP to detach from the instance.
  Future<DetachStaticIpResult> detachStaticIp(String staticIpName) async {
    return DetachStaticIpResult.fromJson({});
  }

  /// Downloads the default SSH key pair from the user's account.
  Future<DownloadDefaultKeyPairResult> downloadDefaultKeyPair() async {
    return DownloadDefaultKeyPairResult.fromJson({});
  }

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
  /// For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  ///
  ///
  /// Use the `get instance snapshots` or `get disk snapshots` operations to get
  /// a list of snapshots that you can export to Amazon EC2.
  ///
  /// [sourceSnapshotName]: The name of the instance or disk snapshot to be
  /// exported to Amazon EC2.
  Future<ExportSnapshotResult> exportSnapshot(String sourceSnapshotName) async {
    return ExportSnapshotResult.fromJson({});
  }

  /// Returns the names of all active (not deleted) resources.
  ///
  /// [pageToken]: A token used for paginating results from your get active
  /// names request.
  Future<GetActiveNamesResult> getActiveNames({String pageToken}) async {
    return GetActiveNamesResult.fromJson({});
  }

  /// Returns the list of available instance images, or _blueprints_. You can
  /// use a blueprint to create a new virtual private server already running a
  /// specific operating system, as well as a preinstalled app or development
  /// stack. The software each instance is running depends on the blueprint
  /// image you choose.
  ///
  /// [includeInactive]: A Boolean value indicating whether to include inactive
  /// results in your request.
  ///
  /// [pageToken]: A token used for advancing to the next page of results from
  /// your get blueprints request.
  Future<GetBlueprintsResult> getBlueprints(
      {bool includeInactive, String pageToken}) async {
    return GetBlueprintsResult.fromJson({});
  }

  /// Returns the list of bundles that are available for purchase. A bundle
  /// describes the specs for your virtual private server (or _instance_).
  ///
  /// [includeInactive]: A Boolean value that indicates whether to include
  /// inactive bundle results in your request.
  ///
  /// [pageToken]: A token used for advancing to the next page of results from
  /// your get bundles request.
  Future<GetBundlesResult> getBundles(
      {bool includeInactive, String pageToken}) async {
    return GetBundlesResult.fromJson({});
  }

  /// Returns the CloudFormation stack record created as a result of the `create
  /// cloud formation stack` operation.
  ///
  /// An AWS CloudFormation stack is used to create a new Amazon EC2 instance
  /// from an exported Lightsail snapshot.
  ///
  /// [pageToken]: A token used for advancing to a specific page of results for
  /// your `get cloud formation stack records` request.
  Future<GetCloudFormationStackRecordsResult> getCloudFormationStackRecords(
      {String pageToken}) async {
    return GetCloudFormationStackRecordsResult.fromJson({});
  }

  /// Returns information about a specific block storage disk.
  ///
  /// [diskName]: The name of the disk (e.g., `my-disk`).
  Future<GetDiskResult> getDisk(String diskName) async {
    return GetDiskResult.fromJson({});
  }

  /// Returns information about a specific block storage disk snapshot.
  ///
  /// [diskSnapshotName]: The name of the disk snapshot (e.g.,
  /// `my-disk-snapshot`).
  Future<GetDiskSnapshotResult> getDiskSnapshot(String diskSnapshotName) async {
    return GetDiskSnapshotResult.fromJson({});
  }

  /// Returns information about all block storage disk snapshots in your AWS
  /// account and region.
  ///
  /// If you are describing a long list of disk snapshots, you can paginate the
  /// output to make the list more manageable. You can use the pageToken and
  /// nextPageToken values to retrieve the next items in the list.
  ///
  /// [pageToken]: A token used for advancing to the next page of results from
  /// your GetDiskSnapshots request.
  Future<GetDiskSnapshotsResult> getDiskSnapshots({String pageToken}) async {
    return GetDiskSnapshotsResult.fromJson({});
  }

  /// Returns information about all block storage disks in your AWS account and
  /// region.
  ///
  /// If you are describing a long list of disks, you can paginate the output to
  /// make the list more manageable. You can use the pageToken and nextPageToken
  /// values to retrieve the next items in the list.
  ///
  /// [pageToken]: A token used for advancing to the next page of results from
  /// your GetDisks request.
  Future<GetDisksResult> getDisks({String pageToken}) async {
    return GetDisksResult.fromJson({});
  }

  /// Returns information about a specific domain recordset.
  ///
  /// [domainName]: The domain name for which your want to return information
  /// about.
  Future<GetDomainResult> getDomain(String domainName) async {
    return GetDomainResult.fromJson({});
  }

  /// Returns a list of all domains in the user's account.
  ///
  /// [pageToken]: A token used for advancing to the next page of results from
  /// your get domains request.
  Future<GetDomainsResult> getDomains({String pageToken}) async {
    return GetDomainsResult.fromJson({});
  }

  /// Returns the export snapshot record created as a result of the `export
  /// snapshot` operation.
  ///
  /// An export snapshot record can be used to create a new Amazon EC2 instance
  /// and its related resources with the `create cloud formation stack`
  /// operation.
  ///
  /// [pageToken]: A token used for advancing to a specific page of results for
  /// your `get export snapshot records` request.
  Future<GetExportSnapshotRecordsResult> getExportSnapshotRecords(
      {String pageToken}) async {
    return GetExportSnapshotRecordsResult.fromJson({});
  }

  /// Returns information about a specific Amazon Lightsail instance, which is a
  /// virtual private server.
  ///
  /// [instanceName]: The name of the instance.
  Future<GetInstanceResult> getInstance(String instanceName) async {
    return GetInstanceResult.fromJson({});
  }

  /// Returns temporary SSH keys you can use to connect to a specific virtual
  /// private server, or _instance_.
  ///
  /// The `get instance access details` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// instanceName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [instanceName]: The name of the instance to access.
  ///
  /// [protocol]: The protocol to use to connect to your instance. Defaults to
  /// `ssh`.
  Future<GetInstanceAccessDetailsResult> getInstanceAccessDetails(
      String instanceName,
      {String protocol}) async {
    return GetInstanceAccessDetailsResult.fromJson({});
  }

  /// Returns the data points for the specified Amazon Lightsail instance
  /// metric, given an instance name.
  ///
  /// [instanceName]: The name of the instance for which you want to get metrics
  /// data.
  ///
  /// [metricName]: The metric name to get data about.
  ///
  /// [period]: The granularity, in seconds, of the returned data points.
  ///
  /// [startTime]: The start time of the time period.
  ///
  /// [endTime]: The end time of the time period.
  ///
  /// [unit]: The unit. The list of valid values is below.
  ///
  /// [statistics]: The instance statistics.
  Future<GetInstanceMetricDataResult> getInstanceMetricData(
      {@required String instanceName,
      @required String metricName,
      @required int period,
      @required DateTime startTime,
      @required DateTime endTime,
      @required String unit,
      @required List<String> statistics}) async {
    return GetInstanceMetricDataResult.fromJson({});
  }

  /// Returns the port states for a specific virtual private server, or
  /// _instance_.
  ///
  /// [instanceName]: The name of the instance.
  Future<GetInstancePortStatesResult> getInstancePortStates(
      String instanceName) async {
    return GetInstancePortStatesResult.fromJson({});
  }

  /// Returns information about a specific instance snapshot.
  ///
  /// [instanceSnapshotName]: The name of the snapshot for which you are
  /// requesting information.
  Future<GetInstanceSnapshotResult> getInstanceSnapshot(
      String instanceSnapshotName) async {
    return GetInstanceSnapshotResult.fromJson({});
  }

  /// Returns all instance snapshots for the user's account.
  ///
  /// [pageToken]: A token used for advancing to the next page of results from
  /// your get instance snapshots request.
  Future<GetInstanceSnapshotsResult> getInstanceSnapshots(
      {String pageToken}) async {
    return GetInstanceSnapshotsResult.fromJson({});
  }

  /// Returns the state of a specific instance. Works on one instance at a time.
  ///
  /// [instanceName]: The name of the instance to get state information about.
  Future<GetInstanceStateResult> getInstanceState(String instanceName) async {
    return GetInstanceStateResult.fromJson({});
  }

  /// Returns information about all Amazon Lightsail virtual private servers, or
  /// _instances_.
  ///
  /// [pageToken]: A token used for advancing to the next page of results from
  /// your get instances request.
  Future<GetInstancesResult> getInstances({String pageToken}) async {
    return GetInstancesResult.fromJson({});
  }

  /// Returns information about a specific key pair.
  ///
  /// [keyPairName]: The name of the key pair for which you are requesting
  /// information.
  Future<GetKeyPairResult> getKeyPair(String keyPairName) async {
    return GetKeyPairResult.fromJson({});
  }

  /// Returns information about all key pairs in the user's account.
  ///
  /// [pageToken]: A token used for advancing to the next page of results from
  /// your get key pairs request.
  Future<GetKeyPairsResult> getKeyPairs({String pageToken}) async {
    return GetKeyPairsResult.fromJson({});
  }

  /// Returns information about the specified Lightsail load balancer.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  Future<GetLoadBalancerResult> getLoadBalancer(String loadBalancerName) async {
    return GetLoadBalancerResult.fromJson({});
  }

  /// Returns information about health metrics for your Lightsail load balancer.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [metricName]: The metric about which you want to return information. Valid
  /// values are listed below, along with the most useful `statistics` to
  /// include in your request.
  ///
  /// *     **`ClientTLSNegotiationErrorCount`**  - The number of TLS
  /// connections initiated by the client that did not establish a session with
  /// the load balancer. Possible causes include a mismatch of ciphers or
  /// protocols.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`.
  ///
  /// *     **`HealthyHostCount`**  - The number of target instances that are
  /// considered healthy.
  ///
  ///      `Statistics`: The most useful statistic are `Average`, `Minimum`, and
  /// `Maximum`.
  ///
  /// *     **`UnhealthyHostCount`**  - The number of target instances that are
  /// considered unhealthy.
  ///
  ///      `Statistics`: The most useful statistic are `Average`, `Minimum`, and
  /// `Maximum`.
  ///
  /// *     **`HTTPCode_LB_4XX_Count`**  - The number of HTTP 4XX client error
  /// codes that originate from the load balancer. Client errors are generated
  /// when requests are malformed or incomplete. These requests have not been
  /// received by the target instance. This count does not include any response
  /// codes generated by the target instances.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`.
  ///
  /// *     **`HTTPCode_LB_5XX_Count`**  - The number of HTTP 5XX server error
  /// codes that originate from the load balancer. This count does not include
  /// any response codes generated by the target instances.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`. Note that `Minimum`,
  /// `Maximum`, and `Average` all return `1`.
  ///
  /// *     **`HTTPCode_Instance_2XX_Count`**  - The number of HTTP response
  /// codes generated by the target instances. This does not include any
  /// response codes generated by the load balancer.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`.
  ///
  /// *     **`HTTPCode_Instance_3XX_Count`**  - The number of HTTP response
  /// codes generated by the target instances. This does not include any
  /// response codes generated by the load balancer.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`.
  ///
  /// *     **`HTTPCode_Instance_4XX_Count`**  - The number of HTTP response
  /// codes generated by the target instances. This does not include any
  /// response codes generated by the load balancer.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`.
  ///
  /// *     **`HTTPCode_Instance_5XX_Count`**  - The number of HTTP response
  /// codes generated by the target instances. This does not include any
  /// response codes generated by the load balancer.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`.
  ///
  /// *     **`InstanceResponseTime`**  - The time elapsed, in seconds, after
  /// the request leaves the load balancer until a response from the target
  /// instance is received.
  ///
  ///      `Statistics`: The most useful statistic is `Average`.
  ///
  /// *     **`RejectedConnectionCount`**  - The number of connections that were
  /// rejected because the load balancer had reached its maximum number of
  /// connections.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`.
  ///
  /// *     **`RequestCount`**  - The number of requests processed over IPv4.
  /// This count includes only the requests with a response generated by a
  /// target instance of the load balancer.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`.
  ///
  /// [period]: The granularity, in seconds, of the returned data points.
  ///
  /// [startTime]: The start time of the period.
  ///
  /// [endTime]: The end time of the period.
  ///
  /// [unit]: The unit for the time period request. Valid values are listed
  /// below.
  ///
  /// [statistics]: An array of statistics that you want to request metrics for.
  /// Valid values are listed below.
  ///
  /// *     **`SampleCount`**  - The count (number) of data points used for the
  /// statistical calculation.
  ///
  /// *     **`Average`**  - The value of Sum / SampleCount during the specified
  /// period. By comparing this statistic with the Minimum and Maximum, you can
  /// determine the full scope of a metric and how close the average use is to
  /// the Minimum and Maximum. This comparison helps you to know when to
  /// increase or decrease your resources as needed.
  ///
  /// *     **`Sum`**  - All values submitted for the matching metric added
  /// together. This statistic can be useful for determining the total volume of
  /// a metric.
  ///
  /// *     **`Minimum`**  - The lowest value observed during the specified
  /// period. You can use this value to determine low volumes of activity for
  /// your application.
  ///
  /// *     **`Maximum`**  - The highest value observed during the specified
  /// period. You can use this value to determine high volumes of activity for
  /// your application.
  Future<GetLoadBalancerMetricDataResult> getLoadBalancerMetricData(
      {@required String loadBalancerName,
      @required String metricName,
      @required int period,
      @required DateTime startTime,
      @required DateTime endTime,
      @required String unit,
      @required List<String> statistics}) async {
    return GetLoadBalancerMetricDataResult.fromJson({});
  }

  /// Returns information about the TLS certificates that are associated with
  /// the specified Lightsail load balancer.
  ///
  /// TLS is just an updated, more secure version of Secure Socket Layer (SSL).
  ///
  /// You can have a maximum of 2 certificates associated with a Lightsail load
  /// balancer. One is active and the other is inactive.
  ///
  /// [loadBalancerName]: The name of the load balancer you associated with your
  /// SSL/TLS certificate.
  Future<GetLoadBalancerTlsCertificatesResult> getLoadBalancerTlsCertificates(
      String loadBalancerName) async {
    return GetLoadBalancerTlsCertificatesResult.fromJson({});
  }

  /// Returns information about all load balancers in an account.
  ///
  /// If you are describing a long list of load balancers, you can paginate the
  /// output to make the list more manageable. You can use the pageToken and
  /// nextPageToken values to retrieve the next items in the list.
  ///
  /// [pageToken]: A token used for paginating the results from your
  /// GetLoadBalancers request.
  Future<GetLoadBalancersResult> getLoadBalancers({String pageToken}) async {
    return GetLoadBalancersResult.fromJson({});
  }

  /// Returns information about a specific operation. Operations include events
  /// such as when you create an instance, allocate a static IP, attach a static
  /// IP, and so on.
  ///
  /// [operationId]: A GUID used to identify the operation.
  Future<GetOperationResult> getOperation(String operationId) async {
    return GetOperationResult.fromJson({});
  }

  /// Returns information about all operations.
  ///
  /// Results are returned from oldest to newest, up to a maximum of 200.
  /// Results can be paged by making each subsequent call to `GetOperations` use
  /// the maximum (last) `statusChangedAt` value from the previous request.
  ///
  /// [pageToken]: A token used for advancing to the next page of results from
  /// your get operations request.
  Future<GetOperationsResult> getOperations({String pageToken}) async {
    return GetOperationsResult.fromJson({});
  }

  /// Gets operations for a specific resource (e.g., an instance or a static
  /// IP).
  ///
  /// [resourceName]: The name of the resource for which you are requesting
  /// information.
  ///
  /// [pageToken]: A token used for advancing to the next page of results from
  /// your get operations for resource request.
  Future<GetOperationsForResourceResult> getOperationsForResource(
      String resourceName,
      {String pageToken}) async {
    return GetOperationsForResourceResult.fromJson({});
  }

  /// Returns a list of all valid regions for Amazon Lightsail. Use the `include
  /// availability zones` parameter to also return the Availability Zones in a
  /// region.
  ///
  /// [includeAvailabilityZones]: A Boolean value indicating whether to also
  /// include Availability Zones in your get regions request. Availability Zones
  /// are indicated with a letter: e.g., `us-east-2a`.
  ///
  /// [includeRelationalDatabaseAvailabilityZones]: >A Boolean value indicating
  /// whether to also include Availability Zones for databases in your get
  /// regions request. Availability Zones are indicated with a letter (e.g.,
  /// `us-east-2a`).
  Future<GetRegionsResult> getRegions(
      {bool includeAvailabilityZones,
      bool includeRelationalDatabaseAvailabilityZones}) async {
    return GetRegionsResult.fromJson({});
  }

  /// Returns information about a specific database in Amazon Lightsail.
  ///
  /// [relationalDatabaseName]: The name of the database that you are looking
  /// up.
  Future<GetRelationalDatabaseResult> getRelationalDatabase(
      String relationalDatabaseName) async {
    return GetRelationalDatabaseResult.fromJson({});
  }

  /// Returns a list of available database blueprints in Amazon Lightsail. A
  /// blueprint describes the major engine version of a database.
  ///
  /// You can use a blueprint ID to create a new database that runs a specific
  /// database engine.
  ///
  /// [pageToken]: A token used for advancing to a specific page of results for
  /// your `get relational database blueprints` request.
  Future<GetRelationalDatabaseBlueprintsResult> getRelationalDatabaseBlueprints(
      {String pageToken}) async {
    return GetRelationalDatabaseBlueprintsResult.fromJson({});
  }

  /// Returns the list of bundles that are available in Amazon Lightsail. A
  /// bundle describes the performance specifications for a database.
  ///
  /// You can use a bundle ID to create a new database with explicit performance
  /// specifications.
  ///
  /// [pageToken]: A token used for advancing to a specific page of results for
  /// your `get relational database bundles` request.
  Future<GetRelationalDatabaseBundlesResult> getRelationalDatabaseBundles(
      {String pageToken}) async {
    return GetRelationalDatabaseBundlesResult.fromJson({});
  }

  /// Returns a list of events for a specific database in Amazon Lightsail.
  ///
  /// [relationalDatabaseName]: The name of the database from which to get
  /// events.
  ///
  /// [durationInMinutes]: The number of minutes in the past from which to
  /// retrieve events. For example, to get all events from the past 2 hours,
  /// enter 120.
  ///
  /// Default: `60`
  ///
  /// The minimum is 1 and the maximum is 14 days (20160 minutes).
  ///
  /// [pageToken]: A token used for advancing to a specific page of results from
  /// for get relational database events request.
  Future<GetRelationalDatabaseEventsResult> getRelationalDatabaseEvents(
      String relationalDatabaseName,
      {int durationInMinutes,
      String pageToken}) async {
    return GetRelationalDatabaseEventsResult.fromJson({});
  }

  /// Returns a list of log events for a database in Amazon Lightsail.
  ///
  /// [relationalDatabaseName]: The name of your database for which to get log
  /// events.
  ///
  /// [logStreamName]: The name of the log stream.
  ///
  /// Use the `get relational database log streams` operation to get a list of
  /// available log streams.
  ///
  /// [startTime]: The start of the time interval from which to get log events.
  ///
  /// Constraints:
  ///
  /// *   Specified in Universal Coordinated Time (UTC).
  ///
  /// *   Specified in the Unix time format.
  ///
  ///     For example, if you wish to use a start time of October 1, 2018, at 8
  /// PM UTC, then you input `1538424000` as the start time.
  ///
  /// [endTime]: The end of the time interval from which to get log events.
  ///
  /// Constraints:
  ///
  /// *   Specified in Universal Coordinated Time (UTC).
  ///
  /// *   Specified in the Unix time format.
  ///
  ///     For example, if you wish to use an end time of October 1, 2018, at 8
  /// PM UTC, then you input `1538424000` as the end time.
  ///
  /// [startFromHead]: Parameter to specify if the log should start from head or
  /// tail. If `true` is specified, the log event starts from the head of the
  /// log. If `false` is specified, the log event starts from the tail of the
  /// log.
  ///
  /// Default: `false`
  ///
  /// [pageToken]: A token used for advancing to a specific page of results for
  /// your `get relational database log events` request.
  Future<GetRelationalDatabaseLogEventsResult> getRelationalDatabaseLogEvents(
      {@required String relationalDatabaseName,
      @required String logStreamName,
      DateTime startTime,
      DateTime endTime,
      bool startFromHead,
      String pageToken}) async {
    return GetRelationalDatabaseLogEventsResult.fromJson({});
  }

  /// Returns a list of available log streams for a specific database in Amazon
  /// Lightsail.
  ///
  /// [relationalDatabaseName]: The name of your database for which to get log
  /// streams.
  Future<GetRelationalDatabaseLogStreamsResult> getRelationalDatabaseLogStreams(
      String relationalDatabaseName) async {
    return GetRelationalDatabaseLogStreamsResult.fromJson({});
  }

  /// Returns the current, previous, or pending versions of the master user
  /// password for a Lightsail database.
  ///
  /// The `asdf` operation GetRelationalDatabaseMasterUserPassword supports
  /// tag-based access control via resource tags applied to the resource
  /// identified by relationalDatabaseName.
  ///
  /// [relationalDatabaseName]: The name of your database for which to get the
  /// master user password.
  ///
  /// [passwordVersion]: The password version to return.
  ///
  /// Specifying `CURRENT` or `PREVIOUS` returns the current or previous
  /// passwords respectively. Specifying `PENDING` returns the newest version of
  /// the password that will rotate to `CURRENT`. After the `PENDING` password
  /// rotates to `CURRENT`, the `PENDING` password is no longer available.
  ///
  /// Default: `CURRENT`
  Future<GetRelationalDatabaseMasterUserPasswordResult>
      getRelationalDatabaseMasterUserPassword(String relationalDatabaseName,
          {String passwordVersion}) async {
    return GetRelationalDatabaseMasterUserPasswordResult.fromJson({});
  }

  /// Returns the data points of the specified metric for a database in Amazon
  /// Lightsail.
  ///
  /// [relationalDatabaseName]: The name of your database from which to get
  /// metric data.
  ///
  /// [metricName]: The name of the metric data to return.
  ///
  /// [period]: The granularity, in seconds, of the returned data points.
  ///
  /// [startTime]: The start of the time interval from which to get metric data.
  ///
  /// Constraints:
  ///
  /// *   Specified in Universal Coordinated Time (UTC).
  ///
  /// *   Specified in the Unix time format.
  ///
  ///     For example, if you wish to use a start time of October 1, 2018, at 8
  /// PM UTC, then you input `1538424000` as the start time.
  ///
  /// [endTime]: The end of the time interval from which to get metric data.
  ///
  /// Constraints:
  ///
  /// *   Specified in Universal Coordinated Time (UTC).
  ///
  /// *   Specified in the Unix time format.
  ///
  ///     For example, if you wish to use an end time of October 1, 2018, at 8
  /// PM UTC, then you input `1538424000` as the end time.
  ///
  /// [unit]: The unit for the metric data request.
  ///
  /// [statistics]: The array of statistics for your metric data request.
  Future<GetRelationalDatabaseMetricDataResult> getRelationalDatabaseMetricData(
      {@required String relationalDatabaseName,
      @required String metricName,
      @required int period,
      @required DateTime startTime,
      @required DateTime endTime,
      @required String unit,
      @required List<String> statistics}) async {
    return GetRelationalDatabaseMetricDataResult.fromJson({});
  }

  /// Returns all of the runtime parameters offered by the underlying database
  /// software, or engine, for a specific database in Amazon Lightsail.
  ///
  /// In addition to the parameter names and values, this operation returns
  /// other information about each parameter. This information includes whether
  /// changes require a reboot, whether the parameter is modifiable, the allowed
  /// values, and the data types.
  ///
  /// [relationalDatabaseName]: The name of your database for which to get
  /// parameters.
  ///
  /// [pageToken]: A token used for advancing to a specific page of results for
  /// your `get relational database parameters` request.
  Future<GetRelationalDatabaseParametersResult> getRelationalDatabaseParameters(
      String relationalDatabaseName,
      {String pageToken}) async {
    return GetRelationalDatabaseParametersResult.fromJson({});
  }

  /// Returns information about a specific database snapshot in Amazon
  /// Lightsail.
  ///
  /// [relationalDatabaseSnapshotName]: The name of the database snapshot for
  /// which to get information.
  Future<GetRelationalDatabaseSnapshotResult> getRelationalDatabaseSnapshot(
      String relationalDatabaseSnapshotName) async {
    return GetRelationalDatabaseSnapshotResult.fromJson({});
  }

  /// Returns information about all of your database snapshots in Amazon
  /// Lightsail.
  ///
  /// [pageToken]: A token used for advancing to a specific page of results for
  /// your `get relational database snapshots` request.
  Future<GetRelationalDatabaseSnapshotsResult> getRelationalDatabaseSnapshots(
      {String pageToken}) async {
    return GetRelationalDatabaseSnapshotsResult.fromJson({});
  }

  /// Returns information about all of your databases in Amazon Lightsail.
  ///
  /// [pageToken]: A token used for advancing to a specific page of results for
  /// your `get relational database` request.
  Future<GetRelationalDatabasesResult> getRelationalDatabases(
      {String pageToken}) async {
    return GetRelationalDatabasesResult.fromJson({});
  }

  /// Returns information about a specific static IP.
  ///
  /// [staticIpName]: The name of the static IP in Lightsail.
  Future<GetStaticIpResult> getStaticIp(String staticIpName) async {
    return GetStaticIpResult.fromJson({});
  }

  /// Returns information about all static IPs in the user's account.
  ///
  /// [pageToken]: A token used for advancing to the next page of results from
  /// your get static IPs request.
  Future<GetStaticIpsResult> getStaticIps({String pageToken}) async {
    return GetStaticIpsResult.fromJson({});
  }

  /// Imports a public SSH key from a specific key pair.
  ///
  /// [keyPairName]: The name of the key pair for which you want to import the
  /// public key.
  ///
  /// [publicKeyBase64]: A base64-encoded public key of the `ssh-rsa` type.
  Future<ImportKeyPairResult> importKeyPair(
      {@required String keyPairName, @required String publicKeyBase64}) async {
    return ImportKeyPairResult.fromJson({});
  }

  /// Returns a Boolean value indicating whether your Lightsail VPC is peered.
  Future<IsVpcPeeredResult> isVpcPeered() async {
    return IsVpcPeeredResult.fromJson({});
  }

  /// Adds public ports to an Amazon Lightsail instance.
  ///
  /// The `open instance public ports` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// instanceName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [portInfo]: An array of key-value pairs containing information about the
  /// port mappings.
  ///
  /// [instanceName]: The name of the instance for which you want to open the
  /// public ports.
  Future<OpenInstancePublicPortsResult> openInstancePublicPorts(
      {@required PortInfo portInfo, @required String instanceName}) async {
    return OpenInstancePublicPortsResult.fromJson({});
  }

  /// Tries to peer the Lightsail VPC with the user's default VPC.
  Future<PeerVpcResult> peerVpc() async {
    return PeerVpcResult.fromJson({});
  }

  /// Sets the specified open ports for an Amazon Lightsail instance, and closes
  /// all ports for every protocol not included in the current request.
  ///
  /// The `put instance public ports` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// instanceName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [portInfos]: Specifies information about the public port(s).
  ///
  /// [instanceName]: The Lightsail instance name of the public port(s) you are
  /// setting.
  Future<PutInstancePublicPortsResult> putInstancePublicPorts(
      {@required List<PortInfo> portInfos,
      @required String instanceName}) async {
    return PutInstancePublicPortsResult.fromJson({});
  }

  /// Restarts a specific instance.
  ///
  /// The `reboot instance` operation supports tag-based access control via
  /// resource tags applied to the resource identified by instanceName. For more
  /// information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [instanceName]: The name of the instance to reboot.
  Future<RebootInstanceResult> rebootInstance(String instanceName) async {
    return RebootInstanceResult.fromJson({});
  }

  /// Restarts a specific database in Amazon Lightsail.
  ///
  /// The `reboot relational database` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [relationalDatabaseName]: The name of your database to reboot.
  Future<RebootRelationalDatabaseResult> rebootRelationalDatabase(
      String relationalDatabaseName) async {
    return RebootRelationalDatabaseResult.fromJson({});
  }

  /// Deletes a specific static IP from your account.
  ///
  /// [staticIpName]: The name of the static IP to delete.
  Future<ReleaseStaticIpResult> releaseStaticIp(String staticIpName) async {
    return ReleaseStaticIpResult.fromJson({});
  }

  /// Starts a specific Amazon Lightsail instance from a stopped state. To
  /// restart an instance, use the `reboot instance` operation.
  ///
  ///  When you start a stopped instance, Lightsail assigns a new public IP
  /// address to the instance. To use the same IP address after stopping and
  /// starting an instance, create a static IP address and attach it to the
  /// instance. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip).
  ///
  ///
  /// The `start instance` operation supports tag-based access control via
  /// resource tags applied to the resource identified by instanceName. For more
  /// information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [instanceName]: The name of the instance (a virtual private server) to
  /// start.
  Future<StartInstanceResult> startInstance(String instanceName) async {
    return StartInstanceResult.fromJson({});
  }

  /// Starts a specific database from a stopped state in Amazon Lightsail. To
  /// restart a database, use the `reboot relational database` operation.
  ///
  /// The `start relational database` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [relationalDatabaseName]: The name of your database to start.
  Future<StartRelationalDatabaseResult> startRelationalDatabase(
      String relationalDatabaseName) async {
    return StartRelationalDatabaseResult.fromJson({});
  }

  /// Stops a specific Amazon Lightsail instance that is currently running.
  ///
  ///  When you start a stopped instance, Lightsail assigns a new public IP
  /// address to the instance. To use the same IP address after stopping and
  /// starting an instance, create a static IP address and attach it to the
  /// instance. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip).
  ///
  ///
  /// The `stop instance` operation supports tag-based access control via
  /// resource tags applied to the resource identified by instanceName. For more
  /// information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [instanceName]: The name of the instance (a virtual private server) to
  /// stop.
  ///
  /// [force]: When set to `True`, forces a Lightsail instance that is stuck in
  /// a `stopping` state to stop.
  ///
  ///
  ///
  /// Only use the `force` parameter if your instance is stuck in the `stopping`
  /// state. In any other state, your instance should stop normally without
  /// adding this parameter to your API request.
  Future<StopInstanceResult> stopInstance(String instanceName,
      {bool force}) async {
    return StopInstanceResult.fromJson({});
  }

  /// Stops a specific database that is currently running in Amazon Lightsail.
  ///
  /// The `stop relational database` operation supports tag-based access control
  /// via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [relationalDatabaseName]: The name of your database to stop.
  ///
  /// [relationalDatabaseSnapshotName]: The name of your new database snapshot
  /// to be created before stopping your database.
  Future<StopRelationalDatabaseResult> stopRelationalDatabase(
      String relationalDatabaseName,
      {String relationalDatabaseSnapshotName}) async {
    return StopRelationalDatabaseResult.fromJson({});
  }

  /// Adds one or more tags to the specified Amazon Lightsail resource. Each
  /// resource can have a maximum of 50 tags. Each tag consists of a key and an
  /// optional value. Tag keys must be unique per resource. For more information
  /// about tags, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags).
  ///
  /// The `tag resource` operation supports tag-based access control via request
  /// tags and resource tags applied to the resource identified by resourceName.
  /// For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [resourceName]: The name of the resource to which you are adding tags.
  ///
  /// [tags]: The tag key and optional value.
  Future<TagResourceResult> tagResource(
      {@required String resourceName, @required List<Tag> tags}) async {
    return TagResourceResult.fromJson({});
  }

  /// Attempts to unpeer the Lightsail VPC from the user's default VPC.
  Future<UnpeerVpcResult> unpeerVpc() async {
    return UnpeerVpcResult.fromJson({});
  }

  /// Deletes the specified set of tag keys and their values from the specified
  /// Amazon Lightsail resource.
  ///
  /// The `untag resource` operation supports tag-based access control via
  /// request tags and resource tags applied to the resource identified by
  /// resourceName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [resourceName]: The name of the resource from which you are removing a
  /// tag.
  ///
  /// [tagKeys]: The tag keys to delete from the specified resource.
  Future<UntagResourceResult> untagResource(
      {@required String resourceName, @required List<String> tagKeys}) async {
    return UntagResourceResult.fromJson({});
  }

  /// Updates a domain recordset after it is created.
  ///
  /// The `update domain entry` operation supports tag-based access control via
  /// resource tags applied to the resource identified by domainName. For more
  /// information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [domainName]: The name of the domain recordset to update.
  ///
  /// [domainEntry]: An array of key-value pairs containing information about
  /// the domain entry.
  Future<UpdateDomainEntryResult> updateDomainEntry(
      {@required String domainName, @required DomainEntry domainEntry}) async {
    return UpdateDomainEntryResult.fromJson({});
  }

  /// Updates the specified attribute for a load balancer. You can only update
  /// one attribute at a time.
  ///
  /// The `update load balancer attribute` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// loadBalancerName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [loadBalancerName]: The name of the load balancer that you want to modify
  /// (e.g., `my-load-balancer`.
  ///
  /// [attributeName]: The name of the attribute you want to update. Valid
  /// values are below.
  ///
  /// [attributeValue]: The value that you want to specify for the attribute
  /// name.
  Future<UpdateLoadBalancerAttributeResult> updateLoadBalancerAttribute(
      {@required String loadBalancerName,
      @required String attributeName,
      @required String attributeValue}) async {
    return UpdateLoadBalancerAttributeResult.fromJson({});
  }

  /// Allows the update of one or more attributes of a database in Amazon
  /// Lightsail.
  ///
  /// Updates are applied immediately, or in cases where the updates could
  /// result in an outage, are applied during the database's predefined
  /// maintenance window.
  ///
  /// The `update relational database` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [relationalDatabaseName]: The name of your database to update.
  ///
  /// [masterUserPassword]: The password for the master user of your database.
  /// The password can include any printable ASCII character except "/", """, or
  /// "@".
  ///
  /// Constraints: Must contain 8 to 41 characters.
  ///
  /// [rotateMasterUserPassword]: When `true`, the master user password is
  /// changed to a new strong password generated by Lightsail.
  ///
  /// Use the `get relational database master user password` operation to get
  /// the new password.
  ///
  /// [preferredBackupWindow]: The daily time range during which automated
  /// backups are created for your database if automated backups are enabled.
  ///
  /// Constraints:
  ///
  /// *   Must be in the `hh24:mi-hh24:mi` format.
  ///
  ///     Example: `16:00-16:30`
  ///
  /// *   Specified in Universal Coordinated Time (UTC).
  ///
  /// *   Must not conflict with the preferred maintenance window.
  ///
  /// *   Must be at least 30 minutes.
  ///
  /// [preferredMaintenanceWindow]: The weekly time range during which system
  /// maintenance can occur on your database.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region, occurring on a random day of the week.
  ///
  /// Constraints:
  ///
  /// *   Must be in the `ddd:hh24:mi-ddd:hh24:mi` format.
  ///
  /// *   Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// *   Must be at least 30 minutes.
  ///
  /// *   Specified in Universal Coordinated Time (UTC).
  ///
  /// *   Example: `Tue:17:00-Tue:17:30`
  ///
  /// [enableBackupRetention]: When `true`, enables automated backup retention
  /// for your database.
  ///
  /// Updates are applied during the next maintenance window because this can
  /// result in an outage.
  ///
  /// [disableBackupRetention]: When `true`, disables automated backup retention
  /// for your database.
  ///
  /// Disabling backup retention deletes all automated database backups. Before
  /// disabling this, you may want to create a snapshot of your database using
  /// the `create relational database snapshot` operation.
  ///
  /// Updates are applied during the next maintenance window because this can
  /// result in an outage.
  ///
  /// [publiclyAccessible]: Specifies the accessibility options for your
  /// database. A value of `true` specifies a database that is available to
  /// resources outside of your Lightsail account. A value of `false` specifies
  /// a database that is available only to your Lightsail resources in the same
  /// region as your database.
  ///
  /// [applyImmediately]: When `true`, applies changes immediately. When
  /// `false`, applies changes during the preferred maintenance window. Some
  /// changes may cause an outage.
  ///
  /// Default: `false`
  Future<UpdateRelationalDatabaseResult> updateRelationalDatabase(
      String relationalDatabaseName,
      {String masterUserPassword,
      bool rotateMasterUserPassword,
      String preferredBackupWindow,
      String preferredMaintenanceWindow,
      bool enableBackupRetention,
      bool disableBackupRetention,
      bool publiclyAccessible,
      bool applyImmediately}) async {
    return UpdateRelationalDatabaseResult.fromJson({});
  }

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
  /// relationalDatabaseName. For more information, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  /// [relationalDatabaseName]: The name of your database for which to update
  /// parameters.
  ///
  /// [parameters]: The database parameters to update.
  Future<UpdateRelationalDatabaseParametersResult>
      updateRelationalDatabaseParameters(
          {@required String relationalDatabaseName,
          @required List<RelationalDatabaseParameter> parameters}) async {
    return UpdateRelationalDatabaseParametersResult.fromJson({});
  }
}

class AllocateStaticIpResult {
  /// An array of key-value pairs containing information about the static IP
  /// address you allocated.
  final List<Operation> operations;

  AllocateStaticIpResult({
    this.operations,
  });
  static AllocateStaticIpResult fromJson(Map<String, dynamic> json) =>
      AllocateStaticIpResult();
}

class AttachDiskResult {
  /// An object describing the API operations.
  final List<Operation> operations;

  AttachDiskResult({
    this.operations,
  });
  static AttachDiskResult fromJson(Map<String, dynamic> json) =>
      AttachDiskResult();
}

class AttachInstancesToLoadBalancerResult {
  /// An object representing the API operations.
  final List<Operation> operations;

  AttachInstancesToLoadBalancerResult({
    this.operations,
  });
  static AttachInstancesToLoadBalancerResult fromJson(
          Map<String, dynamic> json) =>
      AttachInstancesToLoadBalancerResult();
}

class AttachLoadBalancerTlsCertificateResult {
  /// An object representing the API operations.
  ///
  /// These SSL/TLS certificates are only usable by Lightsail load balancers.
  /// You can't get the certificate and use it for another purpose.
  final List<Operation> operations;

  AttachLoadBalancerTlsCertificateResult({
    this.operations,
  });
  static AttachLoadBalancerTlsCertificateResult fromJson(
          Map<String, dynamic> json) =>
      AttachLoadBalancerTlsCertificateResult();
}

class AttachStaticIpResult {
  /// An array of key-value pairs containing information about your API
  /// operations.
  final List<Operation> operations;

  AttachStaticIpResult({
    this.operations,
  });
  static AttachStaticIpResult fromJson(Map<String, dynamic> json) =>
      AttachStaticIpResult();
}

/// Describes an Availability Zone.
class AvailabilityZone {
  /// The name of the Availability Zone. The format is `us-east-2a`
  /// (case-sensitive).
  final String zoneName;

  /// The state of the Availability Zone.
  final String state;

  AvailabilityZone({
    this.zoneName,
    this.state,
  });
  static AvailabilityZone fromJson(Map<String, dynamic> json) =>
      AvailabilityZone();
}

/// Describes a blueprint (a virtual private server image).
class Blueprint {
  /// The ID for the virtual private server image (e.g., `app_wordpress_4_4` or
  /// `app_lamp_7_0`).
  final String blueprintId;

  /// The friendly name of the blueprint (e.g., `Amazon Linux`).
  final String name;

  /// The group name of the blueprint (e.g., `amazon-linux`).
  final String group;

  /// The type of the blueprint (e.g., `os` or `app`).
  final String type;

  /// The description of the blueprint.
  final String description;

  /// A Boolean value indicating whether the blueprint is active. Inactive
  /// blueprints are listed to support customers with existing instances but are
  /// not necessarily available for launch of new instances. Blueprints are
  /// marked inactive when they become outdated due to operating system updates
  /// or new application releases.
  final bool isActive;

  /// The minimum bundle power required to run this blueprint. For example, you
  /// need a bundle with a power value of 500 or more to create an instance that
  /// uses a blueprint with a minimum power value of 500. `0` indicates that the
  /// blueprint runs on all instance sizes.
  final int minPower;

  /// The version number of the operating system, application, or stack (e.g.,
  /// `2016.03.0`).
  final String version;

  /// The version code.
  final String versionCode;

  /// The product URL to learn more about the image or blueprint.
  final String productUrl;

  /// The end-user license agreement URL for the image or blueprint.
  final String licenseUrl;

  /// The operating system platform (either Linux/Unix-based or Windows
  /// Server-based) of the blueprint.
  final String platform;

  Blueprint({
    this.blueprintId,
    this.name,
    this.group,
    this.type,
    this.description,
    this.isActive,
    this.minPower,
    this.version,
    this.versionCode,
    this.productUrl,
    this.licenseUrl,
    this.platform,
  });
  static Blueprint fromJson(Map<String, dynamic> json) => Blueprint();
}

/// Describes a bundle, which is a set of specs describing your virtual private
/// server (or _instance_).
class Bundle {
  /// The price in US dollars (e.g., `5.0`).
  final double price;

  /// The number of vCPUs included in the bundle (e.g., `2`).
  final int cpuCount;

  /// The size of the SSD (e.g., `30`).
  final int diskSizeInGb;

  /// The bundle ID (e.g., `micro_1_0`).
  final String bundleId;

  /// The Amazon EC2 instance type (e.g., `t2.micro`).
  final String instanceType;

  /// A Boolean value indicating whether the bundle is active.
  final bool isActive;

  /// A friendly name for the bundle (e.g., `Micro`).
  final String name;

  /// A numeric value that represents the power of the bundle (e.g., `500`). You
  /// can use the bundle's power value in conjunction with a blueprint's minimum
  /// power value to determine whether the blueprint will run on the bundle. For
  /// example, you need a bundle with a power value of 500 or more to create an
  /// instance that uses a blueprint with a minimum power value of 500.
  final int power;

  /// The amount of RAM in GB (e.g., `2.0`).
  final double ramSizeInGb;

  /// The data transfer rate per month in GB (e.g., `2000`).
  final int transferPerMonthInGb;

  /// The operating system platform (Linux/Unix-based or Windows Server-based)
  /// that the bundle supports. You can only launch a `WINDOWS` bundle on a
  /// blueprint that supports the `WINDOWS` platform. `LINUX_UNIX` blueprints
  /// require a `LINUX_UNIX` bundle.
  final List<String> supportedPlatforms;

  Bundle({
    this.price,
    this.cpuCount,
    this.diskSizeInGb,
    this.bundleId,
    this.instanceType,
    this.isActive,
    this.name,
    this.power,
    this.ramSizeInGb,
    this.transferPerMonthInGb,
    this.supportedPlatforms,
  });
  static Bundle fromJson(Map<String, dynamic> json) => Bundle();
}

class CloseInstancePublicPortsResult {
  /// An array of key-value pairs that contains information about the operation.
  final Operation operation;

  CloseInstancePublicPortsResult({
    this.operation,
  });
  static CloseInstancePublicPortsResult fromJson(Map<String, dynamic> json) =>
      CloseInstancePublicPortsResult();
}

/// Describes a CloudFormation stack record created as a result of the `create
/// cloud formation stack` operation.
///
/// A CloudFormation stack record provides information about the AWS
/// CloudFormation stack used to create a new Amazon Elastic Compute Cloud
/// instance from an exported Lightsail instance snapshot.
class CloudFormationStackRecord {
  /// The name of the CloudFormation stack record. It starts with
  /// `CloudFormationStackRecord` followed by a GUID.
  final String name;

  /// The Amazon Resource Name (ARN) of the CloudFormation stack record.
  final String arn;

  /// The date when the CloudFormation stack record was created.
  final DateTime createdAt;

  /// A list of objects describing the Availability Zone and AWS Region of the
  /// CloudFormation stack record.
  final ResourceLocation location;

  /// The Lightsail resource type (e.g., `CloudFormationStackRecord`).
  final String resourceType;

  /// The current state of the CloudFormation stack record.
  final String state;

  /// A list of objects describing the source of the CloudFormation stack
  /// record.
  final List<CloudFormationStackRecordSourceInfo> sourceInfo;

  /// A list of objects describing the destination service, which is AWS
  /// CloudFormation, and the Amazon Resource Name (ARN) of the AWS
  /// CloudFormation stack.
  final DestinationInfo destinationInfo;

  CloudFormationStackRecord({
    this.name,
    this.arn,
    this.createdAt,
    this.location,
    this.resourceType,
    this.state,
    this.sourceInfo,
    this.destinationInfo,
  });
  static CloudFormationStackRecord fromJson(Map<String, dynamic> json) =>
      CloudFormationStackRecord();
}

/// Describes the source of a CloudFormation stack record (i.e., the export
/// snapshot record).
class CloudFormationStackRecordSourceInfo {
  /// The Lightsail resource type (e.g., `ExportSnapshotRecord`).
  final String resourceType;

  /// The name of the record.
  final String name;

  /// The Amazon Resource Name (ARN) of the export snapshot record.
  final String arn;

  CloudFormationStackRecordSourceInfo({
    this.resourceType,
    this.name,
    this.arn,
  });
  static CloudFormationStackRecordSourceInfo fromJson(
          Map<String, dynamic> json) =>
      CloudFormationStackRecordSourceInfo();
}

class CopySnapshotResult {
  /// A list of objects describing the API operation.
  final List<Operation> operations;

  CopySnapshotResult({
    this.operations,
  });
  static CopySnapshotResult fromJson(Map<String, dynamic> json) =>
      CopySnapshotResult();
}

class CreateCloudFormationStackResult {
  /// A list of objects describing the API operation.
  final List<Operation> operations;

  CreateCloudFormationStackResult({
    this.operations,
  });
  static CreateCloudFormationStackResult fromJson(Map<String, dynamic> json) =>
      CreateCloudFormationStackResult();
}

class CreateDiskFromSnapshotResult {
  /// An object describing the API operations.
  final List<Operation> operations;

  CreateDiskFromSnapshotResult({
    this.operations,
  });
  static CreateDiskFromSnapshotResult fromJson(Map<String, dynamic> json) =>
      CreateDiskFromSnapshotResult();
}

class CreateDiskResult {
  /// An object describing the API operations.
  final List<Operation> operations;

  CreateDiskResult({
    this.operations,
  });
  static CreateDiskResult fromJson(Map<String, dynamic> json) =>
      CreateDiskResult();
}

class CreateDiskSnapshotResult {
  /// An object describing the API operations.
  final List<Operation> operations;

  CreateDiskSnapshotResult({
    this.operations,
  });
  static CreateDiskSnapshotResult fromJson(Map<String, dynamic> json) =>
      CreateDiskSnapshotResult();
}

class CreateDomainEntryResult {
  /// An array of key-value pairs containing information about the operation.
  final Operation operation;

  CreateDomainEntryResult({
    this.operation,
  });
  static CreateDomainEntryResult fromJson(Map<String, dynamic> json) =>
      CreateDomainEntryResult();
}

class CreateDomainResult {
  /// An array of key-value pairs containing information about the domain
  /// resource you created.
  final Operation operation;

  CreateDomainResult({
    this.operation,
  });
  static CreateDomainResult fromJson(Map<String, dynamic> json) =>
      CreateDomainResult();
}

class CreateInstanceSnapshotResult {
  /// An array of key-value pairs containing information about the results of
  /// your create instances snapshot request.
  final List<Operation> operations;

  CreateInstanceSnapshotResult({
    this.operations,
  });
  static CreateInstanceSnapshotResult fromJson(Map<String, dynamic> json) =>
      CreateInstanceSnapshotResult();
}

class CreateInstancesFromSnapshotResult {
  /// An array of key-value pairs containing information about the results of
  /// your create instances from snapshot request.
  final List<Operation> operations;

  CreateInstancesFromSnapshotResult({
    this.operations,
  });
  static CreateInstancesFromSnapshotResult fromJson(
          Map<String, dynamic> json) =>
      CreateInstancesFromSnapshotResult();
}

class CreateInstancesResult {
  /// An array of key-value pairs containing information about the results of
  /// your create instances request.
  final List<Operation> operations;

  CreateInstancesResult({
    this.operations,
  });
  static CreateInstancesResult fromJson(Map<String, dynamic> json) =>
      CreateInstancesResult();
}

class CreateKeyPairResult {
  /// An array of key-value pairs containing information about the new key pair
  /// you just created.
  final KeyPair keyPair;

  /// A base64-encoded public key of the `ssh-rsa` type.
  final String publicKeyBase64;

  /// A base64-encoded RSA private key.
  final String privateKeyBase64;

  /// An array of key-value pairs containing information about the results of
  /// your create key pair request.
  final Operation operation;

  CreateKeyPairResult({
    this.keyPair,
    this.publicKeyBase64,
    this.privateKeyBase64,
    this.operation,
  });
  static CreateKeyPairResult fromJson(Map<String, dynamic> json) =>
      CreateKeyPairResult();
}

class CreateLoadBalancerResult {
  /// An object containing information about the API operations.
  final List<Operation> operations;

  CreateLoadBalancerResult({
    this.operations,
  });
  static CreateLoadBalancerResult fromJson(Map<String, dynamic> json) =>
      CreateLoadBalancerResult();
}

class CreateLoadBalancerTlsCertificateResult {
  /// An object containing information about the API operations.
  final List<Operation> operations;

  CreateLoadBalancerTlsCertificateResult({
    this.operations,
  });
  static CreateLoadBalancerTlsCertificateResult fromJson(
          Map<String, dynamic> json) =>
      CreateLoadBalancerTlsCertificateResult();
}

class CreateRelationalDatabaseFromSnapshotResult {
  /// An object describing the result of your create relational database from
  /// snapshot request.
  final List<Operation> operations;

  CreateRelationalDatabaseFromSnapshotResult({
    this.operations,
  });
  static CreateRelationalDatabaseFromSnapshotResult fromJson(
          Map<String, dynamic> json) =>
      CreateRelationalDatabaseFromSnapshotResult();
}

class CreateRelationalDatabaseResult {
  /// An object describing the result of your create relational database
  /// request.
  final List<Operation> operations;

  CreateRelationalDatabaseResult({
    this.operations,
  });
  static CreateRelationalDatabaseResult fromJson(Map<String, dynamic> json) =>
      CreateRelationalDatabaseResult();
}

class CreateRelationalDatabaseSnapshotResult {
  /// An object describing the result of your create relational database
  /// snapshot request.
  final List<Operation> operations;

  CreateRelationalDatabaseSnapshotResult({
    this.operations,
  });
  static CreateRelationalDatabaseSnapshotResult fromJson(
          Map<String, dynamic> json) =>
      CreateRelationalDatabaseSnapshotResult();
}

class DeleteDiskResult {
  /// An object describing the API operations.
  final List<Operation> operations;

  DeleteDiskResult({
    this.operations,
  });
  static DeleteDiskResult fromJson(Map<String, dynamic> json) =>
      DeleteDiskResult();
}

class DeleteDiskSnapshotResult {
  /// An object describing the API operations.
  final List<Operation> operations;

  DeleteDiskSnapshotResult({
    this.operations,
  });
  static DeleteDiskSnapshotResult fromJson(Map<String, dynamic> json) =>
      DeleteDiskSnapshotResult();
}

class DeleteDomainEntryResult {
  /// An array of key-value pairs containing information about the results of
  /// your delete domain entry request.
  final Operation operation;

  DeleteDomainEntryResult({
    this.operation,
  });
  static DeleteDomainEntryResult fromJson(Map<String, dynamic> json) =>
      DeleteDomainEntryResult();
}

class DeleteDomainResult {
  /// An array of key-value pairs containing information about the results of
  /// your delete domain request.
  final Operation operation;

  DeleteDomainResult({
    this.operation,
  });
  static DeleteDomainResult fromJson(Map<String, dynamic> json) =>
      DeleteDomainResult();
}

class DeleteInstanceResult {
  /// An array of key-value pairs containing information about the results of
  /// your delete instance request.
  final List<Operation> operations;

  DeleteInstanceResult({
    this.operations,
  });
  static DeleteInstanceResult fromJson(Map<String, dynamic> json) =>
      DeleteInstanceResult();
}

class DeleteInstanceSnapshotResult {
  /// An array of key-value pairs containing information about the results of
  /// your delete instance snapshot request.
  final List<Operation> operations;

  DeleteInstanceSnapshotResult({
    this.operations,
  });
  static DeleteInstanceSnapshotResult fromJson(Map<String, dynamic> json) =>
      DeleteInstanceSnapshotResult();
}

class DeleteKeyPairResult {
  /// An array of key-value pairs containing information about the results of
  /// your delete key pair request.
  final Operation operation;

  DeleteKeyPairResult({
    this.operation,
  });
  static DeleteKeyPairResult fromJson(Map<String, dynamic> json) =>
      DeleteKeyPairResult();
}

class DeleteKnownHostKeysResult {
  /// A list of objects describing the API operation.
  final List<Operation> operations;

  DeleteKnownHostKeysResult({
    this.operations,
  });
  static DeleteKnownHostKeysResult fromJson(Map<String, dynamic> json) =>
      DeleteKnownHostKeysResult();
}

class DeleteLoadBalancerResult {
  /// An object describing the API operations.
  final List<Operation> operations;

  DeleteLoadBalancerResult({
    this.operations,
  });
  static DeleteLoadBalancerResult fromJson(Map<String, dynamic> json) =>
      DeleteLoadBalancerResult();
}

class DeleteLoadBalancerTlsCertificateResult {
  /// An object describing the API operations.
  final List<Operation> operations;

  DeleteLoadBalancerTlsCertificateResult({
    this.operations,
  });
  static DeleteLoadBalancerTlsCertificateResult fromJson(
          Map<String, dynamic> json) =>
      DeleteLoadBalancerTlsCertificateResult();
}

class DeleteRelationalDatabaseResult {
  /// An object describing the result of your delete relational database
  /// request.
  final List<Operation> operations;

  DeleteRelationalDatabaseResult({
    this.operations,
  });
  static DeleteRelationalDatabaseResult fromJson(Map<String, dynamic> json) =>
      DeleteRelationalDatabaseResult();
}

class DeleteRelationalDatabaseSnapshotResult {
  /// An object describing the result of your delete relational database
  /// snapshot request.
  final List<Operation> operations;

  DeleteRelationalDatabaseSnapshotResult({
    this.operations,
  });
  static DeleteRelationalDatabaseSnapshotResult fromJson(
          Map<String, dynamic> json) =>
      DeleteRelationalDatabaseSnapshotResult();
}

/// Describes the destination of a record.
class DestinationInfo {
  /// The ID of the resource created at the destination.
  final String id;

  /// The destination service of the record.
  final String service;

  DestinationInfo({
    this.id,
    this.service,
  });
  static DestinationInfo fromJson(Map<String, dynamic> json) =>
      DestinationInfo();
}

class DetachDiskResult {
  /// An object describing the API operations.
  final List<Operation> operations;

  DetachDiskResult({
    this.operations,
  });
  static DetachDiskResult fromJson(Map<String, dynamic> json) =>
      DetachDiskResult();
}

class DetachInstancesFromLoadBalancerResult {
  /// An object describing the API operations.
  final List<Operation> operations;

  DetachInstancesFromLoadBalancerResult({
    this.operations,
  });
  static DetachInstancesFromLoadBalancerResult fromJson(
          Map<String, dynamic> json) =>
      DetachInstancesFromLoadBalancerResult();
}

class DetachStaticIpResult {
  /// An array of key-value pairs containing information about the results of
  /// your detach static IP request.
  final List<Operation> operations;

  DetachStaticIpResult({
    this.operations,
  });
  static DetachStaticIpResult fromJson(Map<String, dynamic> json) =>
      DetachStaticIpResult();
}

/// Describes a system disk or an block storage disk.
class Disk {
  /// The unique name of the disk.
  final String name;

  /// The Amazon Resource Name (ARN) of the disk.
  final String arn;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more
  /// easily.
  final String supportCode;

  /// The date when the disk was created.
  final DateTime createdAt;

  /// The AWS Region and Availability Zone where the disk is located.
  final ResourceLocation location;

  /// The Lightsail resource type (e.g., `Disk`).
  final String resourceType;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags).
  final List<Tag> tags;

  /// The size of the disk in GB.
  final int sizeInGb;

  /// A Boolean value indicating whether this disk is a system disk (has an
  /// operating system loaded on it).
  final bool isSystemDisk;

  /// The input/output operations per second (IOPS) of the disk.
  final int iops;

  /// The disk path.
  final String path;

  /// Describes the status of the disk.
  final String state;

  /// The resources to which the disk is attached.
  final String attachedTo;

  /// A Boolean value indicating whether the disk is attached.
  final bool isAttached;

  /// (Deprecated) The attachment state of the disk.
  ///
  ///
  ///
  /// In releases prior to November 14, 2017, this parameter returned `attached`
  /// for system disks in the API response. It is now deprecated, but still
  /// included in the response. Use `isAttached` instead.
  final String attachmentState;

  /// (Deprecated) The number of GB in use by the disk.
  ///
  ///
  ///
  /// In releases prior to November 14, 2017, this parameter was not included in
  /// the API response. It is now deprecated.
  final int gbInUse;

  Disk({
    this.name,
    this.arn,
    this.supportCode,
    this.createdAt,
    this.location,
    this.resourceType,
    this.tags,
    this.sizeInGb,
    this.isSystemDisk,
    this.iops,
    this.path,
    this.state,
    this.attachedTo,
    this.isAttached,
    this.attachmentState,
    this.gbInUse,
  });
  static Disk fromJson(Map<String, dynamic> json) => Disk();
}

/// Describes a disk.
class DiskInfo {
  /// The disk name.
  final String name;

  /// The disk path.
  final String path;

  /// The size of the disk in GB (e.g., `32`).
  final int sizeInGb;

  /// A Boolean value indicating whether this disk is a system disk (has an
  /// operating system loaded on it).
  final bool isSystemDisk;

  DiskInfo({
    this.name,
    this.path,
    this.sizeInGb,
    this.isSystemDisk,
  });
  static DiskInfo fromJson(Map<String, dynamic> json) => DiskInfo();
}

/// Describes a block storage disk mapping.
class DiskMap {
  /// The original disk path exposed to the instance (for example, `/dev/sdh`).
  final String originalDiskPath;

  /// The new disk name (e.g., `my-new-disk`).
  final String newDiskName;

  DiskMap({
    this.originalDiskPath,
    this.newDiskName,
  });
}

/// Describes a block storage disk snapshot.
class DiskSnapshot {
  /// The name of the disk snapshot (e.g., `my-disk-snapshot`).
  final String name;

  /// The Amazon Resource Name (ARN) of the disk snapshot.
  final String arn;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more
  /// easily.
  final String supportCode;

  /// The date when the disk snapshot was created.
  final DateTime createdAt;

  /// The AWS Region and Availability Zone where the disk snapshot was created.
  final ResourceLocation location;

  /// The Lightsail resource type (e.g., `DiskSnapshot`).
  final String resourceType;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags).
  final List<Tag> tags;

  /// The size of the disk in GB.
  final int sizeInGb;

  /// The status of the disk snapshot operation.
  final String state;

  /// The progress of the disk snapshot operation.
  final String progress;

  /// The unique name of the source disk from which the disk snapshot was
  /// created.
  final String fromDiskName;

  /// The Amazon Resource Name (ARN) of the source disk from which the disk
  /// snapshot was created.
  final String fromDiskArn;

  /// The unique name of the source instance from which the disk (system volume)
  /// snapshot was created.
  final String fromInstanceName;

  /// The Amazon Resource Name (ARN) of the source instance from which the disk
  /// (system volume) snapshot was created.
  final String fromInstanceArn;

  DiskSnapshot({
    this.name,
    this.arn,
    this.supportCode,
    this.createdAt,
    this.location,
    this.resourceType,
    this.tags,
    this.sizeInGb,
    this.state,
    this.progress,
    this.fromDiskName,
    this.fromDiskArn,
    this.fromInstanceName,
    this.fromInstanceArn,
  });
  static DiskSnapshot fromJson(Map<String, dynamic> json) => DiskSnapshot();
}

/// Describes a disk snapshot.
class DiskSnapshotInfo {
  /// The size of the disk in GB (e.g., `32`).
  final int sizeInGb;

  DiskSnapshotInfo({
    this.sizeInGb,
  });
  static DiskSnapshotInfo fromJson(Map<String, dynamic> json) =>
      DiskSnapshotInfo();
}

/// Describes a domain where you are storing recordsets in Lightsail.
class Domain {
  /// The name of the domain.
  final String name;

  /// The Amazon Resource Name (ARN) of the domain recordset (e.g.,
  /// `arn:aws:lightsail:global:123456789101:Domain/824cede0-abc7-4f84-8dbc-12345EXAMPLE`).
  final String arn;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more
  /// easily.
  final String supportCode;

  /// The date when the domain recordset was created.
  final DateTime createdAt;

  /// The AWS Region and Availability Zones where the domain recordset was
  /// created.
  final ResourceLocation location;

  /// The resource type.
  final String resourceType;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags).
  final List<Tag> tags;

  /// An array of key-value pairs containing information about the domain
  /// entries.
  final List<DomainEntry> domainEntries;

  Domain({
    this.name,
    this.arn,
    this.supportCode,
    this.createdAt,
    this.location,
    this.resourceType,
    this.tags,
    this.domainEntries,
  });
  static Domain fromJson(Map<String, dynamic> json) => Domain();
}

/// Describes a domain recordset entry.
class DomainEntry {
  /// The ID of the domain recordset entry.
  final String id;

  /// The name of the domain.
  final String name;

  /// The target AWS name server (e.g., `ns-111.awsdns-22.com.`).
  ///
  /// For Lightsail load balancers, the value looks like
  /// `ab1234c56789c6b86aba6fb203d443bc-123456789.us-east-2.elb.amazonaws.com`.
  /// Be sure to also set `isAlias` to `true` when setting up an A record for a
  /// load balancer.
  final String target;

  /// When `true`, specifies whether the domain entry is an alias used by the
  /// Lightsail load balancer. You can include an alias (A type) record in your
  /// request, which points to a load balancer DNS name and routes traffic to
  /// your load balancer
  final bool isAlias;

  /// The type of domain entry, such as address (A), canonical name (CNAME),
  /// mail exchanger (MX), name server (NS), start of authority (SOA), service
  /// locator (SRV), or text (TXT).
  ///
  /// The following domain entry types can be used:
  ///
  /// *    `A`
  ///
  /// *    `CNAME`
  ///
  /// *    `MX`
  ///
  /// *    `NS`
  ///
  /// *    `SOA`
  ///
  /// *    `SRV`
  ///
  /// *    `TXT`
  final String type;

  /// (Deprecated) The options for the domain entry.
  ///
  ///
  ///
  /// In releases prior to November 29, 2017, this parameter was not included in
  /// the API response. It is now deprecated.
  final Map<String, String> options;

  DomainEntry({
    this.id,
    this.name,
    this.target,
    this.isAlias,
    this.type,
    this.options,
  });
  static DomainEntry fromJson(Map<String, dynamic> json) => DomainEntry();
}

class DownloadDefaultKeyPairResult {
  /// A base64-encoded public key of the `ssh-rsa` type.
  final String publicKeyBase64;

  /// A base64-encoded RSA private key.
  final String privateKeyBase64;

  DownloadDefaultKeyPairResult({
    this.publicKeyBase64,
    this.privateKeyBase64,
  });
  static DownloadDefaultKeyPairResult fromJson(Map<String, dynamic> json) =>
      DownloadDefaultKeyPairResult();
}

/// Describes an export snapshot record.
class ExportSnapshotRecord {
  /// The export snapshot record name.
  final String name;

  /// The Amazon Resource Name (ARN) of the export snapshot record.
  final String arn;

  /// The date when the export snapshot record was created.
  final DateTime createdAt;

  /// The AWS Region and Availability Zone where the export snapshot record is
  /// located.
  final ResourceLocation location;

  /// The Lightsail resource type (e.g., `ExportSnapshotRecord`).
  final String resourceType;

  /// The state of the export snapshot record.
  final String state;

  /// A list of objects describing the source of the export snapshot record.
  final ExportSnapshotRecordSourceInfo sourceInfo;

  /// A list of objects describing the destination of the export snapshot
  /// record.
  final DestinationInfo destinationInfo;

  ExportSnapshotRecord({
    this.name,
    this.arn,
    this.createdAt,
    this.location,
    this.resourceType,
    this.state,
    this.sourceInfo,
    this.destinationInfo,
  });
  static ExportSnapshotRecord fromJson(Map<String, dynamic> json) =>
      ExportSnapshotRecord();
}

/// Describes the source of an export snapshot record.
class ExportSnapshotRecordSourceInfo {
  /// The Lightsail resource type (e.g., `InstanceSnapshot` or `DiskSnapshot`).
  final String resourceType;

  /// The date when the source instance or disk snapshot was created.
  final DateTime createdAt;

  /// The name of the source instance or disk snapshot.
  final String name;

  /// The Amazon Resource Name (ARN) of the source instance or disk snapshot.
  final String arn;

  /// The name of the snapshot's source instance or disk.
  final String fromResourceName;

  /// The Amazon Resource Name (ARN) of the snapshot's source instance or disk.
  final String fromResourceArn;

  /// A list of objects describing an instance snapshot.
  final InstanceSnapshotInfo instanceSnapshotInfo;

  /// A list of objects describing a disk snapshot.
  final DiskSnapshotInfo diskSnapshotInfo;

  ExportSnapshotRecordSourceInfo({
    this.resourceType,
    this.createdAt,
    this.name,
    this.arn,
    this.fromResourceName,
    this.fromResourceArn,
    this.instanceSnapshotInfo,
    this.diskSnapshotInfo,
  });
  static ExportSnapshotRecordSourceInfo fromJson(Map<String, dynamic> json) =>
      ExportSnapshotRecordSourceInfo();
}

class ExportSnapshotResult {
  /// A list of objects describing the API operation.
  final List<Operation> operations;

  ExportSnapshotResult({
    this.operations,
  });
  static ExportSnapshotResult fromJson(Map<String, dynamic> json) =>
      ExportSnapshotResult();
}

class GetActiveNamesResult {
  /// The list of active names returned by the get active names request.
  final List<String> activeNames;

  /// A token used for advancing to the next page of results from your get
  /// active names request.
  final String nextPageToken;

  GetActiveNamesResult({
    this.activeNames,
    this.nextPageToken,
  });
  static GetActiveNamesResult fromJson(Map<String, dynamic> json) =>
      GetActiveNamesResult();
}

class GetBlueprintsResult {
  /// An array of key-value pairs that contains information about the available
  /// blueprints.
  final List<Blueprint> blueprints;

  /// A token used for advancing to the next page of results from your get
  /// blueprints request.
  final String nextPageToken;

  GetBlueprintsResult({
    this.blueprints,
    this.nextPageToken,
  });
  static GetBlueprintsResult fromJson(Map<String, dynamic> json) =>
      GetBlueprintsResult();
}

class GetBundlesResult {
  /// An array of key-value pairs that contains information about the available
  /// bundles.
  final List<Bundle> bundles;

  /// A token used for advancing to the next page of results from your get
  /// active names request.
  final String nextPageToken;

  GetBundlesResult({
    this.bundles,
    this.nextPageToken,
  });
  static GetBundlesResult fromJson(Map<String, dynamic> json) =>
      GetBundlesResult();
}

class GetCloudFormationStackRecordsResult {
  /// A list of objects describing the CloudFormation stack records.
  final List<CloudFormationStackRecord> cloudFormationStackRecords;

  /// A token used for advancing to the next page of results of your get
  /// relational database bundles request.
  final String nextPageToken;

  GetCloudFormationStackRecordsResult({
    this.cloudFormationStackRecords,
    this.nextPageToken,
  });
  static GetCloudFormationStackRecordsResult fromJson(
          Map<String, dynamic> json) =>
      GetCloudFormationStackRecordsResult();
}

class GetDiskResult {
  /// An object containing information about the disk.
  final Disk disk;

  GetDiskResult({
    this.disk,
  });
  static GetDiskResult fromJson(Map<String, dynamic> json) => GetDiskResult();
}

class GetDiskSnapshotResult {
  /// An object containing information about the disk snapshot.
  final DiskSnapshot diskSnapshot;

  GetDiskSnapshotResult({
    this.diskSnapshot,
  });
  static GetDiskSnapshotResult fromJson(Map<String, dynamic> json) =>
      GetDiskSnapshotResult();
}

class GetDiskSnapshotsResult {
  /// An array of objects containing information about all block storage disk
  /// snapshots.
  final List<DiskSnapshot> diskSnapshots;

  /// A token used for advancing to the next page of results from your
  /// GetDiskSnapshots request.
  final String nextPageToken;

  GetDiskSnapshotsResult({
    this.diskSnapshots,
    this.nextPageToken,
  });
  static GetDiskSnapshotsResult fromJson(Map<String, dynamic> json) =>
      GetDiskSnapshotsResult();
}

class GetDisksResult {
  /// An array of objects containing information about all block storage disks.
  final List<Disk> disks;

  /// A token used for advancing to the next page of results from your GetDisks
  /// request.
  final String nextPageToken;

  GetDisksResult({
    this.disks,
    this.nextPageToken,
  });
  static GetDisksResult fromJson(Map<String, dynamic> json) => GetDisksResult();
}

class GetDomainResult {
  /// An array of key-value pairs containing information about your get domain
  /// request.
  final Domain domain;

  GetDomainResult({
    this.domain,
  });
  static GetDomainResult fromJson(Map<String, dynamic> json) =>
      GetDomainResult();
}

class GetDomainsResult {
  /// An array of key-value pairs containing information about each of the
  /// domain entries in the user's account.
  final List<Domain> domains;

  /// A token used for advancing to the next page of results from your get
  /// active names request.
  final String nextPageToken;

  GetDomainsResult({
    this.domains,
    this.nextPageToken,
  });
  static GetDomainsResult fromJson(Map<String, dynamic> json) =>
      GetDomainsResult();
}

class GetExportSnapshotRecordsResult {
  /// A list of objects describing the export snapshot records.
  final List<ExportSnapshotRecord> exportSnapshotRecords;

  /// A token used for advancing to the next page of results of your get
  /// relational database bundles request.
  final String nextPageToken;

  GetExportSnapshotRecordsResult({
    this.exportSnapshotRecords,
    this.nextPageToken,
  });
  static GetExportSnapshotRecordsResult fromJson(Map<String, dynamic> json) =>
      GetExportSnapshotRecordsResult();
}

class GetInstanceAccessDetailsResult {
  /// An array of key-value pairs containing information about a get instance
  /// access request.
  final InstanceAccessDetails accessDetails;

  GetInstanceAccessDetailsResult({
    this.accessDetails,
  });
  static GetInstanceAccessDetailsResult fromJson(Map<String, dynamic> json) =>
      GetInstanceAccessDetailsResult();
}

class GetInstanceMetricDataResult {
  /// The metric name to return data for.
  final String metricName;

  /// An array of key-value pairs containing information about the results of
  /// your get instance metric data request.
  final List<MetricDatapoint> metricData;

  GetInstanceMetricDataResult({
    this.metricName,
    this.metricData,
  });
  static GetInstanceMetricDataResult fromJson(Map<String, dynamic> json) =>
      GetInstanceMetricDataResult();
}

class GetInstancePortStatesResult {
  /// Information about the port states resulting from your request.
  final List<InstancePortState> portStates;

  GetInstancePortStatesResult({
    this.portStates,
  });
  static GetInstancePortStatesResult fromJson(Map<String, dynamic> json) =>
      GetInstancePortStatesResult();
}

class GetInstanceResult {
  /// An array of key-value pairs containing information about the specified
  /// instance.
  final Instance instance;

  GetInstanceResult({
    this.instance,
  });
  static GetInstanceResult fromJson(Map<String, dynamic> json) =>
      GetInstanceResult();
}

class GetInstanceSnapshotResult {
  /// An array of key-value pairs containing information about the results of
  /// your get instance snapshot request.
  final InstanceSnapshot instanceSnapshot;

  GetInstanceSnapshotResult({
    this.instanceSnapshot,
  });
  static GetInstanceSnapshotResult fromJson(Map<String, dynamic> json) =>
      GetInstanceSnapshotResult();
}

class GetInstanceSnapshotsResult {
  /// An array of key-value pairs containing information about the results of
  /// your get instance snapshots request.
  final List<InstanceSnapshot> instanceSnapshots;

  /// A token used for advancing to the next page of results from your get
  /// instance snapshots request.
  final String nextPageToken;

  GetInstanceSnapshotsResult({
    this.instanceSnapshots,
    this.nextPageToken,
  });
  static GetInstanceSnapshotsResult fromJson(Map<String, dynamic> json) =>
      GetInstanceSnapshotsResult();
}

class GetInstanceStateResult {
  /// The state of the instance.
  final InstanceState state;

  GetInstanceStateResult({
    this.state,
  });
  static GetInstanceStateResult fromJson(Map<String, dynamic> json) =>
      GetInstanceStateResult();
}

class GetInstancesResult {
  /// An array of key-value pairs containing information about your instances.
  final List<Instance> instances;

  /// A token used for advancing to the next page of results from your get
  /// instances request.
  final String nextPageToken;

  GetInstancesResult({
    this.instances,
    this.nextPageToken,
  });
  static GetInstancesResult fromJson(Map<String, dynamic> json) =>
      GetInstancesResult();
}

class GetKeyPairResult {
  /// An array of key-value pairs containing information about the key pair.
  final KeyPair keyPair;

  GetKeyPairResult({
    this.keyPair,
  });
  static GetKeyPairResult fromJson(Map<String, dynamic> json) =>
      GetKeyPairResult();
}

class GetKeyPairsResult {
  /// An array of key-value pairs containing information about the key pairs.
  final List<KeyPair> keyPairs;

  /// A token used for advancing to the next page of results from your get key
  /// pairs request.
  final String nextPageToken;

  GetKeyPairsResult({
    this.keyPairs,
    this.nextPageToken,
  });
  static GetKeyPairsResult fromJson(Map<String, dynamic> json) =>
      GetKeyPairsResult();
}

class GetLoadBalancerMetricDataResult {
  /// The metric about which you are receiving information. Valid values are
  /// listed below, along with the most useful `statistics` to include in your
  /// request.
  ///
  /// *     **`ClientTLSNegotiationErrorCount`**  - The number of TLS
  /// connections initiated by the client that did not establish a session with
  /// the load balancer. Possible causes include a mismatch of ciphers or
  /// protocols.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`.
  ///
  /// *     **`HealthyHostCount`**  - The number of target instances that are
  /// considered healthy.
  ///
  ///      `Statistics`: The most useful statistic are `Average`, `Minimum`, and
  /// `Maximum`.
  ///
  /// *     **`UnhealthyHostCount`**  - The number of target instances that are
  /// considered unhealthy.
  ///
  ///      `Statistics`: The most useful statistic are `Average`, `Minimum`, and
  /// `Maximum`.
  ///
  /// *     **`HTTPCode_LB_4XX_Count`**  - The number of HTTP 4XX client error
  /// codes that originate from the load balancer. Client errors are generated
  /// when requests are malformed or incomplete. These requests have not been
  /// received by the target instance. This count does not include any response
  /// codes generated by the target instances.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`.
  ///
  /// *     **`HTTPCode_LB_5XX_Count`**  - The number of HTTP 5XX server error
  /// codes that originate from the load balancer. This count does not include
  /// any response codes generated by the target instances.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`. Note that `Minimum`,
  /// `Maximum`, and `Average` all return `1`.
  ///
  /// *     **`HTTPCode_Instance_2XX_Count`**  - The number of HTTP response
  /// codes generated by the target instances. This does not include any
  /// response codes generated by the load balancer.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`.
  ///
  /// *     **`HTTPCode_Instance_3XX_Count`**  - The number of HTTP response
  /// codes generated by the target instances. This does not include any
  /// response codes generated by the load balancer.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`.
  ///
  /// *     **`HTTPCode_Instance_4XX_Count`**  - The number of HTTP response
  /// codes generated by the target instances. This does not include any
  /// response codes generated by the load balancer.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`.
  ///
  /// *     **`HTTPCode_Instance_5XX_Count`**  - The number of HTTP response
  /// codes generated by the target instances. This does not include any
  /// response codes generated by the load balancer.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`.
  ///
  /// *     **`InstanceResponseTime`**  - The time elapsed, in seconds, after
  /// the request leaves the load balancer until a response from the target
  /// instance is received.
  ///
  ///      `Statistics`: The most useful statistic is `Average`.
  ///
  /// *     **`RejectedConnectionCount`**  - The number of connections that were
  /// rejected because the load balancer had reached its maximum number of
  /// connections.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`.
  ///
  /// *     **`RequestCount`**  - The number of requests processed over IPv4.
  /// This count includes only the requests with a response generated by a
  /// target instance of the load balancer.
  ///
  ///      `Statistics`: The most useful statistic is `Sum`. Note that
  /// `Minimum`, `Maximum`, and `Average` all return `1`.
  final String metricName;

  /// An array of metric datapoint objects.
  final List<MetricDatapoint> metricData;

  GetLoadBalancerMetricDataResult({
    this.metricName,
    this.metricData,
  });
  static GetLoadBalancerMetricDataResult fromJson(Map<String, dynamic> json) =>
      GetLoadBalancerMetricDataResult();
}

class GetLoadBalancerResult {
  /// An object containing information about your load balancer.
  final LoadBalancer loadBalancer;

  GetLoadBalancerResult({
    this.loadBalancer,
  });
  static GetLoadBalancerResult fromJson(Map<String, dynamic> json) =>
      GetLoadBalancerResult();
}

class GetLoadBalancerTlsCertificatesResult {
  /// An array of LoadBalancerTlsCertificate objects describing your SSL/TLS
  /// certificates.
  final List<LoadBalancerTlsCertificate> tlsCertificates;

  GetLoadBalancerTlsCertificatesResult({
    this.tlsCertificates,
  });
  static GetLoadBalancerTlsCertificatesResult fromJson(
          Map<String, dynamic> json) =>
      GetLoadBalancerTlsCertificatesResult();
}

class GetLoadBalancersResult {
  /// An array of LoadBalancer objects describing your load balancers.
  final List<LoadBalancer> loadBalancers;

  /// A token used for advancing to the next page of results from your
  /// GetLoadBalancers request.
  final String nextPageToken;

  GetLoadBalancersResult({
    this.loadBalancers,
    this.nextPageToken,
  });
  static GetLoadBalancersResult fromJson(Map<String, dynamic> json) =>
      GetLoadBalancersResult();
}

class GetOperationResult {
  /// An array of key-value pairs containing information about the results of
  /// your get operation request.
  final Operation operation;

  GetOperationResult({
    this.operation,
  });
  static GetOperationResult fromJson(Map<String, dynamic> json) =>
      GetOperationResult();
}

class GetOperationsForResourceResult {
  /// An array of key-value pairs containing information about the results of
  /// your get operations for resource request.
  final List<Operation> operations;

  /// (Deprecated) Returns the number of pages of results that remain.
  ///
  ///
  ///
  /// In releases prior to June 12, 2017, this parameter returned `null` by the
  /// API. It is now deprecated, and the API returns the `next page token`
  /// parameter instead.
  final String nextPageCount;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String nextPageToken;

  GetOperationsForResourceResult({
    this.operations,
    this.nextPageCount,
    this.nextPageToken,
  });
  static GetOperationsForResourceResult fromJson(Map<String, dynamic> json) =>
      GetOperationsForResourceResult();
}

class GetOperationsResult {
  /// An array of key-value pairs containing information about the results of
  /// your get operations request.
  final List<Operation> operations;

  /// A token used for advancing to the next page of results from your get
  /// operations request.
  final String nextPageToken;

  GetOperationsResult({
    this.operations,
    this.nextPageToken,
  });
  static GetOperationsResult fromJson(Map<String, dynamic> json) =>
      GetOperationsResult();
}

class GetRegionsResult {
  /// An array of key-value pairs containing information about your get regions
  /// request.
  final List<Region> regions;

  GetRegionsResult({
    this.regions,
  });
  static GetRegionsResult fromJson(Map<String, dynamic> json) =>
      GetRegionsResult();
}

class GetRelationalDatabaseBlueprintsResult {
  /// An object describing the result of your get relational database blueprints
  /// request.
  final List<RelationalDatabaseBlueprint> blueprints;

  /// A token used for advancing to the next page of results of your get
  /// relational database blueprints request.
  final String nextPageToken;

  GetRelationalDatabaseBlueprintsResult({
    this.blueprints,
    this.nextPageToken,
  });
  static GetRelationalDatabaseBlueprintsResult fromJson(
          Map<String, dynamic> json) =>
      GetRelationalDatabaseBlueprintsResult();
}

class GetRelationalDatabaseBundlesResult {
  /// An object describing the result of your get relational database bundles
  /// request.
  final List<RelationalDatabaseBundle> bundles;

  /// A token used for advancing to the next page of results of your get
  /// relational database bundles request.
  final String nextPageToken;

  GetRelationalDatabaseBundlesResult({
    this.bundles,
    this.nextPageToken,
  });
  static GetRelationalDatabaseBundlesResult fromJson(
          Map<String, dynamic> json) =>
      GetRelationalDatabaseBundlesResult();
}

class GetRelationalDatabaseEventsResult {
  /// An object describing the result of your get relational database events
  /// request.
  final List<RelationalDatabaseEvent> relationalDatabaseEvents;

  /// A token used for advancing to the next page of results from your get
  /// relational database events request.
  final String nextPageToken;

  GetRelationalDatabaseEventsResult({
    this.relationalDatabaseEvents,
    this.nextPageToken,
  });
  static GetRelationalDatabaseEventsResult fromJson(
          Map<String, dynamic> json) =>
      GetRelationalDatabaseEventsResult();
}

class GetRelationalDatabaseLogEventsResult {
  /// An object describing the result of your get relational database log events
  /// request.
  final List<LogEvent> resourceLogEvents;

  /// A token used for advancing to the previous page of results from your get
  /// relational database log events request.
  final String nextBackwardToken;

  /// A token used for advancing to the next page of results from your get
  /// relational database log events request.
  final String nextForwardToken;

  GetRelationalDatabaseLogEventsResult({
    this.resourceLogEvents,
    this.nextBackwardToken,
    this.nextForwardToken,
  });
  static GetRelationalDatabaseLogEventsResult fromJson(
          Map<String, dynamic> json) =>
      GetRelationalDatabaseLogEventsResult();
}

class GetRelationalDatabaseLogStreamsResult {
  /// An object describing the result of your get relational database log
  /// streams request.
  final List<String> logStreams;

  GetRelationalDatabaseLogStreamsResult({
    this.logStreams,
  });
  static GetRelationalDatabaseLogStreamsResult fromJson(
          Map<String, dynamic> json) =>
      GetRelationalDatabaseLogStreamsResult();
}

class GetRelationalDatabaseMasterUserPasswordResult {
  /// The master user password for the `password version` specified.
  final String masterUserPassword;

  /// The timestamp when the specified version of the master user password was
  /// created.
  final DateTime createdAt;

  GetRelationalDatabaseMasterUserPasswordResult({
    this.masterUserPassword,
    this.createdAt,
  });
  static GetRelationalDatabaseMasterUserPasswordResult fromJson(
          Map<String, dynamic> json) =>
      GetRelationalDatabaseMasterUserPasswordResult();
}

class GetRelationalDatabaseMetricDataResult {
  /// The name of the metric.
  final String metricName;

  /// An object describing the result of your get relational database metric
  /// data request.
  final List<MetricDatapoint> metricData;

  GetRelationalDatabaseMetricDataResult({
    this.metricName,
    this.metricData,
  });
  static GetRelationalDatabaseMetricDataResult fromJson(
          Map<String, dynamic> json) =>
      GetRelationalDatabaseMetricDataResult();
}

class GetRelationalDatabaseParametersResult {
  /// An object describing the result of your get relational database parameters
  /// request.
  final List<RelationalDatabaseParameter> parameters;

  /// A token used for advancing to the next page of results from your get
  /// static IPs request.
  final String nextPageToken;

  GetRelationalDatabaseParametersResult({
    this.parameters,
    this.nextPageToken,
  });
  static GetRelationalDatabaseParametersResult fromJson(
          Map<String, dynamic> json) =>
      GetRelationalDatabaseParametersResult();
}

class GetRelationalDatabaseResult {
  /// An object describing the specified database.
  final RelationalDatabase relationalDatabase;

  GetRelationalDatabaseResult({
    this.relationalDatabase,
  });
  static GetRelationalDatabaseResult fromJson(Map<String, dynamic> json) =>
      GetRelationalDatabaseResult();
}

class GetRelationalDatabaseSnapshotResult {
  /// An object describing the specified database snapshot.
  final RelationalDatabaseSnapshot relationalDatabaseSnapshot;

  GetRelationalDatabaseSnapshotResult({
    this.relationalDatabaseSnapshot,
  });
  static GetRelationalDatabaseSnapshotResult fromJson(
          Map<String, dynamic> json) =>
      GetRelationalDatabaseSnapshotResult();
}

class GetRelationalDatabaseSnapshotsResult {
  /// An object describing the result of your get relational database snapshots
  /// request.
  final List<RelationalDatabaseSnapshot> relationalDatabaseSnapshots;

  /// A token used for advancing to the next page of results from your get
  /// relational database snapshots request.
  final String nextPageToken;

  GetRelationalDatabaseSnapshotsResult({
    this.relationalDatabaseSnapshots,
    this.nextPageToken,
  });
  static GetRelationalDatabaseSnapshotsResult fromJson(
          Map<String, dynamic> json) =>
      GetRelationalDatabaseSnapshotsResult();
}

class GetRelationalDatabasesResult {
  /// An object describing the result of your get relational databases request.
  final List<RelationalDatabase> relationalDatabases;

  /// A token used for advancing to the next page of results from your get
  /// relational databases request.
  final String nextPageToken;

  GetRelationalDatabasesResult({
    this.relationalDatabases,
    this.nextPageToken,
  });
  static GetRelationalDatabasesResult fromJson(Map<String, dynamic> json) =>
      GetRelationalDatabasesResult();
}

class GetStaticIpResult {
  /// An array of key-value pairs containing information about the requested
  /// static IP.
  final StaticIp staticIp;

  GetStaticIpResult({
    this.staticIp,
  });
  static GetStaticIpResult fromJson(Map<String, dynamic> json) =>
      GetStaticIpResult();
}

class GetStaticIpsResult {
  /// An array of key-value pairs containing information about your get static
  /// IPs request.
  final List<StaticIp> staticIps;

  /// A token used for advancing to the next page of results from your get
  /// static IPs request.
  final String nextPageToken;

  GetStaticIpsResult({
    this.staticIps,
    this.nextPageToken,
  });
  static GetStaticIpsResult fromJson(Map<String, dynamic> json) =>
      GetStaticIpsResult();
}

/// Describes the public SSH host keys or the RDP certificate.
class HostKeyAttributes {
  /// The SSH host key algorithm or the RDP certificate format.
  ///
  /// For SSH host keys, the algorithm may be `ssh-rsa`, `ecdsa-sha2-nistp256`,
  /// `ssh-ed25519`, etc. For RDP certificates, the algorithm is always
  /// `x509-cert`.
  final String algorithm;

  /// The public SSH host key or the RDP certificate.
  final String publicKey;

  /// The time that the SSH host key or RDP certificate was recorded by
  /// Lightsail.
  final DateTime witnessedAt;

  /// The SHA-1 fingerprint of the returned SSH host key or RDP certificate.
  ///
  /// *   Example of an SHA-1 SSH fingerprint:
  ///
  ///      `SHA1:1CHH6FaAaXjtFOsR/t83vf91SR0`
  ///
  /// *   Example of an SHA-1 RDP fingerprint:
  ///
  ///      `af:34:51:fe:09:f0:e0:da:b8:4e:56:ca:60:c2:10:ff:38:06:db:45`
  final String fingerprintSha1;

  /// The SHA-256 fingerprint of the returned SSH host key or RDP certificate.
  ///
  /// *   Example of an SHA-256 SSH fingerprint:
  ///
  ///      `SHA256:KTsMnRBh1IhD17HpdfsbzeGA4jOijm5tyXsMjKVbB8o`
  ///
  /// *   Example of an SHA-256 RDP fingerprint:
  ///
  ///
  /// `03:9b:36:9f:4b:de:4e:61:70:fc:7c:c9:78:e7:d2:1a:1c:25:a8:0c:91:f6:7c:e4:d6:a0:85:c8:b4:53:99:68`
  final String fingerprintSha256;

  /// The returned RDP certificate is valid after this point in time.
  ///
  /// This value is listed only for RDP certificates.
  final DateTime notValidBefore;

  /// The returned RDP certificate is not valid after this point in time.
  ///
  /// This value is listed only for RDP certificates.
  final DateTime notValidAfter;

  HostKeyAttributes({
    this.algorithm,
    this.publicKey,
    this.witnessedAt,
    this.fingerprintSha1,
    this.fingerprintSha256,
    this.notValidBefore,
    this.notValidAfter,
  });
  static HostKeyAttributes fromJson(Map<String, dynamic> json) =>
      HostKeyAttributes();
}

class ImportKeyPairResult {
  /// An array of key-value pairs containing information about the request
  /// operation.
  final Operation operation;

  ImportKeyPairResult({
    this.operation,
  });
  static ImportKeyPairResult fromJson(Map<String, dynamic> json) =>
      ImportKeyPairResult();
}

/// Describes an instance (a virtual private server).
class Instance {
  /// The name the user gave the instance (e.g., `Amazon_Linux-1GB-Ohio-1`).
  final String name;

  /// The Amazon Resource Name (ARN) of the instance (e.g.,
  /// `arn:aws:lightsail:us-east-2:123456789101:Instance/244ad76f-8aad-4741-809f-12345EXAMPLE`).
  final String arn;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more
  /// easily.
  final String supportCode;

  /// The timestamp when the instance was created (e.g., `1479734909.17`).
  final DateTime createdAt;

  /// The region name and Availability Zone where the instance is located.
  final ResourceLocation location;

  /// The type of resource (usually `Instance`).
  final String resourceType;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags).
  final List<Tag> tags;

  /// The blueprint ID (e.g., `os_amlinux_2016_03`).
  final String blueprintId;

  /// The friendly name of the blueprint (e.g., `Amazon Linux`).
  final String blueprintName;

  /// The bundle for the instance (e.g., `micro_1_0`).
  final String bundleId;

  /// A Boolean value indicating whether this instance has a static IP assigned
  /// to it.
  final bool isStaticIp;

  /// The private IP address of the instance.
  final String privateIpAddress;

  /// The public IP address of the instance.
  final String publicIpAddress;

  /// The IPv6 address of the instance.
  final String ipv6Address;

  /// The size of the vCPU and the amount of RAM for the instance.
  final InstanceHardware hardware;

  /// Information about the public ports and monthly data transfer rates for the
  /// instance.
  final InstanceNetworking networking;

  /// The status code and the state (e.g., `running`) for the instance.
  final InstanceState state;

  /// The user name for connecting to the instance (e.g., `ec2-user`).
  final String username;

  /// The name of the SSH key being used to connect to the instance (e.g.,
  /// `LightsailDefaultKeyPair`).
  final String sshKeyName;

  Instance({
    this.name,
    this.arn,
    this.supportCode,
    this.createdAt,
    this.location,
    this.resourceType,
    this.tags,
    this.blueprintId,
    this.blueprintName,
    this.bundleId,
    this.isStaticIp,
    this.privateIpAddress,
    this.publicIpAddress,
    this.ipv6Address,
    this.hardware,
    this.networking,
    this.state,
    this.username,
    this.sshKeyName,
  });
  static Instance fromJson(Map<String, dynamic> json) => Instance();
}

/// The parameters for gaining temporary access to one of your Amazon Lightsail
/// instances.
class InstanceAccessDetails {
  /// For SSH access, the public key to use when accessing your instance For
  /// OpenSSH clients (e.g., command line SSH), you should save this value to
  /// `tempkey-cert.pub`.
  final String certKey;

  /// For SSH access, the date on which the temporary keys expire.
  final DateTime expiresAt;

  /// The public IP address of the Amazon Lightsail instance.
  final String ipAddress;

  /// For RDP access, the password for your Amazon Lightsail instance. Password
  /// will be an empty string if the password for your new instance is not ready
  /// yet. When you create an instance, it can take up to 15 minutes for the
  /// instance to be ready.
  ///
  ///
  ///
  /// If you create an instance using any key pair other than the default
  /// (`LightsailDefaultKeyPair`), `password` will always be an empty string.
  ///
  /// If you change the Administrator password on the instance, Lightsail will
  /// continue to return the original password value. When accessing the
  /// instance using RDP, you need to manually enter the Administrator password
  /// after changing it from the default.
  final String password;

  /// For a Windows Server-based instance, an object with the data you can use
  /// to retrieve your password. This is only needed if `password` is empty and
  /// the instance is not new (and therefore the password is not ready yet).
  /// When you create an instance, it can take up to 15 minutes for the instance
  /// to be ready.
  final PasswordData passwordData;

  /// For SSH access, the temporary private key. For OpenSSH clients (e.g.,
  /// command line SSH), you should save this value to `tempkey`).
  final String privateKey;

  /// The protocol for these Amazon Lightsail instance access details.
  final String protocol;

  /// The name of this Amazon Lightsail instance.
  final String instanceName;

  /// The user name to use when logging in to the Amazon Lightsail instance.
  final String username;

  /// Describes the public SSH host keys or the RDP certificate.
  final List<HostKeyAttributes> hostKeys;

  InstanceAccessDetails({
    this.certKey,
    this.expiresAt,
    this.ipAddress,
    this.password,
    this.passwordData,
    this.privateKey,
    this.protocol,
    this.instanceName,
    this.username,
    this.hostKeys,
  });
  static InstanceAccessDetails fromJson(Map<String, dynamic> json) =>
      InstanceAccessDetails();
}

/// Describes the Amazon Elastic Compute Cloud instance and related resources to
/// be created using the `create cloud formation stack` operation.
class InstanceEntry {
  /// The name of the export snapshot record, which contains the exported
  /// Lightsail instance snapshot that will be used as the source of the new
  /// Amazon EC2 instance.
  ///
  /// Use the `get export snapshot records` operation to get a list of export
  /// snapshot records that you can use to create a CloudFormation stack.
  final String sourceName;

  /// The instance type (e.g., `t2.micro`) to use for the new Amazon EC2
  /// instance.
  final String instanceType;

  /// The port configuration to use for the new Amazon EC2 instance.
  ///
  /// The following configuration options are available:
  ///
  /// *   DEFAULT — Use the default firewall settings from the image.
  ///
  /// *   INSTANCE — Use the firewall settings from the source Lightsail
  /// instance.
  ///
  /// *   NONE — Default to Amazon EC2.
  ///
  /// *   CLOSED — All ports closed.
  final String portInfoSource;

  /// A launch script you can create that configures a server with additional
  /// user data. For example, you might want to run `apt-get -y update`.
  ///
  ///
  ///
  /// Depending on the machine image you choose, the command to get software on
  /// your instance varies. Amazon Linux and CentOS use `yum`, Debian and Ubuntu
  /// use `apt-get`, and FreeBSD uses `pkg`.
  final String userData;

  /// The Availability Zone for the new Amazon EC2 instance.
  final String availabilityZone;

  InstanceEntry({
    @required this.sourceName,
    @required this.instanceType,
    @required this.portInfoSource,
    this.userData,
    @required this.availabilityZone,
  });
}

/// Describes the hardware for the instance.
class InstanceHardware {
  /// The number of vCPUs the instance has.
  final int cpuCount;

  /// The disks attached to the instance.
  final List<Disk> disks;

  /// The amount of RAM in GB on the instance (e.g., `1.0`).
  final double ramSizeInGb;

  InstanceHardware({
    this.cpuCount,
    this.disks,
    this.ramSizeInGb,
  });
  static InstanceHardware fromJson(Map<String, dynamic> json) =>
      InstanceHardware();
}

/// Describes information about the health of the instance.
class InstanceHealthSummary {
  /// The name of the Lightsail instance for which you are requesting health
  /// check data.
  final String instanceName;

  /// Describes the overall instance health. Valid values are below.
  final String instanceHealth;

  /// More information about the instance health. If the `instanceHealth` is
  /// `healthy`, then an `instanceHealthReason` value is not provided.
  ///
  /// If  **`instanceHealth`**  is `initial`, the  **`instanceHealthReason`**
  /// value can be one of the following:
  ///
  /// *     **`Lb.RegistrationInProgress`**  - The target instance is in the
  /// process of being registered with the load balancer.
  ///
  /// *     **`Lb.InitialHealthChecking`**  - The Lightsail load balancer is
  /// still sending the target instance the minimum number of health checks
  /// required to determine its health status.
  ///
  ///
  /// If  **`instanceHealth`**  is `unhealthy`, the  **`instanceHealthReason`**
  /// value can be one of the following:
  ///
  /// *     **`Instance.ResponseCodeMismatch`**  - The health checks did not
  /// return an expected HTTP code.
  ///
  /// *     **`Instance.Timeout`**  - The health check requests timed out.
  ///
  /// *     **`Instance.FailedHealthChecks`**  - The health checks failed
  /// because the connection to the target instance timed out, the target
  /// instance response was malformed, or the target instance failed the health
  /// check for an unknown reason.
  ///
  /// *     **`Lb.InternalError`**  - The health checks failed due to an
  /// internal error.
  ///
  ///
  /// If  **`instanceHealth`**  is `unused`, the  **`instanceHealthReason`**
  /// value can be one of the following:
  ///
  /// *     **`Instance.NotRegistered`**  - The target instance is not
  /// registered with the target group.
  ///
  /// *     **`Instance.NotInUse`**  - The target group is not used by any load
  /// balancer, or the target instance is in an Availability Zone that is not
  /// enabled for its load balancer.
  ///
  /// *     **`Instance.IpUnusable`**  - The target IP address is reserved for
  /// use by a Lightsail load balancer.
  ///
  /// *     **`Instance.InvalidState`**  - The target is in the stopped or
  /// terminated state.
  ///
  ///
  /// If  **`instanceHealth`**  is `draining`, the  **`instanceHealthReason`**
  /// value can be one of the following:
  ///
  /// *     **`Instance.DeregistrationInProgress`**  - The target instance is in
  /// the process of being deregistered and the deregistration delay period has
  /// not expired.
  final String instanceHealthReason;

  InstanceHealthSummary({
    this.instanceName,
    this.instanceHealth,
    this.instanceHealthReason,
  });
  static InstanceHealthSummary fromJson(Map<String, dynamic> json) =>
      InstanceHealthSummary();
}

/// Describes monthly data transfer rates and port information for an instance.
class InstanceNetworking {
  /// The amount of data in GB allocated for monthly data transfers.
  final MonthlyTransfer monthlyTransfer;

  /// An array of key-value pairs containing information about the ports on the
  /// instance.
  final List<InstancePortInfo> ports;

  InstanceNetworking({
    this.monthlyTransfer,
    this.ports,
  });
  static InstanceNetworking fromJson(Map<String, dynamic> json) =>
      InstanceNetworking();
}

/// Describes information about the instance ports.
class InstancePortInfo {
  /// The first port in the range.
  final int fromPort;

  /// The last port in the range.
  final int toPort;

  /// The protocol being used. Can be one of the following.
  ///
  /// *    `tcp` - Transmission Control Protocol (TCP) provides reliable,
  /// ordered, and error-checked delivery of streamed data between applications
  /// running on hosts communicating by an IP network. If you have an
  /// application that doesn't require reliable data stream service, use UDP
  /// instead.
  ///
  /// *    `all` - All transport layer protocol types. For more general
  /// information, see
  /// [Transport layer](https://en.wikipedia.org/wiki/Transport_layer) on
  /// Wikipedia.
  ///
  /// *    `udp` - With User Datagram Protocol (UDP), computer applications can
  /// send messages (or datagrams) to other hosts on an Internet Protocol (IP)
  /// network. Prior communications are not required to set up transmission
  /// channels or data paths. Applications that don't require reliable data
  /// stream service can use UDP, which provides a connectionless datagram
  /// service that emphasizes reduced latency over reliability. If you do
  /// require reliable data stream service, use TCP instead.
  final String protocol;

  /// The location from which access is allowed (e.g., `Anywhere (0.0.0.0/0)`).
  final String accessFrom;

  /// The type of access (`Public` or `Private`).
  final String accessType;

  /// The common name.
  final String commonName;

  /// The access direction (`inbound` or `outbound`).
  final String accessDirection;

  InstancePortInfo({
    this.fromPort,
    this.toPort,
    this.protocol,
    this.accessFrom,
    this.accessType,
    this.commonName,
    this.accessDirection,
  });
  static InstancePortInfo fromJson(Map<String, dynamic> json) =>
      InstancePortInfo();
}

/// Describes the port state.
class InstancePortState {
  /// The first port in the range.
  final int fromPort;

  /// The last port in the range.
  final int toPort;

  /// The protocol being used. Can be one of the following.
  ///
  /// *    `tcp` - Transmission Control Protocol (TCP) provides reliable,
  /// ordered, and error-checked delivery of streamed data between applications
  /// running on hosts communicating by an IP network. If you have an
  /// application that doesn't require reliable data stream service, use UDP
  /// instead.
  ///
  /// *    `all` - All transport layer protocol types. For more general
  /// information, see
  /// [Transport layer](https://en.wikipedia.org/wiki/Transport_layer) on
  /// Wikipedia.
  ///
  /// *    `udp` - With User Datagram Protocol (UDP), computer applications can
  /// send messages (or datagrams) to other hosts on an Internet Protocol (IP)
  /// network. Prior communications are not required to set up transmission
  /// channels or data paths. Applications that don't require reliable data
  /// stream service can use UDP, which provides a connectionless datagram
  /// service that emphasizes reduced latency over reliability. If you do
  /// require reliable data stream service, use TCP instead.
  final String protocol;

  /// Specifies whether the instance port is `open` or `closed`.
  final String state;

  InstancePortState({
    this.fromPort,
    this.toPort,
    this.protocol,
    this.state,
  });
  static InstancePortState fromJson(Map<String, dynamic> json) =>
      InstancePortState();
}

/// Describes the snapshot of the virtual private server, or _instance_.
class InstanceSnapshot {
  /// The name of the snapshot.
  final String name;

  /// The Amazon Resource Name (ARN) of the snapshot (e.g.,
  /// `arn:aws:lightsail:us-east-2:123456789101:InstanceSnapshot/d23b5706-3322-4d83-81e5-12345EXAMPLE`).
  final String arn;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more
  /// easily.
  final String supportCode;

  /// The timestamp when the snapshot was created (e.g., `1479907467.024`).
  final DateTime createdAt;

  /// The region name and Availability Zone where you created the snapshot.
  final ResourceLocation location;

  /// The type of resource (usually `InstanceSnapshot`).
  final String resourceType;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags).
  final List<Tag> tags;

  /// The state the snapshot is in.
  final String state;

  /// The progress of the snapshot.
  final String progress;

  /// An array of disk objects containing information about all block storage
  /// disks.
  final List<Disk> fromAttachedDisks;

  /// The instance from which the snapshot was created.
  final String fromInstanceName;

  /// The Amazon Resource Name (ARN) of the instance from which the snapshot was
  /// created (e.g.,
  /// `arn:aws:lightsail:us-east-2:123456789101:Instance/64b8404c-ccb1-430b-8daf-12345EXAMPLE`).
  final String fromInstanceArn;

  /// The blueprint ID from which you created the snapshot (e.g.,
  /// `os_debian_8_3`). A blueprint is a virtual private server (or _instance_)
  /// image used to create instances quickly.
  final String fromBlueprintId;

  /// The bundle ID from which you created the snapshot (e.g., `micro_1_0`).
  final String fromBundleId;

  /// The size in GB of the SSD.
  final int sizeInGb;

  InstanceSnapshot({
    this.name,
    this.arn,
    this.supportCode,
    this.createdAt,
    this.location,
    this.resourceType,
    this.tags,
    this.state,
    this.progress,
    this.fromAttachedDisks,
    this.fromInstanceName,
    this.fromInstanceArn,
    this.fromBlueprintId,
    this.fromBundleId,
    this.sizeInGb,
  });
  static InstanceSnapshot fromJson(Map<String, dynamic> json) =>
      InstanceSnapshot();
}

/// Describes an instance snapshot.
class InstanceSnapshotInfo {
  /// The bundle ID from which the source instance was created (e.g.,
  /// `micro_1_0`).
  final String fromBundleId;

  /// The blueprint ID from which the source instance (e.g., `os_debian_8_3`).
  final String fromBlueprintId;

  /// A list of objects describing the disks that were attached to the source
  /// instance.
  final List<DiskInfo> fromDiskInfo;

  InstanceSnapshotInfo({
    this.fromBundleId,
    this.fromBlueprintId,
    this.fromDiskInfo,
  });
  static InstanceSnapshotInfo fromJson(Map<String, dynamic> json) =>
      InstanceSnapshotInfo();
}

/// Describes the virtual private server (or _instance_) status.
class InstanceState {
  /// The status code for the instance.
  final int code;

  /// The state of the instance (e.g., `running` or `pending`).
  final String name;

  InstanceState({
    this.code,
    this.name,
  });
  static InstanceState fromJson(Map<String, dynamic> json) => InstanceState();
}

class IsVpcPeeredResult {
  /// Returns `true` if the Lightsail VPC is peered; otherwise, `false`.
  final bool isPeered;

  IsVpcPeeredResult({
    this.isPeered,
  });
  static IsVpcPeeredResult fromJson(Map<String, dynamic> json) =>
      IsVpcPeeredResult();
}

/// Describes the SSH key pair.
class KeyPair {
  /// The friendly name of the SSH key pair.
  final String name;

  /// The Amazon Resource Name (ARN) of the key pair (e.g.,
  /// `arn:aws:lightsail:us-east-2:123456789101:KeyPair/05859e3d-331d-48ba-9034-12345EXAMPLE`).
  final String arn;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more
  /// easily.
  final String supportCode;

  /// The timestamp when the key pair was created (e.g., `1479816991.349`).
  final DateTime createdAt;

  /// The region name and Availability Zone where the key pair was created.
  final ResourceLocation location;

  /// The resource type (usually `KeyPair`).
  final String resourceType;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags).
  final List<Tag> tags;

  /// The RSA fingerprint of the key pair.
  final String fingerprint;

  KeyPair({
    this.name,
    this.arn,
    this.supportCode,
    this.createdAt,
    this.location,
    this.resourceType,
    this.tags,
    this.fingerprint,
  });
  static KeyPair fromJson(Map<String, dynamic> json) => KeyPair();
}

/// Describes the Lightsail load balancer.
class LoadBalancer {
  /// The name of the load balancer (e.g., `my-load-balancer`).
  final String name;

  /// The Amazon Resource Name (ARN) of the load balancer.
  final String arn;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail load balancer. This code enables our
  /// support team to look up your Lightsail information more easily.
  final String supportCode;

  /// The date when your load balancer was created.
  final DateTime createdAt;

  /// The AWS Region where your load balancer was created (e.g., `us-east-2a`).
  /// Lightsail automatically creates your load balancer across Availability
  /// Zones.
  final ResourceLocation location;

  /// The resource type (e.g., `LoadBalancer`.
  final String resourceType;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags).
  final List<Tag> tags;

  /// The DNS name of your Lightsail load balancer.
  final String dnsName;

  /// The status of your load balancer. Valid values are below.
  final String state;

  /// The protocol you have enabled for your load balancer. Valid values are
  /// below.
  ///
  /// You can't just have `HTTP_HTTPS`, but you can have just `HTTP`.
  final String protocol;

  /// An array of public port settings for your load balancer. For HTTP, use
  /// port 80. For HTTPS, use port 443.
  final List<int> publicPorts;

  /// The path you specified to perform your health checks. If no path is
  /// specified, the load balancer tries to make a request to the default (root)
  /// page.
  final String healthCheckPath;

  /// The port where the load balancer will direct traffic to your Lightsail
  /// instances. For HTTP traffic, it's port 80. For HTTPS traffic, it's port
  /// 443.
  final int instancePort;

  /// An array of InstanceHealthSummary objects describing the health of the
  /// load balancer.
  final List<InstanceHealthSummary> instanceHealthSummary;

  /// An array of LoadBalancerTlsCertificateSummary objects that provide
  /// additional information about the SSL/TLS certificates. For example, if
  /// `true`, the certificate is attached to the load balancer.
  final List<LoadBalancerTlsCertificateSummary> tlsCertificateSummaries;

  /// A string to string map of the configuration options for your load
  /// balancer. Valid values are listed below.
  final Map<String, String> configurationOptions;

  LoadBalancer({
    this.name,
    this.arn,
    this.supportCode,
    this.createdAt,
    this.location,
    this.resourceType,
    this.tags,
    this.dnsName,
    this.state,
    this.protocol,
    this.publicPorts,
    this.healthCheckPath,
    this.instancePort,
    this.instanceHealthSummary,
    this.tlsCertificateSummaries,
    this.configurationOptions,
  });
  static LoadBalancer fromJson(Map<String, dynamic> json) => LoadBalancer();
}

/// Describes a load balancer SSL/TLS certificate.
///
/// TLS is just an updated, more secure version of Secure Socket Layer (SSL).
class LoadBalancerTlsCertificate {
  /// The name of the SSL/TLS certificate (e.g., `my-certificate`).
  final String name;

  /// The Amazon Resource Name (ARN) of the SSL/TLS certificate.
  final String arn;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail load balancer or SSL/TLS certificate. This
  /// code enables our support team to look up your Lightsail information more
  /// easily.
  final String supportCode;

  /// The time when you created your SSL/TLS certificate.
  final DateTime createdAt;

  /// The AWS Region and Availability Zone where you created your certificate.
  final ResourceLocation location;

  /// The resource type (e.g., `LoadBalancerTlsCertificate`).
  ///
  /// *     **`Instance`**  - A Lightsail instance (a virtual private server)
  ///
  /// *     **`StaticIp`**  - A static IP address
  ///
  /// *     **`KeyPair`**  - The key pair used to connect to a Lightsail
  /// instance
  ///
  /// *     **`InstanceSnapshot`**  - A Lightsail instance snapshot
  ///
  /// *     **`Domain`**  - A DNS zone
  ///
  /// *     **`PeeredVpc`**  - A peered VPC
  ///
  /// *     **`LoadBalancer`**  - A Lightsail load balancer
  ///
  /// *     **`LoadBalancerTlsCertificate`**  - An SSL/TLS certificate
  /// associated with a Lightsail load balancer
  ///
  /// *     **`Disk`**  - A Lightsail block storage disk
  ///
  /// *     **`DiskSnapshot`**  - A block storage disk snapshot
  final String resourceType;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags).
  final List<Tag> tags;

  /// The load balancer name where your SSL/TLS certificate is attached.
  final String loadBalancerName;

  /// When `true`, the SSL/TLS certificate is attached to the Lightsail load
  /// balancer.
  final bool isAttached;

  /// The status of the SSL/TLS certificate. Valid values are below.
  final String status;

  /// The domain name for your SSL/TLS certificate.
  final String domainName;

  /// An array of LoadBalancerTlsCertificateDomainValidationRecord objects
  /// describing the records.
  final List<LoadBalancerTlsCertificateDomainValidationRecord>
      domainValidationRecords;

  /// The reason for the SSL/TLS certificate validation failure.
  final String failureReason;

  /// The time when the SSL/TLS certificate was issued.
  final DateTime issuedAt;

  /// The issuer of the certificate.
  final String issuer;

  /// The algorithm that was used to generate the key pair (the public and
  /// private key).
  final String keyAlgorithm;

  /// The timestamp when the SSL/TLS certificate expires.
  final DateTime notAfter;

  /// The timestamp when the SSL/TLS certificate is first valid.
  final DateTime notBefore;

  /// An object containing information about the status of Lightsail's managed
  /// renewal for the certificate.
  final LoadBalancerTlsCertificateRenewalSummary renewalSummary;

  /// The reason the certificate was revoked. Valid values are below.
  final String revocationReason;

  /// The timestamp when the SSL/TLS certificate was revoked.
  final DateTime revokedAt;

  /// The serial number of the certificate.
  final String serial;

  /// The algorithm that was used to sign the certificate.
  final String signatureAlgorithm;

  /// The name of the entity that is associated with the public key contained in
  /// the certificate.
  final String subject;

  /// One or more domains or subdomains included in the certificate. This list
  /// contains the domain names that are bound to the public key that is
  /// contained in the certificate. The subject alternative names include the
  /// canonical domain name (CNAME) of the certificate and additional domain
  /// names that can be used to connect to the website, such as `example.com`,
  /// `www.example.com`, or `m.example.com`.
  final List<String> subjectAlternativeNames;

  LoadBalancerTlsCertificate({
    this.name,
    this.arn,
    this.supportCode,
    this.createdAt,
    this.location,
    this.resourceType,
    this.tags,
    this.loadBalancerName,
    this.isAttached,
    this.status,
    this.domainName,
    this.domainValidationRecords,
    this.failureReason,
    this.issuedAt,
    this.issuer,
    this.keyAlgorithm,
    this.notAfter,
    this.notBefore,
    this.renewalSummary,
    this.revocationReason,
    this.revokedAt,
    this.serial,
    this.signatureAlgorithm,
    this.subject,
    this.subjectAlternativeNames,
  });
  static LoadBalancerTlsCertificate fromJson(Map<String, dynamic> json) =>
      LoadBalancerTlsCertificate();
}

/// Contains information about the domain names on an SSL/TLS certificate that
/// you will use to validate domain ownership.
class LoadBalancerTlsCertificateDomainValidationOption {
  /// The fully qualified domain name in the certificate request.
  final String domainName;

  /// The status of the domain validation. Valid values are listed below.
  final String validationStatus;

  LoadBalancerTlsCertificateDomainValidationOption({
    this.domainName,
    this.validationStatus,
  });
  static LoadBalancerTlsCertificateDomainValidationOption fromJson(
          Map<String, dynamic> json) =>
      LoadBalancerTlsCertificateDomainValidationOption();
}

/// Describes the validation record of each domain name in the SSL/TLS
/// certificate.
class LoadBalancerTlsCertificateDomainValidationRecord {
  /// A fully qualified domain name in the certificate. For example,
  /// `example.com`.
  final String name;

  /// The type of validation record. For example, `CNAME` for domain validation.
  final String type;

  /// The value for that type.
  final String value;

  /// The validation status. Valid values are listed below.
  final String validationStatus;

  /// The domain name against which your SSL/TLS certificate was validated.
  final String domainName;

  LoadBalancerTlsCertificateDomainValidationRecord({
    this.name,
    this.type,
    this.value,
    this.validationStatus,
    this.domainName,
  });
  static LoadBalancerTlsCertificateDomainValidationRecord fromJson(
          Map<String, dynamic> json) =>
      LoadBalancerTlsCertificateDomainValidationRecord();
}

/// Contains information about the status of Lightsail's managed renewal for the
/// certificate.
class LoadBalancerTlsCertificateRenewalSummary {
  /// The status of Lightsail's managed renewal of the certificate. Valid values
  /// are listed below.
  final String renewalStatus;

  /// Contains information about the validation of each domain name in the
  /// certificate, as it pertains to Lightsail's managed renewal. This is
  /// different from the initial validation that occurs as a result of the
  /// RequestCertificate request.
  final List<LoadBalancerTlsCertificateDomainValidationOption>
      domainValidationOptions;

  LoadBalancerTlsCertificateRenewalSummary({
    this.renewalStatus,
    this.domainValidationOptions,
  });
  static LoadBalancerTlsCertificateRenewalSummary fromJson(
          Map<String, dynamic> json) =>
      LoadBalancerTlsCertificateRenewalSummary();
}

/// Provides a summary of SSL/TLS certificate metadata.
class LoadBalancerTlsCertificateSummary {
  /// The name of the SSL/TLS certificate.
  final String name;

  /// When `true`, the SSL/TLS certificate is attached to the Lightsail load
  /// balancer.
  final bool isAttached;

  LoadBalancerTlsCertificateSummary({
    this.name,
    this.isAttached,
  });
  static LoadBalancerTlsCertificateSummary fromJson(
          Map<String, dynamic> json) =>
      LoadBalancerTlsCertificateSummary();
}

/// Describes a database log event.
class LogEvent {
  /// The timestamp when the database log event was created.
  final DateTime createdAt;

  /// The message of the database log event.
  final String message;

  LogEvent({
    this.createdAt,
    this.message,
  });
  static LogEvent fromJson(Map<String, dynamic> json) => LogEvent();
}

/// Describes the metric data point.
class MetricDatapoint {
  /// The average.
  final double average;

  /// The maximum.
  final double maximum;

  /// The minimum.
  final double minimum;

  /// The sample count.
  final double sampleCount;

  /// The sum.
  final double sum;

  /// The timestamp (e.g., `1479816991.349`).
  final DateTime timestamp;

  /// The unit.
  final String unit;

  MetricDatapoint({
    this.average,
    this.maximum,
    this.minimum,
    this.sampleCount,
    this.sum,
    this.timestamp,
    this.unit,
  });
  static MetricDatapoint fromJson(Map<String, dynamic> json) =>
      MetricDatapoint();
}

/// Describes the monthly data transfer in and out of your virtual private
/// server (or _instance_).
class MonthlyTransfer {
  /// The amount allocated per month (in GB).
  final int gbPerMonthAllocated;

  MonthlyTransfer({
    this.gbPerMonthAllocated,
  });
  static MonthlyTransfer fromJson(Map<String, dynamic> json) =>
      MonthlyTransfer();
}

class OpenInstancePublicPortsResult {
  /// An array of key-value pairs containing information about the request
  /// operation.
  final Operation operation;

  OpenInstancePublicPortsResult({
    this.operation,
  });
  static OpenInstancePublicPortsResult fromJson(Map<String, dynamic> json) =>
      OpenInstancePublicPortsResult();
}

/// Describes the API operation.
class Operation {
  /// The ID of the operation.
  final String id;

  /// The resource name.
  final String resourceName;

  /// The resource type.
  final String resourceType;

  /// The timestamp when the operation was initialized (e.g., `1479816991.349`).
  final DateTime createdAt;

  /// The region and Availability Zone.
  final ResourceLocation location;

  /// A Boolean value indicating whether the operation is terminal.
  final bool isTerminal;

  /// Details about the operation (e.g., `Debian-1GB-Ohio-1`).
  final String operationDetails;

  /// The type of operation.
  final String operationType;

  /// The status of the operation.
  final String status;

  /// The timestamp when the status was changed (e.g., `1479816991.349`).
  final DateTime statusChangedAt;

  /// The error code.
  final String errorCode;

  /// The error details.
  final String errorDetails;

  Operation({
    this.id,
    this.resourceName,
    this.resourceType,
    this.createdAt,
    this.location,
    this.isTerminal,
    this.operationDetails,
    this.operationType,
    this.status,
    this.statusChangedAt,
    this.errorCode,
    this.errorDetails,
  });
  static Operation fromJson(Map<String, dynamic> json) => Operation();
}

/// The password data for the Windows Server-based instance, including the
/// ciphertext and the key pair name.
class PasswordData {
  /// The encrypted password. Ciphertext will be an empty string if access to
  /// your new instance is not ready yet. When you create an instance, it can
  /// take up to 15 minutes for the instance to be ready.
  ///
  ///
  ///
  /// If you use the default key pair (`LightsailDefaultKeyPair`), the decrypted
  /// password will be available in the password field.
  ///
  /// If you are using a custom key pair, you need to use your own means of
  /// decryption.
  ///
  /// If you change the Administrator password on the instance, Lightsail will
  /// continue to return the original ciphertext value. When accessing the
  /// instance using RDP, you need to manually enter the Administrator password
  /// after changing it from the default.
  final String ciphertext;

  /// The name of the key pair that you used when creating your instance. If no
  /// key pair name was specified when creating the instance, Lightsail uses the
  /// default key pair (`LightsailDefaultKeyPair`).
  ///
  /// If you are using a custom key pair, you need to use your own means of
  /// decrypting your password using the `ciphertext`. Lightsail creates the
  /// ciphertext by encrypting your password with the public key part of this
  /// key pair.
  final String keyPairName;

  PasswordData({
    this.ciphertext,
    this.keyPairName,
  });
  static PasswordData fromJson(Map<String, dynamic> json) => PasswordData();
}

class PeerVpcResult {
  /// An array of key-value pairs containing information about the request
  /// operation.
  final Operation operation;

  PeerVpcResult({
    this.operation,
  });
  static PeerVpcResult fromJson(Map<String, dynamic> json) => PeerVpcResult();
}

/// Describes a pending database maintenance action.
class PendingMaintenanceAction {
  /// The type of pending database maintenance action.
  final String action;

  /// Additional detail about the pending database maintenance action.
  final String description;

  /// The effective date of the pending database maintenance action.
  final DateTime currentApplyDate;

  PendingMaintenanceAction({
    this.action,
    this.description,
    this.currentApplyDate,
  });
  static PendingMaintenanceAction fromJson(Map<String, dynamic> json) =>
      PendingMaintenanceAction();
}

/// Describes a pending database value modification.
class PendingModifiedRelationalDatabaseValues {
  /// The password for the master user of the database.
  final String masterUserPassword;

  /// The database engine version.
  final String engineVersion;

  /// A Boolean value indicating whether automated backup retention is enabled.
  final bool backupRetentionEnabled;

  PendingModifiedRelationalDatabaseValues({
    this.masterUserPassword,
    this.engineVersion,
    this.backupRetentionEnabled,
  });
  static PendingModifiedRelationalDatabaseValues fromJson(
          Map<String, dynamic> json) =>
      PendingModifiedRelationalDatabaseValues();
}

/// Describes information about the ports on your virtual private server (or
/// _instance_).
class PortInfo {
  /// The first port in the range.
  final int fromPort;

  /// The last port in the range.
  final int toPort;

  /// The protocol.
  final String protocol;

  PortInfo({
    this.fromPort,
    this.toPort,
    this.protocol,
  });
}

class PutInstancePublicPortsResult {
  /// Describes metadata about the operation you just executed.
  final Operation operation;

  PutInstancePublicPortsResult({
    this.operation,
  });
  static PutInstancePublicPortsResult fromJson(Map<String, dynamic> json) =>
      PutInstancePublicPortsResult();
}

class RebootInstanceResult {
  /// An array of key-value pairs containing information about the request
  /// operations.
  final List<Operation> operations;

  RebootInstanceResult({
    this.operations,
  });
  static RebootInstanceResult fromJson(Map<String, dynamic> json) =>
      RebootInstanceResult();
}

class RebootRelationalDatabaseResult {
  /// An object describing the result of your reboot relational database
  /// request.
  final List<Operation> operations;

  RebootRelationalDatabaseResult({
    this.operations,
  });
  static RebootRelationalDatabaseResult fromJson(Map<String, dynamic> json) =>
      RebootRelationalDatabaseResult();
}

/// Describes the AWS Region.
class Region {
  /// The continent code (e.g., `NA`, meaning North America).
  final String continentCode;

  /// The description of the AWS Region (e.g., `This region is recommended to
  /// serve users in the eastern United States and eastern Canada`).
  final String description;

  /// The display name (e.g., `Ohio`).
  final String displayName;

  /// The region name (e.g., `us-east-2`).
  final String name;

  /// The Availability Zones. Follows the format `us-east-2a` (case-sensitive).
  final List<AvailabilityZone> availabilityZones;

  /// The Availability Zones for databases. Follows the format `us-east-2a`
  /// (case-sensitive).
  final List<AvailabilityZone> relationalDatabaseAvailabilityZones;

  Region({
    this.continentCode,
    this.description,
    this.displayName,
    this.name,
    this.availabilityZones,
    this.relationalDatabaseAvailabilityZones,
  });
  static Region fromJson(Map<String, dynamic> json) => Region();
}

/// Describes a database.
class RelationalDatabase {
  /// The unique name of the database resource in Lightsail.
  final String name;

  /// The Amazon Resource Name (ARN) of the database.
  final String arn;

  /// The support code for the database. Include this code in your email to
  /// support when you have questions about a database in Lightsail. This code
  /// enables our support team to look up your Lightsail information more
  /// easily.
  final String supportCode;

  /// The timestamp when the database was created. Formatted in Unix time.
  final DateTime createdAt;

  /// The Region name and Availability Zone where the database is located.
  final ResourceLocation location;

  /// The Lightsail resource type for the database (for example,
  /// `RelationalDatabase`).
  final String resourceType;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags).
  final List<Tag> tags;

  /// The blueprint ID for the database. A blueprint describes the major engine
  /// version of a database.
  final String relationalDatabaseBlueprintId;

  /// The bundle ID for the database. A bundle describes the performance
  /// specifications for your database.
  final String relationalDatabaseBundleId;

  /// The name of the master database created when the Lightsail database
  /// resource is created.
  final String masterDatabaseName;

  /// Describes the hardware of the database.
  final RelationalDatabaseHardware hardware;

  /// Describes the current state of the database.
  final String state;

  /// Describes the secondary Availability Zone of a high availability database.
  ///
  /// The secondary database is used for failover support of a high availability
  /// database.
  final String secondaryAvailabilityZone;

  /// A Boolean value indicating whether automated backup retention is enabled
  /// for the database.
  final bool backupRetentionEnabled;

  /// Describes pending database value modifications.
  final PendingModifiedRelationalDatabaseValues pendingModifiedValues;

  /// The database software (for example, `MySQL`).
  final String engine;

  /// The database engine version (for example, `5.7.23`).
  final String engineVersion;

  /// The latest point in time to which the database can be restored. Formatted
  /// in Unix time.
  final DateTime latestRestorableTime;

  /// The master user name of the database.
  final String masterUsername;

  /// The status of parameter updates for the database.
  final String parameterApplyStatus;

  /// The daily time range during which automated backups are created for the
  /// database (for example, `16:00-16:30`).
  final String preferredBackupWindow;

  /// The weekly time range during which system maintenance can occur on the
  /// database.
  ///
  /// In the format `ddd:hh24:mi-ddd:hh24:mi`. For example,
  /// `Tue:17:00-Tue:17:30`.
  final String preferredMaintenanceWindow;

  /// A Boolean value indicating whether the database is publicly accessible.
  final bool publiclyAccessible;

  /// The master endpoint for the database.
  final RelationalDatabaseEndpoint masterEndpoint;

  /// Describes the pending maintenance actions for the database.
  final List<PendingMaintenanceAction> pendingMaintenanceActions;

  RelationalDatabase({
    this.name,
    this.arn,
    this.supportCode,
    this.createdAt,
    this.location,
    this.resourceType,
    this.tags,
    this.relationalDatabaseBlueprintId,
    this.relationalDatabaseBundleId,
    this.masterDatabaseName,
    this.hardware,
    this.state,
    this.secondaryAvailabilityZone,
    this.backupRetentionEnabled,
    this.pendingModifiedValues,
    this.engine,
    this.engineVersion,
    this.latestRestorableTime,
    this.masterUsername,
    this.parameterApplyStatus,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.publiclyAccessible,
    this.masterEndpoint,
    this.pendingMaintenanceActions,
  });
  static RelationalDatabase fromJson(Map<String, dynamic> json) =>
      RelationalDatabase();
}

/// Describes a database image, or blueprint. A blueprint describes the major
/// engine version of a database.
class RelationalDatabaseBlueprint {
  /// The ID for the database blueprint.
  final String blueprintId;

  /// The database software of the database blueprint (for example, `MySQL`).
  final String engine;

  /// The database engine version for the database blueprint (for example,
  /// `5.7.23`).
  final String engineVersion;

  /// The description of the database engine for the database blueprint.
  final String engineDescription;

  /// The description of the database engine version for the database blueprint.
  final String engineVersionDescription;

  /// A Boolean value indicating whether the engine version is the default for
  /// the database blueprint.
  final bool isEngineDefault;

  RelationalDatabaseBlueprint({
    this.blueprintId,
    this.engine,
    this.engineVersion,
    this.engineDescription,
    this.engineVersionDescription,
    this.isEngineDefault,
  });
  static RelationalDatabaseBlueprint fromJson(Map<String, dynamic> json) =>
      RelationalDatabaseBlueprint();
}

/// Describes a database bundle. A bundle describes the performance
/// specifications of the database.
class RelationalDatabaseBundle {
  /// The ID for the database bundle.
  final String bundleId;

  /// The name for the database bundle.
  final String name;

  /// The cost of the database bundle in US currency.
  final double price;

  /// The amount of RAM in GB (for example, `2.0`) for the database bundle.
  final double ramSizeInGb;

  /// The size of the disk for the database bundle.
  final int diskSizeInGb;

  /// The data transfer rate per month in GB for the database bundle.
  final int transferPerMonthInGb;

  /// The number of virtual CPUs (vCPUs) for the database bundle.
  final int cpuCount;

  /// A Boolean value indicating whether the database bundle is encrypted.
  final bool isEncrypted;

  /// A Boolean value indicating whether the database bundle is active.
  final bool isActive;

  RelationalDatabaseBundle({
    this.bundleId,
    this.name,
    this.price,
    this.ramSizeInGb,
    this.diskSizeInGb,
    this.transferPerMonthInGb,
    this.cpuCount,
    this.isEncrypted,
    this.isActive,
  });
  static RelationalDatabaseBundle fromJson(Map<String, dynamic> json) =>
      RelationalDatabaseBundle();
}

/// Describes an endpoint for a database.
class RelationalDatabaseEndpoint {
  /// Specifies the port that the database is listening on.
  final int port;

  /// Specifies the DNS address of the database.
  final String address;

  RelationalDatabaseEndpoint({
    this.port,
    this.address,
  });
  static RelationalDatabaseEndpoint fromJson(Map<String, dynamic> json) =>
      RelationalDatabaseEndpoint();
}

/// Describes an event for a database.
class RelationalDatabaseEvent {
  /// The database that the database event relates to.
  final String resource;

  /// The timestamp when the database event was created.
  final DateTime createdAt;

  /// The message of the database event.
  final String message;

  /// The category that the database event belongs to.
  final List<String> eventCategories;

  RelationalDatabaseEvent({
    this.resource,
    this.createdAt,
    this.message,
    this.eventCategories,
  });
  static RelationalDatabaseEvent fromJson(Map<String, dynamic> json) =>
      RelationalDatabaseEvent();
}

/// Describes the hardware of a database.
class RelationalDatabaseHardware {
  /// The number of vCPUs for the database.
  final int cpuCount;

  /// The size of the disk for the database.
  final int diskSizeInGb;

  /// The amount of RAM in GB for the database.
  final double ramSizeInGb;

  RelationalDatabaseHardware({
    this.cpuCount,
    this.diskSizeInGb,
    this.ramSizeInGb,
  });
  static RelationalDatabaseHardware fromJson(Map<String, dynamic> json) =>
      RelationalDatabaseHardware();
}

/// Describes the parameters of a database.
class RelationalDatabaseParameter {
  /// Specifies the valid range of values for the parameter.
  final String allowedValues;

  /// Indicates when parameter updates are applied.
  ///
  /// Can be `immediate` or `pending-reboot`.
  final String applyMethod;

  /// Specifies the engine-specific parameter type.
  final String applyType;

  /// Specifies the valid data type for the parameter.
  final String dataType;

  /// Provides a description of the parameter.
  final String description;

  /// A Boolean value indicating whether the parameter can be modified.
  final bool isModifiable;

  /// Specifies the name of the parameter.
  final String parameterName;

  /// Specifies the value of the parameter.
  final String parameterValue;

  RelationalDatabaseParameter({
    this.allowedValues,
    this.applyMethod,
    this.applyType,
    this.dataType,
    this.description,
    this.isModifiable,
    this.parameterName,
    this.parameterValue,
  });
  static RelationalDatabaseParameter fromJson(Map<String, dynamic> json) =>
      RelationalDatabaseParameter();
}

/// Describes a database snapshot.
class RelationalDatabaseSnapshot {
  /// The name of the database snapshot.
  final String name;

  /// The Amazon Resource Name (ARN) of the database snapshot.
  final String arn;

  /// The support code for the database snapshot. Include this code in your
  /// email to support when you have questions about a database snapshot in
  /// Lightsail. This code enables our support team to look up your Lightsail
  /// information more easily.
  final String supportCode;

  /// The timestamp when the database snapshot was created.
  final DateTime createdAt;

  /// The Region name and Availability Zone where the database snapshot is
  /// located.
  final ResourceLocation location;

  /// The Lightsail resource type.
  final String resourceType;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the
  /// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags).
  final List<Tag> tags;

  /// The software of the database snapshot (for example, `MySQL`)
  final String engine;

  /// The database engine version for the database snapshot (for example,
  /// `5.7.23`).
  final String engineVersion;

  /// The size of the disk in GB (for example, `32`) for the database snapshot.
  final int sizeInGb;

  /// The state of the database snapshot.
  final String state;

  /// The name of the source database from which the database snapshot was
  /// created.
  final String fromRelationalDatabaseName;

  /// The Amazon Resource Name (ARN) of the database from which the database
  /// snapshot was created.
  final String fromRelationalDatabaseArn;

  /// The bundle ID of the database from which the database snapshot was
  /// created.
  final String fromRelationalDatabaseBundleId;

  /// The blueprint ID of the database from which the database snapshot was
  /// created. A blueprint describes the major engine version of a database.
  final String fromRelationalDatabaseBlueprintId;

  RelationalDatabaseSnapshot({
    this.name,
    this.arn,
    this.supportCode,
    this.createdAt,
    this.location,
    this.resourceType,
    this.tags,
    this.engine,
    this.engineVersion,
    this.sizeInGb,
    this.state,
    this.fromRelationalDatabaseName,
    this.fromRelationalDatabaseArn,
    this.fromRelationalDatabaseBundleId,
    this.fromRelationalDatabaseBlueprintId,
  });
  static RelationalDatabaseSnapshot fromJson(Map<String, dynamic> json) =>
      RelationalDatabaseSnapshot();
}

class ReleaseStaticIpResult {
  /// An array of key-value pairs containing information about the request
  /// operation.
  final List<Operation> operations;

  ReleaseStaticIpResult({
    this.operations,
  });
  static ReleaseStaticIpResult fromJson(Map<String, dynamic> json) =>
      ReleaseStaticIpResult();
}

/// Describes the resource location.
class ResourceLocation {
  /// The Availability Zone. Follows the format `us-east-2a` (case-sensitive).
  final String availabilityZone;

  /// The AWS Region name.
  final String regionName;

  ResourceLocation({
    this.availabilityZone,
    this.regionName,
  });
  static ResourceLocation fromJson(Map<String, dynamic> json) =>
      ResourceLocation();
}

class StartInstanceResult {
  /// An array of key-value pairs containing information about the request
  /// operation.
  final List<Operation> operations;

  StartInstanceResult({
    this.operations,
  });
  static StartInstanceResult fromJson(Map<String, dynamic> json) =>
      StartInstanceResult();
}

class StartRelationalDatabaseResult {
  /// An object describing the result of your start relational database request.
  final List<Operation> operations;

  StartRelationalDatabaseResult({
    this.operations,
  });
  static StartRelationalDatabaseResult fromJson(Map<String, dynamic> json) =>
      StartRelationalDatabaseResult();
}

/// Describes the static IP.
class StaticIp {
  /// The name of the static IP (e.g., `StaticIP-Ohio-EXAMPLE`).
  final String name;

  /// The Amazon Resource Name (ARN) of the static IP (e.g.,
  /// `arn:aws:lightsail:us-east-2:123456789101:StaticIp/9cbb4a9e-f8e3-4dfe-b57e-12345EXAMPLE`).
  final String arn;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more
  /// easily.
  final String supportCode;

  /// The timestamp when the static IP was created (e.g., `1479735304.222`).
  final DateTime createdAt;

  /// The region and Availability Zone where the static IP was created.
  final ResourceLocation location;

  /// The resource type (usually `StaticIp`).
  final String resourceType;

  /// The static IP address.
  final String ipAddress;

  /// The instance where the static IP is attached (e.g.,
  /// `Amazon_Linux-1GB-Ohio-1`).
  final String attachedTo;

  /// A Boolean value indicating whether the static IP is attached.
  final bool isAttached;

  StaticIp({
    this.name,
    this.arn,
    this.supportCode,
    this.createdAt,
    this.location,
    this.resourceType,
    this.ipAddress,
    this.attachedTo,
    this.isAttached,
  });
  static StaticIp fromJson(Map<String, dynamic> json) => StaticIp();
}

class StopInstanceResult {
  /// An array of key-value pairs containing information about the request
  /// operation.
  final List<Operation> operations;

  StopInstanceResult({
    this.operations,
  });
  static StopInstanceResult fromJson(Map<String, dynamic> json) =>
      StopInstanceResult();
}

class StopRelationalDatabaseResult {
  /// An object describing the result of your stop relational database request.
  final List<Operation> operations;

  StopRelationalDatabaseResult({
    this.operations,
  });
  static StopRelationalDatabaseResult fromJson(Map<String, dynamic> json) =>
      StopRelationalDatabaseResult();
}

/// Describes a tag key and optional value assigned to an Amazon Lightsail
/// resource.
///
/// For more information about tags in Lightsail, see the
/// [Lightsail Dev Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags).
class Tag {
  /// The key of the tag.
  ///
  /// Constraints: Tag keys accept a maximum of 128 letters, numbers, spaces in
  /// UTF-8, or the following characters: + - = . _ : / @
  final String key;

  /// The value of the tag.
  ///
  /// Constraints: Tag values accept a maximum of 256 letters, numbers, spaces
  /// in UTF-8, or the following characters: + - = . _ : / @
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagResourceResult {
  /// A list of objects describing the API operation.
  final List<Operation> operations;

  TagResourceResult({
    this.operations,
  });
  static TagResourceResult fromJson(Map<String, dynamic> json) =>
      TagResourceResult();
}

class UnpeerVpcResult {
  /// An array of key-value pairs containing information about the request
  /// operation.
  final Operation operation;

  UnpeerVpcResult({
    this.operation,
  });
  static UnpeerVpcResult fromJson(Map<String, dynamic> json) =>
      UnpeerVpcResult();
}

class UntagResourceResult {
  /// A list of objects describing the API operation.
  final List<Operation> operations;

  UntagResourceResult({
    this.operations,
  });
  static UntagResourceResult fromJson(Map<String, dynamic> json) =>
      UntagResourceResult();
}

class UpdateDomainEntryResult {
  /// An array of key-value pairs containing information about the request
  /// operation.
  final List<Operation> operations;

  UpdateDomainEntryResult({
    this.operations,
  });
  static UpdateDomainEntryResult fromJson(Map<String, dynamic> json) =>
      UpdateDomainEntryResult();
}

class UpdateLoadBalancerAttributeResult {
  /// An object describing the API operations.
  final List<Operation> operations;

  UpdateLoadBalancerAttributeResult({
    this.operations,
  });
  static UpdateLoadBalancerAttributeResult fromJson(
          Map<String, dynamic> json) =>
      UpdateLoadBalancerAttributeResult();
}

class UpdateRelationalDatabaseParametersResult {
  /// An object describing the result of your update relational database
  /// parameters request.
  final List<Operation> operations;

  UpdateRelationalDatabaseParametersResult({
    this.operations,
  });
  static UpdateRelationalDatabaseParametersResult fromJson(
          Map<String, dynamic> json) =>
      UpdateRelationalDatabaseParametersResult();
}

class UpdateRelationalDatabaseResult {
  /// An object describing the result of your update relational database
  /// request.
  final List<Operation> operations;

  UpdateRelationalDatabaseResult({
    this.operations,
  });
  static UpdateRelationalDatabaseResult fromJson(Map<String, dynamic> json) =>
      UpdateRelationalDatabaseResult();
}
