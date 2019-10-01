import 'package:meta/meta.dart';

/// AWS Service Catalog
///
///  [AWS Service Catalog](https://aws.amazon.com/servicecatalog/) enables
/// organizations to create and manage catalogs of IT services that are approved
/// for use on AWS. To get the most out of this documentation, you should be
/// familiar with the terminology discussed in
/// [AWS Service Catalog Concepts](http://docs.aws.amazon.com/servicecatalog/latest/adminguide/what-is_concepts.html).
class ServiceCatalogApi {
  final _client;
  ServiceCatalogApi(client)
      : _client = client.configured('Service Catalog', serializer: 'json');

  /// Accepts an offer to share the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [portfolioShareType]: The type of shared portfolios to accept. The default
  /// is to accept imported portfolios.
  ///
  /// *    `AWS_ORGANIZATIONS` - Accept portfolios shared by the master account
  /// of your organization.
  ///
  /// *    `IMPORTED` - Accept imported portfolios.
  ///
  /// *    `AWS_SERVICECATALOG` - Not supported. (Throws
  /// ResourceNotFoundException.)
  ///
  ///
  /// For example, `aws servicecatalog accept-portfolio-share --portfolio-id
  /// "port-2qwzkwxt3y5fk" --portfolio-share-type AWS_ORGANIZATIONS`
  Future<AcceptPortfolioShareOutput> acceptPortfolioShare(String portfolioId,
      {String acceptLanguage, String portfolioShareType}) async {
    var response_ = await _client.send('AcceptPortfolioShare', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PortfolioId': portfolioId,
      if (portfolioShareType != null) 'PortfolioShareType': portfolioShareType,
    });
    return AcceptPortfolioShareOutput.fromJson(response_);
  }

  /// Associates the specified budget with the specified resource.
  ///
  /// [budgetName]: The name of the budget you want to associate.
  ///
  /// [resourceId]:  The resource identifier. Either a portfolio-id or a
  /// product-id.
  Future<AssociateBudgetWithResourceOutput> associateBudgetWithResource(
      {@required String budgetName, @required String resourceId}) async {
    var response_ = await _client.send('AssociateBudgetWithResource', {
      'BudgetName': budgetName,
      'ResourceId': resourceId,
    });
    return AssociateBudgetWithResourceOutput.fromJson(response_);
  }

  /// Associates the specified principal ARN with the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [principalArn]: The ARN of the principal (IAM user, role, or group).
  ///
  /// [principalType]: The principal type. The supported value is `IAM`.
  Future<AssociatePrincipalWithPortfolioOutput> associatePrincipalWithPortfolio(
      {String acceptLanguage,
      @required String portfolioId,
      @required String principalArn,
      @required String principalType}) async {
    var response_ = await _client.send('AssociatePrincipalWithPortfolio', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PortfolioId': portfolioId,
      'PrincipalARN': principalArn,
      'PrincipalType': principalType,
    });
    return AssociatePrincipalWithPortfolioOutput.fromJson(response_);
  }

  /// Associates the specified product with the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [productId]: The product identifier.
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [sourcePortfolioId]: The identifier of the source portfolio.
  Future<AssociateProductWithPortfolioOutput> associateProductWithPortfolio(
      {String acceptLanguage,
      @required String productId,
      @required String portfolioId,
      String sourcePortfolioId}) async {
    var response_ = await _client.send('AssociateProductWithPortfolio', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ProductId': productId,
      'PortfolioId': portfolioId,
      if (sourcePortfolioId != null) 'SourcePortfolioId': sourcePortfolioId,
    });
    return AssociateProductWithPortfolioOutput.fromJson(response_);
  }

  /// Associates a self-service action with a provisioning artifact.
  ///
  /// [productId]: The product identifier. For example, `prod-abcdzk7xy33qa`.
  ///
  /// [provisioningArtifactId]: The identifier of the provisioning artifact. For
  /// example, `pa-4abcdjnxjj6ne`.
  ///
  /// [serviceActionId]: The self-service action identifier. For example,
  /// `act-fs7abcd89wxyz`.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  Future<AssociateServiceActionWithProvisioningArtifactOutput>
      associateServiceActionWithProvisioningArtifact(
          {@required String productId,
          @required String provisioningArtifactId,
          @required String serviceActionId,
          String acceptLanguage}) async {
    var response_ =
        await _client.send('AssociateServiceActionWithProvisioningArtifact', {
      'ProductId': productId,
      'ProvisioningArtifactId': provisioningArtifactId,
      'ServiceActionId': serviceActionId,
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
    });
    return AssociateServiceActionWithProvisioningArtifactOutput.fromJson(
        response_);
  }

  /// Associate the specified TagOption with the specified portfolio or product.
  ///
  /// [resourceId]: The resource identifier.
  ///
  /// [tagOptionId]: The TagOption identifier.
  Future<AssociateTagOptionWithResourceOutput> associateTagOptionWithResource(
      {@required String resourceId, @required String tagOptionId}) async {
    var response_ = await _client.send('AssociateTagOptionWithResource', {
      'ResourceId': resourceId,
      'TagOptionId': tagOptionId,
    });
    return AssociateTagOptionWithResourceOutput.fromJson(response_);
  }

  /// Associates multiple self-service actions with provisioning artifacts.
  ///
  /// [serviceActionAssociations]: One or more associations, each consisting of
  /// the Action ID, the Product ID, and the Provisioning Artifact ID.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  Future<BatchAssociateServiceActionWithProvisioningArtifactOutput>
      batchAssociateServiceActionWithProvisioningArtifact(
          List<ServiceActionAssociation> serviceActionAssociations,
          {String acceptLanguage}) async {
    var response_ = await _client
        .send('BatchAssociateServiceActionWithProvisioningArtifact', {
      'ServiceActionAssociations': serviceActionAssociations,
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
    });
    return BatchAssociateServiceActionWithProvisioningArtifactOutput.fromJson(
        response_);
  }

  /// Disassociates a batch of self-service actions from the specified
  /// provisioning artifact.
  ///
  /// [serviceActionAssociations]: One or more associations, each consisting of
  /// the Action ID, the Product ID, and the Provisioning Artifact ID.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  Future<BatchDisassociateServiceActionFromProvisioningArtifactOutput>
      batchDisassociateServiceActionFromProvisioningArtifact(
          List<ServiceActionAssociation> serviceActionAssociations,
          {String acceptLanguage}) async {
    var response_ = await _client
        .send('BatchDisassociateServiceActionFromProvisioningArtifact', {
      'ServiceActionAssociations': serviceActionAssociations,
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
    });
    return BatchDisassociateServiceActionFromProvisioningArtifactOutput
        .fromJson(response_);
  }

  /// Copies the specified source product to the specified target product or a
  /// new product.
  ///
  /// You can copy a product to the same account or another account. You can
  /// copy a product to the same region or another region.
  ///
  /// This operation is performed asynchronously. To track the progress of the
  /// operation, use DescribeCopyProductStatus.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [sourceProductArn]: The Amazon Resource Name (ARN) of the source product.
  ///
  /// [targetProductId]: The identifier of the target product. By default, a new
  /// product is created.
  ///
  /// [targetProductName]: A name for the target product. The default is the
  /// name of the source product.
  ///
  /// [sourceProvisioningArtifactIdentifiers]: The identifiers of the
  /// provisioning artifacts (also known as versions) of the product to copy. By
  /// default, all provisioning artifacts are copied.
  ///
  /// [copyOptions]: The copy options. If the value is `CopyTags`, the tags from
  /// the source product are copied to the target product.
  ///
  /// [idempotencyToken]:  A unique identifier that you provide to ensure
  /// idempotency. If multiple requests differ only by the idempotency token,
  /// the same response is returned for each repeated request.
  Future<CopyProductOutput> copyProduct(
      {String acceptLanguage,
      @required String sourceProductArn,
      String targetProductId,
      String targetProductName,
      List<Map<String, String>> sourceProvisioningArtifactIdentifiers,
      List<String> copyOptions,
      @required String idempotencyToken}) async {
    var response_ = await _client.send('CopyProduct', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'SourceProductArn': sourceProductArn,
      if (targetProductId != null) 'TargetProductId': targetProductId,
      if (targetProductName != null) 'TargetProductName': targetProductName,
      if (sourceProvisioningArtifactIdentifiers != null)
        'SourceProvisioningArtifactIdentifiers':
            sourceProvisioningArtifactIdentifiers,
      if (copyOptions != null) 'CopyOptions': copyOptions,
      'IdempotencyToken': idempotencyToken,
    });
    return CopyProductOutput.fromJson(response_);
  }

  /// Creates a constraint.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [productId]: The product identifier.
  ///
  /// [parameters]: The constraint parameters, in JSON format. The syntax
  /// depends on the constraint type as follows:
  ///
  /// LAUNCH
  ///
  /// Specify the `RoleArn` property as follows:
  ///
  ///  `{"RoleArn" : "arn:aws:iam::123456789012:role/LaunchRole"}`
  ///
  /// You cannot have both a `LAUNCH` and a `STACKSET` constraint.
  ///
  /// You also cannot have more than one `LAUNCH` constraint on a product and
  /// portfolio.
  ///
  /// NOTIFICATION
  ///
  /// Specify the `NotificationArns` property as follows:
  ///
  ///  `{"NotificationArns" : ["arn:aws:sns:us-east-1:123456789012:Topic"]}`
  ///
  /// RESOURCE_UPDATE
  ///
  /// Specify the `TagUpdatesOnProvisionedProduct` property as follows:
  ///
  ///
  /// `{"Version":"2.0","Properties":{"TagUpdateOnProvisionedProduct":"String"}}`
  ///
  /// The `TagUpdatesOnProvisionedProduct` property accepts a string value of
  /// `ALLOWED` or `NOT_ALLOWED`.
  ///
  /// STACKSET
  ///
  /// Specify the `Parameters` property as follows:
  ///
  ///  `{"Version": "String", "Properties": {"AccountList": [ "String" ],
  /// "RegionList": [ "String" ], "AdminRole": "String", "ExecutionRole":
  /// "String"}}`
  ///
  /// You cannot have both a `LAUNCH` and a `STACKSET` constraint.
  ///
  /// You also cannot have more than one `STACKSET` constraint on a product and
  /// portfolio.
  ///
  /// Products with a `STACKSET` constraint will launch an AWS CloudFormation
  /// stack set.
  ///
  /// TEMPLATE
  ///
  /// Specify the `Rules` property. For more information, see
  /// [Template Constraint Rules](http://docs.aws.amazon.com/servicecatalog/latest/adminguide/reference-template_constraint_rules.html).
  ///
  /// [type]: The type of constraint.
  ///
  /// *    `LAUNCH`
  ///
  /// *    `NOTIFICATION`
  ///
  /// *    `RESOURCE_UPDATE`
  ///
  /// *    `STACKSET`
  ///
  /// *    `TEMPLATE`
  ///
  /// [description]: The description of the constraint.
  ///
  /// [idempotencyToken]: A unique identifier that you provide to ensure
  /// idempotency. If multiple requests differ only by the idempotency token,
  /// the same response is returned for each repeated request.
  Future<CreateConstraintOutput> createConstraint(
      {String acceptLanguage,
      @required String portfolioId,
      @required String productId,
      @required String parameters,
      @required String type,
      String description,
      @required String idempotencyToken}) async {
    var response_ = await _client.send('CreateConstraint', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PortfolioId': portfolioId,
      'ProductId': productId,
      'Parameters': parameters,
      'Type': type,
      if (description != null) 'Description': description,
      'IdempotencyToken': idempotencyToken,
    });
    return CreateConstraintOutput.fromJson(response_);
  }

  /// Creates a portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [displayName]: The name to use for display purposes.
  ///
  /// [description]: The description of the portfolio.
  ///
  /// [providerName]: The name of the portfolio provider.
  ///
  /// [tags]: One or more tags.
  ///
  /// [idempotencyToken]: A unique identifier that you provide to ensure
  /// idempotency. If multiple requests differ only by the idempotency token,
  /// the same response is returned for each repeated request.
  Future<CreatePortfolioOutput> createPortfolio(
      {String acceptLanguage,
      @required String displayName,
      String description,
      @required String providerName,
      List<Tag> tags,
      @required String idempotencyToken}) async {
    var response_ = await _client.send('CreatePortfolio', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'DisplayName': displayName,
      if (description != null) 'Description': description,
      'ProviderName': providerName,
      if (tags != null) 'Tags': tags,
      'IdempotencyToken': idempotencyToken,
    });
    return CreatePortfolioOutput.fromJson(response_);
  }

  /// Shares the specified portfolio with the specified account or organization
  /// node. Shares to an organization node can only be created by the master
  /// account of an Organization. AWSOrganizationsAccess must be enabled in
  /// order to create a portfolio share to an organization node.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [accountId]: The AWS account ID. For example, `123456789012`.
  ///
  /// [organizationNode]: The organization node to whom you are going to share.
  /// If `OrganizationNode` is passed in, `PortfolioShare` will be created for
  /// the node and its children (when applies), and a `PortfolioShareToken` will
  /// be returned in the output in order for the administrator to monitor the
  /// status of the `PortfolioShare` creation process.
  Future<CreatePortfolioShareOutput> createPortfolioShare(String portfolioId,
      {String acceptLanguage,
      String accountId,
      OrganizationNode organizationNode}) async {
    var response_ = await _client.send('CreatePortfolioShare', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PortfolioId': portfolioId,
      if (accountId != null) 'AccountId': accountId,
      if (organizationNode != null) 'OrganizationNode': organizationNode,
    });
    return CreatePortfolioShareOutput.fromJson(response_);
  }

  /// Creates a product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [name]: The name of the product.
  ///
  /// [owner]: The owner of the product.
  ///
  /// [description]: The description of the product.
  ///
  /// [distributor]: The distributor of the product.
  ///
  /// [supportDescription]: The support information about the product.
  ///
  /// [supportEmail]: The contact email for product support.
  ///
  /// [supportUrl]: The contact URL for product support.
  ///
  /// [productType]: The type of product.
  ///
  /// [tags]: One or more tags.
  ///
  /// [provisioningArtifactParameters]: The configuration of the provisioning
  /// artifact.
  ///
  /// [idempotencyToken]: A unique identifier that you provide to ensure
  /// idempotency. If multiple requests differ only by the idempotency token,
  /// the same response is returned for each repeated request.
  Future<CreateProductOutput> createProduct(
      {String acceptLanguage,
      @required String name,
      @required String owner,
      String description,
      String distributor,
      String supportDescription,
      String supportEmail,
      String supportUrl,
      @required String productType,
      List<Tag> tags,
      @required ProvisioningArtifactProperties provisioningArtifactParameters,
      @required String idempotencyToken}) async {
    var response_ = await _client.send('CreateProduct', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Name': name,
      'Owner': owner,
      if (description != null) 'Description': description,
      if (distributor != null) 'Distributor': distributor,
      if (supportDescription != null) 'SupportDescription': supportDescription,
      if (supportEmail != null) 'SupportEmail': supportEmail,
      if (supportUrl != null) 'SupportUrl': supportUrl,
      'ProductType': productType,
      if (tags != null) 'Tags': tags,
      'ProvisioningArtifactParameters': provisioningArtifactParameters,
      'IdempotencyToken': idempotencyToken,
    });
    return CreateProductOutput.fromJson(response_);
  }

  /// Creates a plan. A plan includes the list of resources to be created (when
  /// provisioning a new product) or modified (when updating a provisioned
  /// product) when the plan is executed.
  ///
  /// You can create one plan per provisioned product. To create a plan for an
  /// existing provisioned product, the product status must be AVAILBLE or
  /// TAINTED.
  ///
  /// To view the resource changes in the change set, use
  /// DescribeProvisionedProductPlan. To create or modify the provisioned
  /// product, use ExecuteProvisionedProductPlan.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [planName]: The name of the plan.
  ///
  /// [planType]: The plan type.
  ///
  /// [notificationArns]: Passed to CloudFormation. The SNS topic ARNs to which
  /// to publish stack-related events.
  ///
  /// [pathId]: The path identifier of the product. This value is optional if
  /// the product has a default path, and required if the product has more than
  /// one path. To list the paths for a product, use ListLaunchPaths.
  ///
  /// [productId]: The product identifier.
  ///
  /// [provisionedProductName]: A user-friendly name for the provisioned
  /// product. This value must be unique for the AWS account and cannot be
  /// updated after the product is provisioned.
  ///
  /// [provisioningArtifactId]: The identifier of the provisioning artifact.
  ///
  /// [provisioningParameters]: Parameters specified by the administrator that
  /// are required for provisioning the product.
  ///
  /// [idempotencyToken]: A unique identifier that you provide to ensure
  /// idempotency. If multiple requests differ only by the idempotency token,
  /// the same response is returned for each repeated request.
  ///
  /// [tags]: One or more tags.
  ///
  /// If the plan is for an existing provisioned product, the product must have
  /// a `RESOURCE_UPDATE` constraint with `TagUpdatesOnProvisionedProduct` set
  /// to `ALLOWED` to allow tag updates.
  Future<CreateProvisionedProductPlanOutput> createProvisionedProductPlan(
      {String acceptLanguage,
      @required String planName,
      @required String planType,
      List<String> notificationArns,
      String pathId,
      @required String productId,
      @required String provisionedProductName,
      @required String provisioningArtifactId,
      List<UpdateProvisioningParameter> provisioningParameters,
      @required String idempotencyToken,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateProvisionedProductPlan', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PlanName': planName,
      'PlanType': planType,
      if (notificationArns != null) 'NotificationArns': notificationArns,
      if (pathId != null) 'PathId': pathId,
      'ProductId': productId,
      'ProvisionedProductName': provisionedProductName,
      'ProvisioningArtifactId': provisioningArtifactId,
      if (provisioningParameters != null)
        'ProvisioningParameters': provisioningParameters,
      'IdempotencyToken': idempotencyToken,
      if (tags != null) 'Tags': tags,
    });
    return CreateProvisionedProductPlanOutput.fromJson(response_);
  }

  /// Creates a provisioning artifact (also known as a version) for the
  /// specified product.
  ///
  /// You cannot create a provisioning artifact for a product that was shared
  /// with you.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [productId]: The product identifier.
  ///
  /// [parameters]: The configuration for the provisioning artifact.
  ///
  /// [idempotencyToken]: A unique identifier that you provide to ensure
  /// idempotency. If multiple requests differ only by the idempotency token,
  /// the same response is returned for each repeated request.
  Future<CreateProvisioningArtifactOutput> createProvisioningArtifact(
      {String acceptLanguage,
      @required String productId,
      @required ProvisioningArtifactProperties parameters,
      @required String idempotencyToken}) async {
    var response_ = await _client.send('CreateProvisioningArtifact', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ProductId': productId,
      'Parameters': parameters,
      'IdempotencyToken': idempotencyToken,
    });
    return CreateProvisioningArtifactOutput.fromJson(response_);
  }

  /// Creates a self-service action.
  ///
  /// [name]: The self-service action name.
  ///
  /// [definitionType]: The service action definition type. For example,
  /// `SSM_AUTOMATION`.
  ///
  /// [definition]: The self-service action definition. Can be one of the
  /// following:
  ///
  /// Name
  ///
  /// The name of the AWS Systems Manager Document. For example,
  /// `AWS-RestartEC2Instance`.
  ///
  /// Version
  ///
  /// The AWS Systems Manager automation document version. For example,
  /// `"Version": "1"`
  ///
  /// AssumeRole
  ///
  /// The Amazon Resource Name (ARN) of the role that performs the self-service
  /// actions on your behalf. For example, `"AssumeRole":
  /// "arn:aws:iam::12345678910:role/ActionRole"`.
  ///
  /// To reuse the provisioned product launch role, set to `"AssumeRole":
  /// "LAUNCH_ROLE"`.
  ///
  /// Parameters
  ///
  /// The list of parameters in JSON format.
  ///
  /// For example: `[{"Name":"InstanceId","Type":"TARGET"}]`.
  ///
  /// [description]: The self-service action description.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [idempotencyToken]: A unique identifier that you provide to ensure
  /// idempotency. If multiple requests differ only by the idempotency token,
  /// the same response is returned for each repeated request.
  Future<CreateServiceActionOutput> createServiceAction(
      {@required String name,
      @required String definitionType,
      @required Map<String, String> definition,
      String description,
      String acceptLanguage,
      @required String idempotencyToken}) async {
    var response_ = await _client.send('CreateServiceAction', {
      'Name': name,
      'DefinitionType': definitionType,
      'Definition': definition,
      if (description != null) 'Description': description,
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'IdempotencyToken': idempotencyToken,
    });
    return CreateServiceActionOutput.fromJson(response_);
  }

  /// Creates a TagOption.
  ///
  /// [key]: The TagOption key.
  ///
  /// [value]: The TagOption value.
  Future<CreateTagOptionOutput> createTagOption(
      {@required String key, @required String value}) async {
    var response_ = await _client.send('CreateTagOption', {
      'Key': key,
      'Value': value,
    });
    return CreateTagOptionOutput.fromJson(response_);
  }

  /// Deletes the specified constraint.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [id]: The identifier of the constraint.
  Future<DeleteConstraintOutput> deleteConstraint(String id,
      {String acceptLanguage}) async {
    var response_ = await _client.send('DeleteConstraint', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Id': id,
    });
    return DeleteConstraintOutput.fromJson(response_);
  }

  /// Deletes the specified portfolio.
  ///
  /// You cannot delete a portfolio if it was shared with you or if it has
  /// associated products, users, constraints, or shared accounts.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [id]: The portfolio identifier.
  Future<DeletePortfolioOutput> deletePortfolio(String id,
      {String acceptLanguage}) async {
    var response_ = await _client.send('DeletePortfolio', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Id': id,
    });
    return DeletePortfolioOutput.fromJson(response_);
  }

  /// Stops sharing the specified portfolio with the specified account or
  /// organization node. Shares to an organization node can only be deleted by
  /// the master account of an Organization.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [accountId]: The AWS account ID.
  ///
  /// [organizationNode]: The organization node to whom you are going to stop
  /// sharing.
  Future<DeletePortfolioShareOutput> deletePortfolioShare(String portfolioId,
      {String acceptLanguage,
      String accountId,
      OrganizationNode organizationNode}) async {
    var response_ = await _client.send('DeletePortfolioShare', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PortfolioId': portfolioId,
      if (accountId != null) 'AccountId': accountId,
      if (organizationNode != null) 'OrganizationNode': organizationNode,
    });
    return DeletePortfolioShareOutput.fromJson(response_);
  }

  /// Deletes the specified product.
  ///
  /// You cannot delete a product if it was shared with you or is associated
  /// with a portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [id]: The product identifier.
  Future<DeleteProductOutput> deleteProduct(String id,
      {String acceptLanguage}) async {
    var response_ = await _client.send('DeleteProduct', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Id': id,
    });
    return DeleteProductOutput.fromJson(response_);
  }

  /// Deletes the specified plan.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [planId]: The plan identifier.
  ///
  /// [ignoreErrors]: If set to true, AWS Service Catalog stops managing the
  /// specified provisioned product even if it cannot delete the underlying
  /// resources.
  Future<DeleteProvisionedProductPlanOutput> deleteProvisionedProductPlan(
      String planId,
      {String acceptLanguage,
      bool ignoreErrors}) async {
    var response_ = await _client.send('DeleteProvisionedProductPlan', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PlanId': planId,
      if (ignoreErrors != null) 'IgnoreErrors': ignoreErrors,
    });
    return DeleteProvisionedProductPlanOutput.fromJson(response_);
  }

  /// Deletes the specified provisioning artifact (also known as a version) for
  /// the specified product.
  ///
  /// You cannot delete a provisioning artifact associated with a product that
  /// was shared with you. You cannot delete the last provisioning artifact for
  /// a product, because a product must have at least one provisioning artifact.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [productId]: The product identifier.
  ///
  /// [provisioningArtifactId]: The identifier of the provisioning artifact.
  Future<DeleteProvisioningArtifactOutput> deleteProvisioningArtifact(
      {String acceptLanguage,
      @required String productId,
      @required String provisioningArtifactId}) async {
    var response_ = await _client.send('DeleteProvisioningArtifact', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ProductId': productId,
      'ProvisioningArtifactId': provisioningArtifactId,
    });
    return DeleteProvisioningArtifactOutput.fromJson(response_);
  }

  /// Deletes a self-service action.
  ///
  /// [id]: The self-service action identifier. For example,
  /// `act-fs7abcd89wxyz`.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  Future<DeleteServiceActionOutput> deleteServiceAction(String id,
      {String acceptLanguage}) async {
    var response_ = await _client.send('DeleteServiceAction', {
      'Id': id,
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
    });
    return DeleteServiceActionOutput.fromJson(response_);
  }

  /// Deletes the specified TagOption.
  ///
  /// You cannot delete a TagOption if it is associated with a product or
  /// portfolio.
  ///
  /// [id]: The TagOption identifier.
  Future<DeleteTagOptionOutput> deleteTagOption(String id) async {
    var response_ = await _client.send('DeleteTagOption', {
      'Id': id,
    });
    return DeleteTagOptionOutput.fromJson(response_);
  }

  /// Gets information about the specified constraint.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [id]: The identifier of the constraint.
  Future<DescribeConstraintOutput> describeConstraint(String id,
      {String acceptLanguage}) async {
    var response_ = await _client.send('DescribeConstraint', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Id': id,
    });
    return DescribeConstraintOutput.fromJson(response_);
  }

  /// Gets the status of the specified copy product operation.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [copyProductToken]: The token for the copy product operation. This token
  /// is returned by CopyProduct.
  Future<DescribeCopyProductStatusOutput> describeCopyProductStatus(
      String copyProductToken,
      {String acceptLanguage}) async {
    var response_ = await _client.send('DescribeCopyProductStatus', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'CopyProductToken': copyProductToken,
    });
    return DescribeCopyProductStatusOutput.fromJson(response_);
  }

  /// Gets information about the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [id]: The portfolio identifier.
  Future<DescribePortfolioOutput> describePortfolio(String id,
      {String acceptLanguage}) async {
    var response_ = await _client.send('DescribePortfolio', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Id': id,
    });
    return DescribePortfolioOutput.fromJson(response_);
  }

  /// Gets the status of the specified portfolio share operation. This API can
  /// only be called by the master account in the organization.
  ///
  /// [portfolioShareToken]: The token for the portfolio share operation. This
  /// token is returned either by CreatePortfolioShare or by
  /// DeletePortfolioShare.
  Future<DescribePortfolioShareStatusOutput> describePortfolioShareStatus(
      String portfolioShareToken) async {
    var response_ = await _client.send('DescribePortfolioShareStatus', {
      'PortfolioShareToken': portfolioShareToken,
    });
    return DescribePortfolioShareStatusOutput.fromJson(response_);
  }

  /// Gets information about the specified product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [id]: The product identifier.
  Future<DescribeProductOutput> describeProduct(String id,
      {String acceptLanguage}) async {
    var response_ = await _client.send('DescribeProduct', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Id': id,
    });
    return DescribeProductOutput.fromJson(response_);
  }

  /// Gets information about the specified product. This operation is run with
  /// administrator access.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [id]: The product identifier.
  Future<DescribeProductAsAdminOutput> describeProductAsAdmin(String id,
      {String acceptLanguage}) async {
    var response_ = await _client.send('DescribeProductAsAdmin', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Id': id,
    });
    return DescribeProductAsAdminOutput.fromJson(response_);
  }

  /// Gets information about the specified product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [id]: The product view identifier.
  Future<DescribeProductViewOutput> describeProductView(String id,
      {String acceptLanguage}) async {
    var response_ = await _client.send('DescribeProductView', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Id': id,
    });
    return DescribeProductViewOutput.fromJson(response_);
  }

  /// Gets information about the specified provisioned product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [id]: The provisioned product identifier.
  Future<DescribeProvisionedProductOutput> describeProvisionedProduct(String id,
      {String acceptLanguage}) async {
    var response_ = await _client.send('DescribeProvisionedProduct', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Id': id,
    });
    return DescribeProvisionedProductOutput.fromJson(response_);
  }

  /// Gets information about the resource changes for the specified plan.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [planId]: The plan identifier.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<DescribeProvisionedProductPlanOutput> describeProvisionedProductPlan(
      String planId,
      {String acceptLanguage,
      int pageSize,
      String pageToken}) async {
    var response_ = await _client.send('DescribeProvisionedProductPlan', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PlanId': planId,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
    });
    return DescribeProvisionedProductPlanOutput.fromJson(response_);
  }

  /// Gets information about the specified provisioning artifact (also known as
  /// a version) for the specified product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [provisioningArtifactId]: The identifier of the provisioning artifact.
  ///
  /// [productId]: The product identifier.
  ///
  /// [verbose]: Indicates whether a verbose level of detail is enabled.
  Future<DescribeProvisioningArtifactOutput> describeProvisioningArtifact(
      {String acceptLanguage,
      @required String provisioningArtifactId,
      @required String productId,
      bool verbose}) async {
    var response_ = await _client.send('DescribeProvisioningArtifact', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ProvisioningArtifactId': provisioningArtifactId,
      'ProductId': productId,
      if (verbose != null) 'Verbose': verbose,
    });
    return DescribeProvisioningArtifactOutput.fromJson(response_);
  }

  /// Gets information about the configuration required to provision the
  /// specified product using the specified provisioning artifact.
  ///
  /// If the output contains a TagOption key with an empty list of values, there
  /// is a TagOption conflict for that key. The end user cannot take action to
  /// fix the conflict, and launch is not blocked. In subsequent calls to
  /// ProvisionProduct, do not include conflicted TagOption keys as tags, or
  /// this causes the error "Parameter validation failed: Missing required
  /// parameter in Tags[_N_]:_Value_". Tag the provisioned product with the
  /// value `sc-tagoption-conflict-portfolioId-productId`.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [productId]: The product identifier.
  ///
  /// [provisioningArtifactId]: The identifier of the provisioning artifact.
  ///
  /// [pathId]: The path identifier of the product. This value is optional if
  /// the product has a default path, and required if the product has more than
  /// one path. To list the paths for a product, use ListLaunchPaths.
  Future<DescribeProvisioningParametersOutput> describeProvisioningParameters(
      {String acceptLanguage,
      @required String productId,
      @required String provisioningArtifactId,
      String pathId}) async {
    var response_ = await _client.send('DescribeProvisioningParameters', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ProductId': productId,
      'ProvisioningArtifactId': provisioningArtifactId,
      if (pathId != null) 'PathId': pathId,
    });
    return DescribeProvisioningParametersOutput.fromJson(response_);
  }

  /// Gets information about the specified request operation.
  ///
  /// Use this operation after calling a request operation (for example,
  /// ProvisionProduct, TerminateProvisionedProduct, or
  /// UpdateProvisionedProduct).
  ///
  ///
  ///
  /// If a provisioned product was transferred to a new owner using
  /// UpdateProvisionedProductProperties, the new owner will be able to describe
  /// all past records for that product. The previous owner will no longer be
  /// able to describe the records, but will be able to use ListRecordHistory to
  /// see the product's history from when he was the owner.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [id]: The record identifier of the provisioned product. This identifier is
  /// returned by the request operation.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  Future<DescribeRecordOutput> describeRecord(String id,
      {String acceptLanguage, String pageToken, int pageSize}) async {
    var response_ = await _client.send('DescribeRecord', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Id': id,
      if (pageToken != null) 'PageToken': pageToken,
      if (pageSize != null) 'PageSize': pageSize,
    });
    return DescribeRecordOutput.fromJson(response_);
  }

  /// Describes a self-service action.
  ///
  /// [id]: The self-service action identifier.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  Future<DescribeServiceActionOutput> describeServiceAction(String id,
      {String acceptLanguage}) async {
    var response_ = await _client.send('DescribeServiceAction', {
      'Id': id,
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
    });
    return DescribeServiceActionOutput.fromJson(response_);
  }

  Future<DescribeServiceActionExecutionParametersOutput>
      describeServiceActionExecutionParameters(
          {@required String provisionedProductId,
          @required String serviceActionId,
          String acceptLanguage}) async {
    var response_ =
        await _client.send('DescribeServiceActionExecutionParameters', {
      'ProvisionedProductId': provisionedProductId,
      'ServiceActionId': serviceActionId,
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
    });
    return DescribeServiceActionExecutionParametersOutput.fromJson(response_);
  }

  /// Gets information about the specified TagOption.
  ///
  /// [id]: The TagOption identifier.
  Future<DescribeTagOptionOutput> describeTagOption(String id) async {
    var response_ = await _client.send('DescribeTagOption', {
      'Id': id,
    });
    return DescribeTagOptionOutput.fromJson(response_);
  }

  /// Disable portfolio sharing through AWS Organizations feature. This feature
  /// will not delete your current shares but it will prevent you from creating
  /// new shares throughout your organization. Current shares will not be in
  /// sync with your organization structure if it changes after calling this
  /// API. This API can only be called by the master account in the
  /// organization.
  Future<DisableAwsOrganizationsAccessOutput>
      disableAwsOrganizationsAccess() async {
    var response_ = await _client.send('DisableAWSOrganizationsAccess', {});
    return DisableAwsOrganizationsAccessOutput.fromJson(response_);
  }

  /// Disassociates the specified budget from the specified resource.
  ///
  /// [budgetName]: The name of the budget you want to disassociate.
  ///
  /// [resourceId]: The resource identifier you want to disassociate from.
  /// Either a portfolio-id or a product-id.
  Future<DisassociateBudgetFromResourceOutput> disassociateBudgetFromResource(
      {@required String budgetName, @required String resourceId}) async {
    var response_ = await _client.send('DisassociateBudgetFromResource', {
      'BudgetName': budgetName,
      'ResourceId': resourceId,
    });
    return DisassociateBudgetFromResourceOutput.fromJson(response_);
  }

  /// Disassociates a previously associated principal ARN from a specified
  /// portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [principalArn]: The ARN of the principal (IAM user, role, or group).
  Future<DisassociatePrincipalFromPortfolioOutput>
      disassociatePrincipalFromPortfolio(
          {String acceptLanguage,
          @required String portfolioId,
          @required String principalArn}) async {
    var response_ = await _client.send('DisassociatePrincipalFromPortfolio', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PortfolioId': portfolioId,
      'PrincipalARN': principalArn,
    });
    return DisassociatePrincipalFromPortfolioOutput.fromJson(response_);
  }

  /// Disassociates the specified product from the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [productId]: The product identifier.
  ///
  /// [portfolioId]: The portfolio identifier.
  Future<DisassociateProductFromPortfolioOutput>
      disassociateProductFromPortfolio(
          {String acceptLanguage,
          @required String productId,
          @required String portfolioId}) async {
    var response_ = await _client.send('DisassociateProductFromPortfolio', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ProductId': productId,
      'PortfolioId': portfolioId,
    });
    return DisassociateProductFromPortfolioOutput.fromJson(response_);
  }

  /// Disassociates the specified self-service action association from the
  /// specified provisioning artifact.
  ///
  /// [productId]: The product identifier. For example, `prod-abcdzk7xy33qa`.
  ///
  /// [provisioningArtifactId]: The identifier of the provisioning artifact. For
  /// example, `pa-4abcdjnxjj6ne`.
  ///
  /// [serviceActionId]: The self-service action identifier. For example,
  /// `act-fs7abcd89wxyz`.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  Future<DisassociateServiceActionFromProvisioningArtifactOutput>
      disassociateServiceActionFromProvisioningArtifact(
          {@required String productId,
          @required String provisioningArtifactId,
          @required String serviceActionId,
          String acceptLanguage}) async {
    var response_ = await _client
        .send('DisassociateServiceActionFromProvisioningArtifact', {
      'ProductId': productId,
      'ProvisioningArtifactId': provisioningArtifactId,
      'ServiceActionId': serviceActionId,
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
    });
    return DisassociateServiceActionFromProvisioningArtifactOutput.fromJson(
        response_);
  }

  /// Disassociates the specified TagOption from the specified resource.
  ///
  /// [resourceId]: The resource identifier.
  ///
  /// [tagOptionId]: The TagOption identifier.
  Future<DisassociateTagOptionFromResourceOutput>
      disassociateTagOptionFromResource(
          {@required String resourceId, @required String tagOptionId}) async {
    var response_ = await _client.send('DisassociateTagOptionFromResource', {
      'ResourceId': resourceId,
      'TagOptionId': tagOptionId,
    });
    return DisassociateTagOptionFromResourceOutput.fromJson(response_);
  }

  /// Enable portfolio sharing feature through AWS Organizations. This API will
  /// allow Service Catalog to receive updates on your organization in order to
  /// sync your shares with the current structure. This API can only be called
  /// by the master account in the organization.
  ///
  /// By calling this API Service Catalog will make a call to
  /// organizations:EnableAWSServiceAccess on your behalf so that your shares
  /// can be in sync with any changes in your AWS Organizations structure.
  Future<EnableAwsOrganizationsAccessOutput>
      enableAwsOrganizationsAccess() async {
    var response_ = await _client.send('EnableAWSOrganizationsAccess', {});
    return EnableAwsOrganizationsAccessOutput.fromJson(response_);
  }

  /// Provisions or modifies a product based on the resource changes for the
  /// specified plan.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [planId]: The plan identifier.
  ///
  /// [idempotencyToken]: A unique identifier that you provide to ensure
  /// idempotency. If multiple requests differ only by the idempotency token,
  /// the same response is returned for each repeated request.
  Future<ExecuteProvisionedProductPlanOutput> executeProvisionedProductPlan(
      {String acceptLanguage,
      @required String planId,
      @required String idempotencyToken}) async {
    var response_ = await _client.send('ExecuteProvisionedProductPlan', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PlanId': planId,
      'IdempotencyToken': idempotencyToken,
    });
    return ExecuteProvisionedProductPlanOutput.fromJson(response_);
  }

  /// Executes a self-service action against a provisioned product.
  ///
  /// [provisionedProductId]: The identifier of the provisioned product.
  ///
  /// [serviceActionId]: The self-service action identifier. For example,
  /// `act-fs7abcd89wxyz`.
  ///
  /// [executeToken]: An idempotency token that uniquely identifies the execute
  /// request.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  Future<ExecuteProvisionedProductServiceActionOutput>
      executeProvisionedProductServiceAction(
          {@required String provisionedProductId,
          @required String serviceActionId,
          @required String executeToken,
          String acceptLanguage,
          Map<String, List<String>> parameters}) async {
    var response_ =
        await _client.send('ExecuteProvisionedProductServiceAction', {
      'ProvisionedProductId': provisionedProductId,
      'ServiceActionId': serviceActionId,
      'ExecuteToken': executeToken,
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      if (parameters != null) 'Parameters': parameters,
    });
    return ExecuteProvisionedProductServiceActionOutput.fromJson(response_);
  }

  /// Get the Access Status for AWS Organization portfolio share feature. This
  /// API can only be called by the master account in the organization.
  Future<GetAwsOrganizationsAccessStatusOutput>
      getAwsOrganizationsAccessStatus() async {
    var response_ = await _client.send('GetAWSOrganizationsAccessStatus', {});
    return GetAwsOrganizationsAccessStatusOutput.fromJson(response_);
  }

  /// Lists all portfolios for which sharing was accepted by this account.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [portfolioShareType]: The type of shared portfolios to list. The default
  /// is to list imported portfolios.
  ///
  /// *    `AWS_ORGANIZATIONS` - List portfolios shared by the master account of
  /// your organization
  ///
  /// *    `AWS_SERVICECATALOG` - List default portfolios
  ///
  /// *    `IMPORTED` - List imported portfolios
  Future<ListAcceptedPortfolioSharesOutput> listAcceptedPortfolioShares(
      {String acceptLanguage,
      String pageToken,
      int pageSize,
      String portfolioShareType}) async {
    var response_ = await _client.send('ListAcceptedPortfolioShares', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      if (pageToken != null) 'PageToken': pageToken,
      if (pageSize != null) 'PageSize': pageSize,
      if (portfolioShareType != null) 'PortfolioShareType': portfolioShareType,
    });
    return ListAcceptedPortfolioSharesOutput.fromJson(response_);
  }

  /// Lists all the budgets associated to the specified resource.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [resourceId]: The resource identifier.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<ListBudgetsForResourceOutput> listBudgetsForResource(String resourceId,
      {String acceptLanguage, int pageSize, String pageToken}) async {
    var response_ = await _client.send('ListBudgetsForResource', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ResourceId': resourceId,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
    });
    return ListBudgetsForResourceOutput.fromJson(response_);
  }

  /// Lists the constraints for the specified portfolio and product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [productId]: The product identifier.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<ListConstraintsForPortfolioOutput> listConstraintsForPortfolio(
      String portfolioId,
      {String acceptLanguage,
      String productId,
      int pageSize,
      String pageToken}) async {
    var response_ = await _client.send('ListConstraintsForPortfolio', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PortfolioId': portfolioId,
      if (productId != null) 'ProductId': productId,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
    });
    return ListConstraintsForPortfolioOutput.fromJson(response_);
  }

  /// Lists the paths to the specified product. A path is how the user has
  /// access to a specified product, and is necessary when provisioning a
  /// product. A path also determines the constraints put on the product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [productId]: The product identifier.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<ListLaunchPathsOutput> listLaunchPaths(String productId,
      {String acceptLanguage, int pageSize, String pageToken}) async {
    var response_ = await _client.send('ListLaunchPaths', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ProductId': productId,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
    });
    return ListLaunchPathsOutput.fromJson(response_);
  }

  /// Lists the organization nodes that have access to the specified portfolio.
  /// This API can only be called by the master account in the organization.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [portfolioId]: The portfolio identifier. For example,
  /// `port-2abcdext3y5fk`.
  ///
  /// [organizationNodeType]: The organization node type that will be returned
  /// in the output.
  ///
  /// *    `ORGANIZATION` - Organization that has access to the portfolio.
  ///
  /// *    `ORGANIZATIONAL_UNIT` - Organizational unit that has access to the
  /// portfolio within your organization.
  ///
  /// *    `ACCOUNT` - Account that has access to the portfolio within your
  /// organization.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  Future<ListOrganizationPortfolioAccessOutput> listOrganizationPortfolioAccess(
      {String acceptLanguage,
      @required String portfolioId,
      @required String organizationNodeType,
      String pageToken,
      int pageSize}) async {
    var response_ = await _client.send('ListOrganizationPortfolioAccess', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PortfolioId': portfolioId,
      'OrganizationNodeType': organizationNodeType,
      if (pageToken != null) 'PageToken': pageToken,
      if (pageSize != null) 'PageSize': pageSize,
    });
    return ListOrganizationPortfolioAccessOutput.fromJson(response_);
  }

  /// Lists the account IDs that have access to the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  Future<ListPortfolioAccessOutput> listPortfolioAccess(String portfolioId,
      {String acceptLanguage}) async {
    var response_ = await _client.send('ListPortfolioAccess', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PortfolioId': portfolioId,
    });
    return ListPortfolioAccessOutput.fromJson(response_);
  }

  /// Lists all portfolios in the catalog.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  Future<ListPortfoliosOutput> listPortfolios(
      {String acceptLanguage, String pageToken, int pageSize}) async {
    var response_ = await _client.send('ListPortfolios', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      if (pageToken != null) 'PageToken': pageToken,
      if (pageSize != null) 'PageSize': pageSize,
    });
    return ListPortfoliosOutput.fromJson(response_);
  }

  /// Lists all portfolios that the specified product is associated with.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [productId]: The product identifier.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  Future<ListPortfoliosForProductOutput> listPortfoliosForProduct(
      String productId,
      {String acceptLanguage,
      String pageToken,
      int pageSize}) async {
    var response_ = await _client.send('ListPortfoliosForProduct', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ProductId': productId,
      if (pageToken != null) 'PageToken': pageToken,
      if (pageSize != null) 'PageSize': pageSize,
    });
    return ListPortfoliosForProductOutput.fromJson(response_);
  }

  /// Lists all principal ARNs associated with the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<ListPrincipalsForPortfolioOutput> listPrincipalsForPortfolio(
      String portfolioId,
      {String acceptLanguage,
      int pageSize,
      String pageToken}) async {
    var response_ = await _client.send('ListPrincipalsForPortfolio', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PortfolioId': portfolioId,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
    });
    return ListPrincipalsForPortfolioOutput.fromJson(response_);
  }

  /// Lists the plans for the specified provisioned product or all plans to
  /// which the user has access.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [provisionProductId]: The product identifier.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  ///
  /// [accessLevelFilter]: The access level to use to obtain results. The
  /// default is `User`.
  Future<ListProvisionedProductPlansOutput> listProvisionedProductPlans(
      {String acceptLanguage,
      String provisionProductId,
      int pageSize,
      String pageToken,
      AccessLevelFilter accessLevelFilter}) async {
    var response_ = await _client.send('ListProvisionedProductPlans', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      if (provisionProductId != null) 'ProvisionProductId': provisionProductId,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
      if (accessLevelFilter != null) 'AccessLevelFilter': accessLevelFilter,
    });
    return ListProvisionedProductPlansOutput.fromJson(response_);
  }

  /// Lists all provisioning artifacts (also known as versions) for the
  /// specified product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [productId]: The product identifier.
  Future<ListProvisioningArtifactsOutput> listProvisioningArtifacts(
      String productId,
      {String acceptLanguage}) async {
    var response_ = await _client.send('ListProvisioningArtifacts', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ProductId': productId,
    });
    return ListProvisioningArtifactsOutput.fromJson(response_);
  }

  /// Lists all provisioning artifacts (also known as versions) for the
  /// specified self-service action.
  ///
  /// [serviceActionId]: The self-service action identifier. For example,
  /// `act-fs7abcd89wxyz`.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  Future<ListProvisioningArtifactsForServiceActionOutput>
      listProvisioningArtifactsForServiceAction(String serviceActionId,
          {int pageSize, String pageToken, String acceptLanguage}) async {
    var response_ =
        await _client.send('ListProvisioningArtifactsForServiceAction', {
      'ServiceActionId': serviceActionId,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
    });
    return ListProvisioningArtifactsForServiceActionOutput.fromJson(response_);
  }

  /// Lists the specified requests or all performed requests.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [accessLevelFilter]: The access level to use to obtain results. The
  /// default is `User`.
  ///
  /// [searchFilter]: The search filter to scope the results.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<ListRecordHistoryOutput> listRecordHistory(
      {String acceptLanguage,
      AccessLevelFilter accessLevelFilter,
      ListRecordHistorySearchFilter searchFilter,
      int pageSize,
      String pageToken}) async {
    var response_ = await _client.send('ListRecordHistory', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      if (accessLevelFilter != null) 'AccessLevelFilter': accessLevelFilter,
      if (searchFilter != null) 'SearchFilter': searchFilter,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
    });
    return ListRecordHistoryOutput.fromJson(response_);
  }

  /// Lists the resources associated with the specified TagOption.
  ///
  /// [tagOptionId]: The TagOption identifier.
  ///
  /// [resourceType]: The resource type.
  ///
  /// *    `Portfolio`
  ///
  /// *    `Product`
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<ListResourcesForTagOptionOutput> listResourcesForTagOption(
      String tagOptionId,
      {String resourceType,
      int pageSize,
      String pageToken}) async {
    var response_ = await _client.send('ListResourcesForTagOption', {
      'TagOptionId': tagOptionId,
      if (resourceType != null) 'ResourceType': resourceType,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
    });
    return ListResourcesForTagOptionOutput.fromJson(response_);
  }

  /// Lists all self-service actions.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<ListServiceActionsOutput> listServiceActions(
      {String acceptLanguage, int pageSize, String pageToken}) async {
    var response_ = await _client.send('ListServiceActions', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
    });
    return ListServiceActionsOutput.fromJson(response_);
  }

  /// Returns a paginated list of self-service actions associated with the
  /// specified Product ID and Provisioning Artifact ID.
  ///
  /// [productId]: The product identifier. For example, `prod-abcdzk7xy33qa`.
  ///
  /// [provisioningArtifactId]: The identifier of the provisioning artifact. For
  /// example, `pa-4abcdjnxjj6ne`.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  Future<ListServiceActionsForProvisioningArtifactOutput>
      listServiceActionsForProvisioningArtifact(
          {@required String productId,
          @required String provisioningArtifactId,
          int pageSize,
          String pageToken,
          String acceptLanguage}) async {
    var response_ =
        await _client.send('ListServiceActionsForProvisioningArtifact', {
      'ProductId': productId,
      'ProvisioningArtifactId': provisioningArtifactId,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
    });
    return ListServiceActionsForProvisioningArtifactOutput.fromJson(response_);
  }

  /// Returns summary information about stack instances that are associated with
  /// the specified `CFN_STACKSET` type provisioned product. You can filter for
  /// stack instances that are associated with a specific AWS account name or
  /// region.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [provisionedProductId]: The identifier of the provisioned product.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  Future<ListStackInstancesForProvisionedProductOutput>
      listStackInstancesForProvisionedProduct(String provisionedProductId,
          {String acceptLanguage, String pageToken, int pageSize}) async {
    var response_ =
        await _client.send('ListStackInstancesForProvisionedProduct', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ProvisionedProductId': provisionedProductId,
      if (pageToken != null) 'PageToken': pageToken,
      if (pageSize != null) 'PageSize': pageSize,
    });
    return ListStackInstancesForProvisionedProductOutput.fromJson(response_);
  }

  /// Lists the specified TagOptions or all TagOptions.
  ///
  /// [filters]: The search filters. If no search filters are specified, the
  /// output includes all TagOptions.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<ListTagOptionsOutput> listTagOptions(
      {ListTagOptionsFilters filters, int pageSize, String pageToken}) async {
    var response_ = await _client.send('ListTagOptions', {
      if (filters != null) 'Filters': filters,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
    });
    return ListTagOptionsOutput.fromJson(response_);
  }

  /// Provisions the specified product.
  ///
  /// A provisioned product is a resourced instance of a product. For example,
  /// provisioning a product based on a CloudFormation template launches a
  /// CloudFormation stack and its underlying resources. You can check the
  /// status of this request using DescribeRecord.
  ///
  /// If the request contains a tag key with an empty list of values, there is a
  /// tag conflict for that key. Do not include conflicted keys as tags, or this
  /// causes the error "Parameter validation failed: Missing required parameter
  /// in Tags[_N_]:_Value_".
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [productId]: The product identifier.
  ///
  /// [provisioningArtifactId]: The identifier of the provisioning artifact.
  ///
  /// [pathId]: The path identifier of the product. This value is optional if
  /// the product has a default path, and required if the product has more than
  /// one path. To list the paths for a product, use ListLaunchPaths.
  ///
  /// [provisionedProductName]: A user-friendly name for the provisioned
  /// product. This value must be unique for the AWS account and cannot be
  /// updated after the product is provisioned.
  ///
  /// [provisioningParameters]: Parameters specified by the administrator that
  /// are required for provisioning the product.
  ///
  /// [provisioningPreferences]: An object that contains information about the
  /// provisioning preferences for a stack set.
  ///
  /// [tags]: One or more tags.
  ///
  /// [notificationArns]: Passed to CloudFormation. The SNS topic ARNs to which
  /// to publish stack-related events.
  ///
  /// [provisionToken]: An idempotency token that uniquely identifies the
  /// provisioning request.
  Future<ProvisionProductOutput> provisionProduct(
      {String acceptLanguage,
      @required String productId,
      @required String provisioningArtifactId,
      String pathId,
      @required String provisionedProductName,
      List<ProvisioningParameter> provisioningParameters,
      ProvisioningPreferences provisioningPreferences,
      List<Tag> tags,
      List<String> notificationArns,
      @required String provisionToken}) async {
    var response_ = await _client.send('ProvisionProduct', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ProductId': productId,
      'ProvisioningArtifactId': provisioningArtifactId,
      if (pathId != null) 'PathId': pathId,
      'ProvisionedProductName': provisionedProductName,
      if (provisioningParameters != null)
        'ProvisioningParameters': provisioningParameters,
      if (provisioningPreferences != null)
        'ProvisioningPreferences': provisioningPreferences,
      if (tags != null) 'Tags': tags,
      if (notificationArns != null) 'NotificationArns': notificationArns,
      'ProvisionToken': provisionToken,
    });
    return ProvisionProductOutput.fromJson(response_);
  }

  /// Rejects an offer to share the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [portfolioShareType]: The type of shared portfolios to reject. The default
  /// is to reject imported portfolios.
  ///
  /// *    `AWS_ORGANIZATIONS` - Reject portfolios shared by the master account
  /// of your organization.
  ///
  /// *    `IMPORTED` - Reject imported portfolios.
  ///
  /// *    `AWS_SERVICECATALOG` - Not supported. (Throws
  /// ResourceNotFoundException.)
  ///
  ///
  /// For example, `aws servicecatalog reject-portfolio-share --portfolio-id
  /// "port-2qwzkwxt3y5fk" --portfolio-share-type AWS_ORGANIZATIONS`
  Future<RejectPortfolioShareOutput> rejectPortfolioShare(String portfolioId,
      {String acceptLanguage, String portfolioShareType}) async {
    var response_ = await _client.send('RejectPortfolioShare', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'PortfolioId': portfolioId,
      if (portfolioShareType != null) 'PortfolioShareType': portfolioShareType,
    });
    return RejectPortfolioShareOutput.fromJson(response_);
  }

  /// Lists the provisioned products that are available (not terminated).
  ///
  /// To use additional filtering, see SearchProvisionedProducts.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [accessLevelFilter]: The access level to use to obtain results. The
  /// default is `User`.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<ScanProvisionedProductsOutput> scanProvisionedProducts(
      {String acceptLanguage,
      AccessLevelFilter accessLevelFilter,
      int pageSize,
      String pageToken}) async {
    var response_ = await _client.send('ScanProvisionedProducts', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      if (accessLevelFilter != null) 'AccessLevelFilter': accessLevelFilter,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
    });
    return ScanProvisionedProductsOutput.fromJson(response_);
  }

  /// Gets information about the products to which the caller has access.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [filters]: The search filters. If no search filters are specified, the
  /// output includes all products to which the caller has access.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [sortBy]: The sort field. If no value is specified, the results are not
  /// sorted.
  ///
  /// [sortOrder]: The sort order. If no value is specified, the results are not
  /// sorted.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<SearchProductsOutput> searchProducts(
      {String acceptLanguage,
      Map<String, List<String>> filters,
      int pageSize,
      String sortBy,
      String sortOrder,
      String pageToken}) async {
    var response_ = await _client.send('SearchProducts', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      if (filters != null) 'Filters': filters,
      if (pageSize != null) 'PageSize': pageSize,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
      if (pageToken != null) 'PageToken': pageToken,
    });
    return SearchProductsOutput.fromJson(response_);
  }

  /// Gets information about the products for the specified portfolio or all
  /// products.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [filters]: The search filters. If no search filters are specified, the
  /// output includes all products to which the administrator has access.
  ///
  /// [sortBy]: The sort field. If no value is specified, the results are not
  /// sorted.
  ///
  /// [sortOrder]: The sort order. If no value is specified, the results are not
  /// sorted.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [productSource]: Access level of the source of the product.
  Future<SearchProductsAsAdminOutput> searchProductsAsAdmin(
      {String acceptLanguage,
      String portfolioId,
      Map<String, List<String>> filters,
      String sortBy,
      String sortOrder,
      String pageToken,
      int pageSize,
      String productSource}) async {
    var response_ = await _client.send('SearchProductsAsAdmin', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      if (portfolioId != null) 'PortfolioId': portfolioId,
      if (filters != null) 'Filters': filters,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
      if (pageToken != null) 'PageToken': pageToken,
      if (pageSize != null) 'PageSize': pageSize,
      if (productSource != null) 'ProductSource': productSource,
    });
    return SearchProductsAsAdminOutput.fromJson(response_);
  }

  /// Gets information about the provisioned products that meet the specified
  /// criteria.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [accessLevelFilter]: The access level to use to obtain results. The
  /// default is `User`.
  ///
  /// [filters]: The search filters.
  ///
  /// When the key is `SearchQuery`, the searchable fields are `arn`,
  /// `createdTime`, `id`, `lastRecordId`, `idempotencyToken`, `name`,
  /// `physicalId`, `productId`, `provisioningArtifact`, `type`, `status`,
  /// `tags`, `userArn`, and `userArnSession`.
  ///
  /// Example: `"SearchQuery":["status:AVAILABLE"]`
  ///
  /// [sortBy]: The sort field. If no value is specified, the results are not
  /// sorted. The valid values are `arn`, `id`, `name`, and `lastRecordId`.
  ///
  /// [sortOrder]: The sort order. If no value is specified, the results are not
  /// sorted.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<SearchProvisionedProductsOutput> searchProvisionedProducts(
      {String acceptLanguage,
      AccessLevelFilter accessLevelFilter,
      Map<String, List<String>> filters,
      String sortBy,
      String sortOrder,
      int pageSize,
      String pageToken}) async {
    var response_ = await _client.send('SearchProvisionedProducts', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      if (accessLevelFilter != null) 'AccessLevelFilter': accessLevelFilter,
      if (filters != null) 'Filters': filters,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
      if (pageSize != null) 'PageSize': pageSize,
      if (pageToken != null) 'PageToken': pageToken,
    });
    return SearchProvisionedProductsOutput.fromJson(response_);
  }

  /// Terminates the specified provisioned product.
  ///
  /// This operation does not delete any records associated with the provisioned
  /// product.
  ///
  /// You can check the status of this request using DescribeRecord.
  ///
  /// [provisionedProductName]: The name of the provisioned product. You cannot
  /// specify both `ProvisionedProductName` and `ProvisionedProductId`.
  ///
  /// [provisionedProductId]: The identifier of the provisioned product. You
  /// cannot specify both `ProvisionedProductName` and `ProvisionedProductId`.
  ///
  /// [terminateToken]: An idempotency token that uniquely identifies the
  /// termination request. This token is only valid during the termination
  /// process. After the provisioned product is terminated, subsequent requests
  /// to terminate the same provisioned product always return
  /// **ResourceNotFound**.
  ///
  /// [ignoreErrors]: If set to true, AWS Service Catalog stops managing the
  /// specified provisioned product even if it cannot delete the underlying
  /// resources.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  Future<TerminateProvisionedProductOutput> terminateProvisionedProduct(
      String terminateToken,
      {String provisionedProductName,
      String provisionedProductId,
      bool ignoreErrors,
      String acceptLanguage}) async {
    var response_ = await _client.send('TerminateProvisionedProduct', {
      if (provisionedProductName != null)
        'ProvisionedProductName': provisionedProductName,
      if (provisionedProductId != null)
        'ProvisionedProductId': provisionedProductId,
      'TerminateToken': terminateToken,
      if (ignoreErrors != null) 'IgnoreErrors': ignoreErrors,
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
    });
    return TerminateProvisionedProductOutput.fromJson(response_);
  }

  /// Updates the specified constraint.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [id]: The identifier of the constraint.
  ///
  /// [description]: The updated description of the constraint.
  ///
  /// [parameters]: The constraint parameters, in JSON format. The syntax
  /// depends on the constraint type as follows:
  ///
  /// LAUNCH
  ///
  /// Specify the `RoleArn` property as follows:
  ///
  ///  `{"RoleArn" : "arn:aws:iam::123456789012:role/LaunchRole"}`
  ///
  /// You cannot have both a `LAUNCH` and a `STACKSET` constraint.
  ///
  /// You also cannot have more than one `LAUNCH` constraint on a product and
  /// portfolio.
  ///
  /// NOTIFICATION
  ///
  /// Specify the `NotificationArns` property as follows:
  ///
  ///  `{"NotificationArns" : ["arn:aws:sns:us-east-1:123456789012:Topic"]}`
  ///
  /// RESOURCE_UPDATE
  ///
  /// Specify the `TagUpdatesOnProvisionedProduct` property as follows:
  ///
  ///
  /// `{"Version":"2.0","Properties":{"TagUpdateOnProvisionedProduct":"String"}}`
  ///
  /// The `TagUpdatesOnProvisionedProduct` property accepts a string value of
  /// `ALLOWED` or `NOT_ALLOWED`.
  ///
  /// STACKSET
  ///
  /// Specify the `Parameters` property as follows:
  ///
  ///  `{"Version": "String", "Properties": {"AccountList": [ "String" ],
  /// "RegionList": [ "String" ], "AdminRole": "String", "ExecutionRole":
  /// "String"}}`
  ///
  /// You cannot have both a `LAUNCH` and a `STACKSET` constraint.
  ///
  /// You also cannot have more than one `STACKSET` constraint on a product and
  /// portfolio.
  ///
  /// Products with a `STACKSET` constraint will launch an AWS CloudFormation
  /// stack set.
  ///
  /// TEMPLATE
  ///
  /// Specify the `Rules` property. For more information, see
  /// [Template Constraint Rules](http://docs.aws.amazon.com/servicecatalog/latest/adminguide/reference-template_constraint_rules.html).
  Future<UpdateConstraintOutput> updateConstraint(String id,
      {String acceptLanguage, String description, String parameters}) async {
    var response_ = await _client.send('UpdateConstraint', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Id': id,
      if (description != null) 'Description': description,
      if (parameters != null) 'Parameters': parameters,
    });
    return UpdateConstraintOutput.fromJson(response_);
  }

  /// Updates the specified portfolio.
  ///
  /// You cannot update a product that was shared with you.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [id]: The portfolio identifier.
  ///
  /// [displayName]: The name to use for display purposes.
  ///
  /// [description]: The updated description of the portfolio.
  ///
  /// [providerName]: The updated name of the portfolio provider.
  ///
  /// [addTags]: The tags to add.
  ///
  /// [removeTags]: The tags to remove.
  Future<UpdatePortfolioOutput> updatePortfolio(String id,
      {String acceptLanguage,
      String displayName,
      String description,
      String providerName,
      List<Tag> addTags,
      List<String> removeTags}) async {
    var response_ = await _client.send('UpdatePortfolio', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Id': id,
      if (displayName != null) 'DisplayName': displayName,
      if (description != null) 'Description': description,
      if (providerName != null) 'ProviderName': providerName,
      if (addTags != null) 'AddTags': addTags,
      if (removeTags != null) 'RemoveTags': removeTags,
    });
    return UpdatePortfolioOutput.fromJson(response_);
  }

  /// Updates the specified product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [id]: The product identifier.
  ///
  /// [name]: The updated product name.
  ///
  /// [owner]: The updated owner of the product.
  ///
  /// [description]: The updated description of the product.
  ///
  /// [distributor]: The updated distributor of the product.
  ///
  /// [supportDescription]: The updated support description for the product.
  ///
  /// [supportEmail]: The updated support email for the product.
  ///
  /// [supportUrl]: The updated support URL for the product.
  ///
  /// [addTags]: The tags to add to the product.
  ///
  /// [removeTags]: The tags to remove from the product.
  Future<UpdateProductOutput> updateProduct(String id,
      {String acceptLanguage,
      String name,
      String owner,
      String description,
      String distributor,
      String supportDescription,
      String supportEmail,
      String supportUrl,
      List<Tag> addTags,
      List<String> removeTags}) async {
    var response_ = await _client.send('UpdateProduct', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'Id': id,
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (description != null) 'Description': description,
      if (distributor != null) 'Distributor': distributor,
      if (supportDescription != null) 'SupportDescription': supportDescription,
      if (supportEmail != null) 'SupportEmail': supportEmail,
      if (supportUrl != null) 'SupportUrl': supportUrl,
      if (addTags != null) 'AddTags': addTags,
      if (removeTags != null) 'RemoveTags': removeTags,
    });
    return UpdateProductOutput.fromJson(response_);
  }

  /// Requests updates to the configuration of the specified provisioned
  /// product.
  ///
  /// If there are tags associated with the object, they cannot be updated or
  /// added. Depending on the specific updates requested, this operation can
  /// update with no interruption, with some interruption, or replace the
  /// provisioned product entirely.
  ///
  /// You can check the status of this request using DescribeRecord.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [provisionedProductName]: The name of the provisioned product. You cannot
  /// specify both `ProvisionedProductName` and `ProvisionedProductId`.
  ///
  /// [provisionedProductId]: The identifier of the provisioned product. You
  /// cannot specify both `ProvisionedProductName` and `ProvisionedProductId`.
  ///
  /// [productId]: The identifier of the product.
  ///
  /// [provisioningArtifactId]: The identifier of the provisioning artifact.
  ///
  /// [pathId]: The new path identifier. This value is optional if the product
  /// has a default path, and required if the product has more than one path.
  ///
  /// [provisioningParameters]: The new parameters.
  ///
  /// [provisioningPreferences]: An object that contains information about the
  /// provisioning preferences for a stack set.
  ///
  /// [tags]: One or more tags. Requires the product to have `RESOURCE_UPDATE`
  /// constraint with `TagUpdatesOnProvisionedProduct` set to `ALLOWED` to allow
  /// tag updates.
  ///
  /// [updateToken]: The idempotency token that uniquely identifies the
  /// provisioning update request.
  Future<UpdateProvisionedProductOutput> updateProvisionedProduct(
      String updateToken,
      {String acceptLanguage,
      String provisionedProductName,
      String provisionedProductId,
      String productId,
      String provisioningArtifactId,
      String pathId,
      List<UpdateProvisioningParameter> provisioningParameters,
      UpdateProvisioningPreferences provisioningPreferences,
      List<Tag> tags}) async {
    var response_ = await _client.send('UpdateProvisionedProduct', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      if (provisionedProductName != null)
        'ProvisionedProductName': provisionedProductName,
      if (provisionedProductId != null)
        'ProvisionedProductId': provisionedProductId,
      if (productId != null) 'ProductId': productId,
      if (provisioningArtifactId != null)
        'ProvisioningArtifactId': provisioningArtifactId,
      if (pathId != null) 'PathId': pathId,
      if (provisioningParameters != null)
        'ProvisioningParameters': provisioningParameters,
      if (provisioningPreferences != null)
        'ProvisioningPreferences': provisioningPreferences,
      if (tags != null) 'Tags': tags,
      'UpdateToken': updateToken,
    });
    return UpdateProvisionedProductOutput.fromJson(response_);
  }

  /// Requests updates to the properties of the specified provisioned product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [provisionedProductId]: The identifier of the provisioned product.
  ///
  /// [provisionedProductProperties]: A map that contains the provisioned
  /// product properties to be updated.
  ///
  /// The `OWNER` key only accepts user ARNs. The owner is the user that is
  /// allowed to see, update, terminate, and execute service actions in the
  /// provisioned product.
  ///
  /// The administrator can change the owner of a provisioned product to another
  /// IAM user within the same account. Both end user owners and administrators
  /// can see ownership history of the provisioned product using the
  /// `ListRecordHistory` API. The new owner can describe all past records for
  /// the provisioned product using the `DescribeRecord` API. The previous owner
  /// can no longer use `DescribeRecord`, but can still see the product's
  /// history from when he was an owner using `ListRecordHistory`.
  ///
  /// If a provisioned product ownership is assigned to an end user, they can
  /// see and perform any action through the API or Service Catalog console such
  /// as update, terminate, and execute service actions. If an end user
  /// provisions a product and the owner is updated to someone else, they will
  /// no longer be able to see or perform any actions through API or the Service
  /// Catalog console on that provisioned product.
  ///
  /// [idempotencyToken]: The idempotency token that uniquely identifies the
  /// provisioning product update request.
  Future<UpdateProvisionedProductPropertiesOutput>
      updateProvisionedProductProperties(
          {String acceptLanguage,
          @required String provisionedProductId,
          @required Map<String, String> provisionedProductProperties,
          @required String idempotencyToken}) async {
    var response_ = await _client.send('UpdateProvisionedProductProperties', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ProvisionedProductId': provisionedProductId,
      'ProvisionedProductProperties': provisionedProductProperties,
      'IdempotencyToken': idempotencyToken,
    });
    return UpdateProvisionedProductPropertiesOutput.fromJson(response_);
  }

  /// Updates the specified provisioning artifact (also known as a version) for
  /// the specified product.
  ///
  /// You cannot update a provisioning artifact for a product that was shared
  /// with you.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  ///
  /// [productId]: The product identifier.
  ///
  /// [provisioningArtifactId]: The identifier of the provisioning artifact.
  ///
  /// [name]: The updated name of the provisioning artifact.
  ///
  /// [description]: The updated description of the provisioning artifact.
  ///
  /// [active]: Indicates whether the product version is active.
  ///
  /// [guidance]: Information set by the administrator to provide guidance to
  /// end users about which provisioning artifacts to use.
  ///
  /// The `DEFAULT` value indicates that the product version is active.
  ///
  /// The administrator can set the guidance to `DEPRECATED` to inform users
  /// that the product version is deprecated. Users are able to make updates to
  /// a provisioned product of a deprecated version but cannot launch new
  /// provisioned products using a deprecated version.
  Future<UpdateProvisioningArtifactOutput> updateProvisioningArtifact(
      {String acceptLanguage,
      @required String productId,
      @required String provisioningArtifactId,
      String name,
      String description,
      bool active,
      String guidance}) async {
    var response_ = await _client.send('UpdateProvisioningArtifact', {
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
      'ProductId': productId,
      'ProvisioningArtifactId': provisioningArtifactId,
      if (name != null) 'Name': name,
      if (description != null) 'Description': description,
      if (active != null) 'Active': active,
      if (guidance != null) 'Guidance': guidance,
    });
    return UpdateProvisioningArtifactOutput.fromJson(response_);
  }

  /// Updates a self-service action.
  ///
  /// [id]: The self-service action identifier.
  ///
  /// [name]: The self-service action name.
  ///
  /// [definition]: A map that defines the self-service action.
  ///
  /// [description]: The self-service action description.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` - English (default)
  ///
  /// *    `jp` - Japanese
  ///
  /// *    `zh` - Chinese
  Future<UpdateServiceActionOutput> updateServiceAction(String id,
      {String name,
      Map<String, String> definition,
      String description,
      String acceptLanguage}) async {
    var response_ = await _client.send('UpdateServiceAction', {
      'Id': id,
      if (name != null) 'Name': name,
      if (definition != null) 'Definition': definition,
      if (description != null) 'Description': description,
      if (acceptLanguage != null) 'AcceptLanguage': acceptLanguage,
    });
    return UpdateServiceActionOutput.fromJson(response_);
  }

  /// Updates the specified TagOption.
  ///
  /// [id]: The TagOption identifier.
  ///
  /// [value]: The updated value.
  ///
  /// [active]: The updated active state.
  Future<UpdateTagOptionOutput> updateTagOption(String id,
      {String value, bool active}) async {
    var response_ = await _client.send('UpdateTagOption', {
      'Id': id,
      if (value != null) 'Value': value,
      if (active != null) 'Active': active,
    });
    return UpdateTagOptionOutput.fromJson(response_);
  }
}

class AcceptPortfolioShareOutput {
  AcceptPortfolioShareOutput();
  static AcceptPortfolioShareOutput fromJson(Map<String, dynamic> json) =>
      AcceptPortfolioShareOutput();
}

/// The access level to use to filter results.
class AccessLevelFilter {
  /// The access level.
  ///
  /// *    `Account` - Filter results based on the account.
  ///
  /// *    `Role` - Filter results based on the federated role of the specified
  /// user.
  ///
  /// *    `User` - Filter results based on the specified user.
  final String key;

  /// The user to which the access level applies. The only supported value is
  /// `Self`.
  final String value;

  AccessLevelFilter({
    this.key,
    this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class AssociateBudgetWithResourceOutput {
  AssociateBudgetWithResourceOutput();
  static AssociateBudgetWithResourceOutput fromJson(
          Map<String, dynamic> json) =>
      AssociateBudgetWithResourceOutput();
}

class AssociatePrincipalWithPortfolioOutput {
  AssociatePrincipalWithPortfolioOutput();
  static AssociatePrincipalWithPortfolioOutput fromJson(
          Map<String, dynamic> json) =>
      AssociatePrincipalWithPortfolioOutput();
}

class AssociateProductWithPortfolioOutput {
  AssociateProductWithPortfolioOutput();
  static AssociateProductWithPortfolioOutput fromJson(
          Map<String, dynamic> json) =>
      AssociateProductWithPortfolioOutput();
}

class AssociateServiceActionWithProvisioningArtifactOutput {
  AssociateServiceActionWithProvisioningArtifactOutput();
  static AssociateServiceActionWithProvisioningArtifactOutput fromJson(
          Map<String, dynamic> json) =>
      AssociateServiceActionWithProvisioningArtifactOutput();
}

class AssociateTagOptionWithResourceOutput {
  AssociateTagOptionWithResourceOutput();
  static AssociateTagOptionWithResourceOutput fromJson(
          Map<String, dynamic> json) =>
      AssociateTagOptionWithResourceOutput();
}

class BatchAssociateServiceActionWithProvisioningArtifactOutput {
  /// An object that contains a list of errors, along with information to help
  /// you identify the self-service action.
  final List<FailedServiceActionAssociation> failedServiceActionAssociations;

  BatchAssociateServiceActionWithProvisioningArtifactOutput({
    this.failedServiceActionAssociations,
  });
  static BatchAssociateServiceActionWithProvisioningArtifactOutput fromJson(
          Map<String, dynamic> json) =>
      BatchAssociateServiceActionWithProvisioningArtifactOutput(
        failedServiceActionAssociations:
            json.containsKey('FailedServiceActionAssociations')
                ? (json['FailedServiceActionAssociations'] as List)
                    .map((e) => FailedServiceActionAssociation.fromJson(e))
                    .toList()
                : null,
      );
}

class BatchDisassociateServiceActionFromProvisioningArtifactOutput {
  /// An object that contains a list of errors, along with information to help
  /// you identify the self-service action.
  final List<FailedServiceActionAssociation> failedServiceActionAssociations;

  BatchDisassociateServiceActionFromProvisioningArtifactOutput({
    this.failedServiceActionAssociations,
  });
  static BatchDisassociateServiceActionFromProvisioningArtifactOutput fromJson(
          Map<String, dynamic> json) =>
      BatchDisassociateServiceActionFromProvisioningArtifactOutput(
        failedServiceActionAssociations:
            json.containsKey('FailedServiceActionAssociations')
                ? (json['FailedServiceActionAssociations'] as List)
                    .map((e) => FailedServiceActionAssociation.fromJson(e))
                    .toList()
                : null,
      );
}

/// Information about a budget.
class BudgetDetail {
  /// Name of the associated budget.
  final String budgetName;

  BudgetDetail({
    this.budgetName,
  });
  static BudgetDetail fromJson(Map<String, dynamic> json) => BudgetDetail(
        budgetName: json.containsKey('BudgetName')
            ? json['BudgetName'] as String
            : null,
      );
}

/// Information about a CloudWatch dashboard.
class CloudWatchDashboard {
  /// The name of the CloudWatch dashboard.
  final String name;

  CloudWatchDashboard({
    this.name,
  });
  static CloudWatchDashboard fromJson(Map<String, dynamic> json) =>
      CloudWatchDashboard(
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

/// Information about a constraint.
class ConstraintDetail {
  /// The identifier of the constraint.
  final String constraintId;

  /// The type of constraint.
  ///
  /// *    `LAUNCH`
  ///
  /// *    `NOTIFICATION`
  ///
  /// *   STACKSET
  ///
  /// *    `TEMPLATE`
  final String type;

  /// The description of the constraint.
  final String description;

  /// The owner of the constraint.
  final String owner;

  ConstraintDetail({
    this.constraintId,
    this.type,
    this.description,
    this.owner,
  });
  static ConstraintDetail fromJson(Map<String, dynamic> json) =>
      ConstraintDetail(
        constraintId: json.containsKey('ConstraintId')
            ? json['ConstraintId'] as String
            : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        owner: json.containsKey('Owner') ? json['Owner'] as String : null,
      );
}

/// Summary information about a constraint.
class ConstraintSummary {
  /// The type of constraint.
  ///
  /// *    `LAUNCH`
  ///
  /// *    `NOTIFICATION`
  ///
  /// *   STACKSET
  ///
  /// *    `TEMPLATE`
  final String type;

  /// The description of the constraint.
  final String description;

  ConstraintSummary({
    this.type,
    this.description,
  });
  static ConstraintSummary fromJson(Map<String, dynamic> json) =>
      ConstraintSummary(
        type: json.containsKey('Type') ? json['Type'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

class CopyProductOutput {
  /// The token to use to track the progress of the operation.
  final String copyProductToken;

  CopyProductOutput({
    this.copyProductToken,
  });
  static CopyProductOutput fromJson(Map<String, dynamic> json) =>
      CopyProductOutput(
        copyProductToken: json.containsKey('CopyProductToken')
            ? json['CopyProductToken'] as String
            : null,
      );
}

class CreateConstraintOutput {
  /// Information about the constraint.
  final ConstraintDetail constraintDetail;

  /// The constraint parameters.
  final String constraintParameters;

  /// The status of the current request.
  final String status;

  CreateConstraintOutput({
    this.constraintDetail,
    this.constraintParameters,
    this.status,
  });
  static CreateConstraintOutput fromJson(Map<String, dynamic> json) =>
      CreateConstraintOutput(
        constraintDetail: json.containsKey('ConstraintDetail')
            ? ConstraintDetail.fromJson(json['ConstraintDetail'])
            : null,
        constraintParameters: json.containsKey('ConstraintParameters')
            ? json['ConstraintParameters'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

class CreatePortfolioOutput {
  /// Information about the portfolio.
  final PortfolioDetail portfolioDetail;

  /// Information about the tags associated with the portfolio.
  final List<Tag> tags;

  CreatePortfolioOutput({
    this.portfolioDetail,
    this.tags,
  });
  static CreatePortfolioOutput fromJson(Map<String, dynamic> json) =>
      CreatePortfolioOutput(
        portfolioDetail: json.containsKey('PortfolioDetail')
            ? PortfolioDetail.fromJson(json['PortfolioDetail'])
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class CreatePortfolioShareOutput {
  /// The portfolio share unique identifier. This will only be returned if
  /// portfolio is shared to an organization node.
  final String portfolioShareToken;

  CreatePortfolioShareOutput({
    this.portfolioShareToken,
  });
  static CreatePortfolioShareOutput fromJson(Map<String, dynamic> json) =>
      CreatePortfolioShareOutput(
        portfolioShareToken: json.containsKey('PortfolioShareToken')
            ? json['PortfolioShareToken'] as String
            : null,
      );
}

class CreateProductOutput {
  /// Information about the product view.
  final ProductViewDetail productViewDetail;

  /// Information about the provisioning artifact.
  final ProvisioningArtifactDetail provisioningArtifactDetail;

  /// Information about the tags associated with the product.
  final List<Tag> tags;

  CreateProductOutput({
    this.productViewDetail,
    this.provisioningArtifactDetail,
    this.tags,
  });
  static CreateProductOutput fromJson(Map<String, dynamic> json) =>
      CreateProductOutput(
        productViewDetail: json.containsKey('ProductViewDetail')
            ? ProductViewDetail.fromJson(json['ProductViewDetail'])
            : null,
        provisioningArtifactDetail:
            json.containsKey('ProvisioningArtifactDetail')
                ? ProvisioningArtifactDetail.fromJson(
                    json['ProvisioningArtifactDetail'])
                : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class CreateProvisionedProductPlanOutput {
  /// The name of the plan.
  final String planName;

  /// The plan identifier.
  final String planId;

  /// The product identifier.
  final String provisionProductId;

  /// The user-friendly name of the provisioned product.
  final String provisionedProductName;

  /// The identifier of the provisioning artifact.
  final String provisioningArtifactId;

  CreateProvisionedProductPlanOutput({
    this.planName,
    this.planId,
    this.provisionProductId,
    this.provisionedProductName,
    this.provisioningArtifactId,
  });
  static CreateProvisionedProductPlanOutput fromJson(
          Map<String, dynamic> json) =>
      CreateProvisionedProductPlanOutput(
        planName:
            json.containsKey('PlanName') ? json['PlanName'] as String : null,
        planId: json.containsKey('PlanId') ? json['PlanId'] as String : null,
        provisionProductId: json.containsKey('ProvisionProductId')
            ? json['ProvisionProductId'] as String
            : null,
        provisionedProductName: json.containsKey('ProvisionedProductName')
            ? json['ProvisionedProductName'] as String
            : null,
        provisioningArtifactId: json.containsKey('ProvisioningArtifactId')
            ? json['ProvisioningArtifactId'] as String
            : null,
      );
}

class CreateProvisioningArtifactOutput {
  /// Information about the provisioning artifact.
  final ProvisioningArtifactDetail provisioningArtifactDetail;

  /// The URL of the CloudFormation template in Amazon S3, in JSON format.
  final Map<String, String> info;

  /// The status of the current request.
  final String status;

  CreateProvisioningArtifactOutput({
    this.provisioningArtifactDetail,
    this.info,
    this.status,
  });
  static CreateProvisioningArtifactOutput fromJson(Map<String, dynamic> json) =>
      CreateProvisioningArtifactOutput(
        provisioningArtifactDetail:
            json.containsKey('ProvisioningArtifactDetail')
                ? ProvisioningArtifactDetail.fromJson(
                    json['ProvisioningArtifactDetail'])
                : null,
        info: json.containsKey('Info')
            ? (json['Info'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

class CreateServiceActionOutput {
  /// An object containing information about the self-service action.
  final ServiceActionDetail serviceActionDetail;

  CreateServiceActionOutput({
    this.serviceActionDetail,
  });
  static CreateServiceActionOutput fromJson(Map<String, dynamic> json) =>
      CreateServiceActionOutput(
        serviceActionDetail: json.containsKey('ServiceActionDetail')
            ? ServiceActionDetail.fromJson(json['ServiceActionDetail'])
            : null,
      );
}

class CreateTagOptionOutput {
  /// Information about the TagOption.
  final TagOptionDetail tagOptionDetail;

  CreateTagOptionOutput({
    this.tagOptionDetail,
  });
  static CreateTagOptionOutput fromJson(Map<String, dynamic> json) =>
      CreateTagOptionOutput(
        tagOptionDetail: json.containsKey('TagOptionDetail')
            ? TagOptionDetail.fromJson(json['TagOptionDetail'])
            : null,
      );
}

class DeleteConstraintOutput {
  DeleteConstraintOutput();
  static DeleteConstraintOutput fromJson(Map<String, dynamic> json) =>
      DeleteConstraintOutput();
}

class DeletePortfolioOutput {
  DeletePortfolioOutput();
  static DeletePortfolioOutput fromJson(Map<String, dynamic> json) =>
      DeletePortfolioOutput();
}

class DeletePortfolioShareOutput {
  /// The portfolio share unique identifier. This will only be returned if
  /// delete is made to an organization node.
  final String portfolioShareToken;

  DeletePortfolioShareOutput({
    this.portfolioShareToken,
  });
  static DeletePortfolioShareOutput fromJson(Map<String, dynamic> json) =>
      DeletePortfolioShareOutput(
        portfolioShareToken: json.containsKey('PortfolioShareToken')
            ? json['PortfolioShareToken'] as String
            : null,
      );
}

class DeleteProductOutput {
  DeleteProductOutput();
  static DeleteProductOutput fromJson(Map<String, dynamic> json) =>
      DeleteProductOutput();
}

class DeleteProvisionedProductPlanOutput {
  DeleteProvisionedProductPlanOutput();
  static DeleteProvisionedProductPlanOutput fromJson(
          Map<String, dynamic> json) =>
      DeleteProvisionedProductPlanOutput();
}

class DeleteProvisioningArtifactOutput {
  DeleteProvisioningArtifactOutput();
  static DeleteProvisioningArtifactOutput fromJson(Map<String, dynamic> json) =>
      DeleteProvisioningArtifactOutput();
}

class DeleteServiceActionOutput {
  DeleteServiceActionOutput();
  static DeleteServiceActionOutput fromJson(Map<String, dynamic> json) =>
      DeleteServiceActionOutput();
}

class DeleteTagOptionOutput {
  DeleteTagOptionOutput();
  static DeleteTagOptionOutput fromJson(Map<String, dynamic> json) =>
      DeleteTagOptionOutput();
}

class DescribeConstraintOutput {
  /// Information about the constraint.
  final ConstraintDetail constraintDetail;

  /// The constraint parameters.
  final String constraintParameters;

  /// The status of the current request.
  final String status;

  DescribeConstraintOutput({
    this.constraintDetail,
    this.constraintParameters,
    this.status,
  });
  static DescribeConstraintOutput fromJson(Map<String, dynamic> json) =>
      DescribeConstraintOutput(
        constraintDetail: json.containsKey('ConstraintDetail')
            ? ConstraintDetail.fromJson(json['ConstraintDetail'])
            : null,
        constraintParameters: json.containsKey('ConstraintParameters')
            ? json['ConstraintParameters'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

class DescribeCopyProductStatusOutput {
  /// The status of the copy product operation.
  final String copyProductStatus;

  /// The identifier of the copied product.
  final String targetProductId;

  /// The status message.
  final String statusDetail;

  DescribeCopyProductStatusOutput({
    this.copyProductStatus,
    this.targetProductId,
    this.statusDetail,
  });
  static DescribeCopyProductStatusOutput fromJson(Map<String, dynamic> json) =>
      DescribeCopyProductStatusOutput(
        copyProductStatus: json.containsKey('CopyProductStatus')
            ? json['CopyProductStatus'] as String
            : null,
        targetProductId: json.containsKey('TargetProductId')
            ? json['TargetProductId'] as String
            : null,
        statusDetail: json.containsKey('StatusDetail')
            ? json['StatusDetail'] as String
            : null,
      );
}

class DescribePortfolioOutput {
  /// Information about the portfolio.
  final PortfolioDetail portfolioDetail;

  /// Information about the tags associated with the portfolio.
  final List<Tag> tags;

  /// Information about the TagOptions associated with the portfolio.
  final List<TagOptionDetail> tagOptions;

  /// Information about the associated budgets.
  final List<BudgetDetail> budgets;

  DescribePortfolioOutput({
    this.portfolioDetail,
    this.tags,
    this.tagOptions,
    this.budgets,
  });
  static DescribePortfolioOutput fromJson(Map<String, dynamic> json) =>
      DescribePortfolioOutput(
        portfolioDetail: json.containsKey('PortfolioDetail')
            ? PortfolioDetail.fromJson(json['PortfolioDetail'])
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        tagOptions: json.containsKey('TagOptions')
            ? (json['TagOptions'] as List)
                .map((e) => TagOptionDetail.fromJson(e))
                .toList()
            : null,
        budgets: json.containsKey('Budgets')
            ? (json['Budgets'] as List)
                .map((e) => BudgetDetail.fromJson(e))
                .toList()
            : null,
      );
}

class DescribePortfolioShareStatusOutput {
  /// The token for the portfolio share operation. For example,
  /// `share-6v24abcdefghi`.
  final String portfolioShareToken;

  /// The portfolio identifier.
  final String portfolioId;

  /// Organization node identifier. It can be either account id, organizational
  /// unit id or organization id.
  final String organizationNodeValue;

  /// Status of the portfolio share operation.
  final String status;

  /// Information about the portfolio share operation.
  final ShareDetails shareDetails;

  DescribePortfolioShareStatusOutput({
    this.portfolioShareToken,
    this.portfolioId,
    this.organizationNodeValue,
    this.status,
    this.shareDetails,
  });
  static DescribePortfolioShareStatusOutput fromJson(
          Map<String, dynamic> json) =>
      DescribePortfolioShareStatusOutput(
        portfolioShareToken: json.containsKey('PortfolioShareToken')
            ? json['PortfolioShareToken'] as String
            : null,
        portfolioId: json.containsKey('PortfolioId')
            ? json['PortfolioId'] as String
            : null,
        organizationNodeValue: json.containsKey('OrganizationNodeValue')
            ? json['OrganizationNodeValue'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        shareDetails: json.containsKey('ShareDetails')
            ? ShareDetails.fromJson(json['ShareDetails'])
            : null,
      );
}

class DescribeProductAsAdminOutput {
  /// Information about the product view.
  final ProductViewDetail productViewDetail;

  /// Information about the provisioning artifacts (also known as versions) for
  /// the specified product.
  final List<ProvisioningArtifactSummary> provisioningArtifactSummaries;

  /// Information about the tags associated with the product.
  final List<Tag> tags;

  /// Information about the TagOptions associated with the product.
  final List<TagOptionDetail> tagOptions;

  /// Information about the associated budgets.
  final List<BudgetDetail> budgets;

  DescribeProductAsAdminOutput({
    this.productViewDetail,
    this.provisioningArtifactSummaries,
    this.tags,
    this.tagOptions,
    this.budgets,
  });
  static DescribeProductAsAdminOutput fromJson(Map<String, dynamic> json) =>
      DescribeProductAsAdminOutput(
        productViewDetail: json.containsKey('ProductViewDetail')
            ? ProductViewDetail.fromJson(json['ProductViewDetail'])
            : null,
        provisioningArtifactSummaries:
            json.containsKey('ProvisioningArtifactSummaries')
                ? (json['ProvisioningArtifactSummaries'] as List)
                    .map((e) => ProvisioningArtifactSummary.fromJson(e))
                    .toList()
                : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        tagOptions: json.containsKey('TagOptions')
            ? (json['TagOptions'] as List)
                .map((e) => TagOptionDetail.fromJson(e))
                .toList()
            : null,
        budgets: json.containsKey('Budgets')
            ? (json['Budgets'] as List)
                .map((e) => BudgetDetail.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeProductOutput {
  /// Summary information about the product view.
  final ProductViewSummary productViewSummary;

  /// Information about the provisioning artifacts for the specified product.
  final List<ProvisioningArtifact> provisioningArtifacts;

  /// Information about the associated budgets.
  final List<BudgetDetail> budgets;

  DescribeProductOutput({
    this.productViewSummary,
    this.provisioningArtifacts,
    this.budgets,
  });
  static DescribeProductOutput fromJson(Map<String, dynamic> json) =>
      DescribeProductOutput(
        productViewSummary: json.containsKey('ProductViewSummary')
            ? ProductViewSummary.fromJson(json['ProductViewSummary'])
            : null,
        provisioningArtifacts: json.containsKey('ProvisioningArtifacts')
            ? (json['ProvisioningArtifacts'] as List)
                .map((e) => ProvisioningArtifact.fromJson(e))
                .toList()
            : null,
        budgets: json.containsKey('Budgets')
            ? (json['Budgets'] as List)
                .map((e) => BudgetDetail.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeProductViewOutput {
  /// Summary information about the product.
  final ProductViewSummary productViewSummary;

  /// Information about the provisioning artifacts for the product.
  final List<ProvisioningArtifact> provisioningArtifacts;

  DescribeProductViewOutput({
    this.productViewSummary,
    this.provisioningArtifacts,
  });
  static DescribeProductViewOutput fromJson(Map<String, dynamic> json) =>
      DescribeProductViewOutput(
        productViewSummary: json.containsKey('ProductViewSummary')
            ? ProductViewSummary.fromJson(json['ProductViewSummary'])
            : null,
        provisioningArtifacts: json.containsKey('ProvisioningArtifacts')
            ? (json['ProvisioningArtifacts'] as List)
                .map((e) => ProvisioningArtifact.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeProvisionedProductOutput {
  /// Information about the provisioned product.
  final ProvisionedProductDetail provisionedProductDetail;

  /// Any CloudWatch dashboards that were created when provisioning the product.
  final List<CloudWatchDashboard> cloudWatchDashboards;

  DescribeProvisionedProductOutput({
    this.provisionedProductDetail,
    this.cloudWatchDashboards,
  });
  static DescribeProvisionedProductOutput fromJson(Map<String, dynamic> json) =>
      DescribeProvisionedProductOutput(
        provisionedProductDetail: json.containsKey('ProvisionedProductDetail')
            ? ProvisionedProductDetail.fromJson(
                json['ProvisionedProductDetail'])
            : null,
        cloudWatchDashboards: json.containsKey('CloudWatchDashboards')
            ? (json['CloudWatchDashboards'] as List)
                .map((e) => CloudWatchDashboard.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeProvisionedProductPlanOutput {
  /// Information about the plan.
  final ProvisionedProductPlanDetails provisionedProductPlanDetails;

  /// Information about the resource changes that will occur when the plan is
  /// executed.
  final List<ResourceChange> resourceChanges;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  DescribeProvisionedProductPlanOutput({
    this.provisionedProductPlanDetails,
    this.resourceChanges,
    this.nextPageToken,
  });
  static DescribeProvisionedProductPlanOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeProvisionedProductPlanOutput(
        provisionedProductPlanDetails:
            json.containsKey('ProvisionedProductPlanDetails')
                ? ProvisionedProductPlanDetails.fromJson(
                    json['ProvisionedProductPlanDetails'])
                : null,
        resourceChanges: json.containsKey('ResourceChanges')
            ? (json['ResourceChanges'] as List)
                .map((e) => ResourceChange.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class DescribeProvisioningArtifactOutput {
  /// Information about the provisioning artifact.
  final ProvisioningArtifactDetail provisioningArtifactDetail;

  /// The URL of the CloudFormation template in Amazon S3.
  final Map<String, String> info;

  /// The status of the current request.
  final String status;

  DescribeProvisioningArtifactOutput({
    this.provisioningArtifactDetail,
    this.info,
    this.status,
  });
  static DescribeProvisioningArtifactOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeProvisioningArtifactOutput(
        provisioningArtifactDetail:
            json.containsKey('ProvisioningArtifactDetail')
                ? ProvisioningArtifactDetail.fromJson(
                    json['ProvisioningArtifactDetail'])
                : null,
        info: json.containsKey('Info')
            ? (json['Info'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

class DescribeProvisioningParametersOutput {
  /// Information about the parameters used to provision the product.
  final List<ProvisioningArtifactParameter> provisioningArtifactParameters;

  /// Information about the constraints used to provision the product.
  final List<ConstraintSummary> constraintSummaries;

  /// Any additional metadata specifically related to the provisioning of the
  /// product. For example, see the `Version` field of the CloudFormation
  /// template.
  final List<UsageInstruction> usageInstructions;

  /// Information about the TagOptions associated with the resource.
  final List<TagOptionSummary> tagOptions;

  /// An object that contains information about preferences, such as regions and
  /// accounts, for the provisioning artifact.
  final ProvisioningArtifactPreferences provisioningArtifactPreferences;

  DescribeProvisioningParametersOutput({
    this.provisioningArtifactParameters,
    this.constraintSummaries,
    this.usageInstructions,
    this.tagOptions,
    this.provisioningArtifactPreferences,
  });
  static DescribeProvisioningParametersOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeProvisioningParametersOutput(
        provisioningArtifactParameters:
            json.containsKey('ProvisioningArtifactParameters')
                ? (json['ProvisioningArtifactParameters'] as List)
                    .map((e) => ProvisioningArtifactParameter.fromJson(e))
                    .toList()
                : null,
        constraintSummaries: json.containsKey('ConstraintSummaries')
            ? (json['ConstraintSummaries'] as List)
                .map((e) => ConstraintSummary.fromJson(e))
                .toList()
            : null,
        usageInstructions: json.containsKey('UsageInstructions')
            ? (json['UsageInstructions'] as List)
                .map((e) => UsageInstruction.fromJson(e))
                .toList()
            : null,
        tagOptions: json.containsKey('TagOptions')
            ? (json['TagOptions'] as List)
                .map((e) => TagOptionSummary.fromJson(e))
                .toList()
            : null,
        provisioningArtifactPreferences:
            json.containsKey('ProvisioningArtifactPreferences')
                ? ProvisioningArtifactPreferences.fromJson(
                    json['ProvisioningArtifactPreferences'])
                : null,
      );
}

class DescribeRecordOutput {
  /// Information about the product.
  final RecordDetail recordDetail;

  /// Information about the product created as the result of a request. For
  /// example, the output for a CloudFormation-backed product that creates an S3
  /// bucket would include the S3 bucket URL.
  final List<RecordOutput> recordOutputs;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  DescribeRecordOutput({
    this.recordDetail,
    this.recordOutputs,
    this.nextPageToken,
  });
  static DescribeRecordOutput fromJson(Map<String, dynamic> json) =>
      DescribeRecordOutput(
        recordDetail: json.containsKey('RecordDetail')
            ? RecordDetail.fromJson(json['RecordDetail'])
            : null,
        recordOutputs: json.containsKey('RecordOutputs')
            ? (json['RecordOutputs'] as List)
                .map((e) => RecordOutput.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class DescribeServiceActionExecutionParametersOutput {
  final List<ExecutionParameter> serviceActionParameters;

  DescribeServiceActionExecutionParametersOutput({
    this.serviceActionParameters,
  });
  static DescribeServiceActionExecutionParametersOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeServiceActionExecutionParametersOutput(
        serviceActionParameters: json.containsKey('ServiceActionParameters')
            ? (json['ServiceActionParameters'] as List)
                .map((e) => ExecutionParameter.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeServiceActionOutput {
  /// Detailed information about the self-service action.
  final ServiceActionDetail serviceActionDetail;

  DescribeServiceActionOutput({
    this.serviceActionDetail,
  });
  static DescribeServiceActionOutput fromJson(Map<String, dynamic> json) =>
      DescribeServiceActionOutput(
        serviceActionDetail: json.containsKey('ServiceActionDetail')
            ? ServiceActionDetail.fromJson(json['ServiceActionDetail'])
            : null,
      );
}

class DescribeTagOptionOutput {
  /// Information about the TagOption.
  final TagOptionDetail tagOptionDetail;

  DescribeTagOptionOutput({
    this.tagOptionDetail,
  });
  static DescribeTagOptionOutput fromJson(Map<String, dynamic> json) =>
      DescribeTagOptionOutput(
        tagOptionDetail: json.containsKey('TagOptionDetail')
            ? TagOptionDetail.fromJson(json['TagOptionDetail'])
            : null,
      );
}

class DisableAwsOrganizationsAccessOutput {
  DisableAwsOrganizationsAccessOutput();
  static DisableAwsOrganizationsAccessOutput fromJson(
          Map<String, dynamic> json) =>
      DisableAwsOrganizationsAccessOutput();
}

class DisassociateBudgetFromResourceOutput {
  DisassociateBudgetFromResourceOutput();
  static DisassociateBudgetFromResourceOutput fromJson(
          Map<String, dynamic> json) =>
      DisassociateBudgetFromResourceOutput();
}

class DisassociatePrincipalFromPortfolioOutput {
  DisassociatePrincipalFromPortfolioOutput();
  static DisassociatePrincipalFromPortfolioOutput fromJson(
          Map<String, dynamic> json) =>
      DisassociatePrincipalFromPortfolioOutput();
}

class DisassociateProductFromPortfolioOutput {
  DisassociateProductFromPortfolioOutput();
  static DisassociateProductFromPortfolioOutput fromJson(
          Map<String, dynamic> json) =>
      DisassociateProductFromPortfolioOutput();
}

class DisassociateServiceActionFromProvisioningArtifactOutput {
  DisassociateServiceActionFromProvisioningArtifactOutput();
  static DisassociateServiceActionFromProvisioningArtifactOutput fromJson(
          Map<String, dynamic> json) =>
      DisassociateServiceActionFromProvisioningArtifactOutput();
}

class DisassociateTagOptionFromResourceOutput {
  DisassociateTagOptionFromResourceOutput();
  static DisassociateTagOptionFromResourceOutput fromJson(
          Map<String, dynamic> json) =>
      DisassociateTagOptionFromResourceOutput();
}

class EnableAwsOrganizationsAccessOutput {
  EnableAwsOrganizationsAccessOutput();
  static EnableAwsOrganizationsAccessOutput fromJson(
          Map<String, dynamic> json) =>
      EnableAwsOrganizationsAccessOutput();
}

class ExecuteProvisionedProductPlanOutput {
  /// Information about the result of provisioning the product.
  final RecordDetail recordDetail;

  ExecuteProvisionedProductPlanOutput({
    this.recordDetail,
  });
  static ExecuteProvisionedProductPlanOutput fromJson(
          Map<String, dynamic> json) =>
      ExecuteProvisionedProductPlanOutput(
        recordDetail: json.containsKey('RecordDetail')
            ? RecordDetail.fromJson(json['RecordDetail'])
            : null,
      );
}

class ExecuteProvisionedProductServiceActionOutput {
  /// An object containing detailed information about the result of provisioning
  /// the product.
  final RecordDetail recordDetail;

  ExecuteProvisionedProductServiceActionOutput({
    this.recordDetail,
  });
  static ExecuteProvisionedProductServiceActionOutput fromJson(
          Map<String, dynamic> json) =>
      ExecuteProvisionedProductServiceActionOutput(
        recordDetail: json.containsKey('RecordDetail')
            ? RecordDetail.fromJson(json['RecordDetail'])
            : null,
      );
}

class ExecutionParameter {
  final String name;

  final String type;

  final List<String> defaultValues;

  ExecutionParameter({
    this.name,
    this.type,
    this.defaultValues,
  });
  static ExecutionParameter fromJson(Map<String, dynamic> json) =>
      ExecutionParameter(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        defaultValues: json.containsKey('DefaultValues')
            ? (json['DefaultValues'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// An object containing information about the error, along with identifying
/// information about the self-service action and its associations.
class FailedServiceActionAssociation {
  /// The self-service action identifier. For example, `act-fs7abcd89wxyz`.
  final String serviceActionId;

  /// The product identifier. For example, `prod-abcdzk7xy33qa`.
  final String productId;

  /// The identifier of the provisioning artifact. For example,
  /// `pa-4abcdjnxjj6ne`.
  final String provisioningArtifactId;

  /// The error code. Valid values are listed below.
  final String errorCode;

  /// A text description of the error.
  final String errorMessage;

  FailedServiceActionAssociation({
    this.serviceActionId,
    this.productId,
    this.provisioningArtifactId,
    this.errorCode,
    this.errorMessage,
  });
  static FailedServiceActionAssociation fromJson(Map<String, dynamic> json) =>
      FailedServiceActionAssociation(
        serviceActionId: json.containsKey('ServiceActionId')
            ? json['ServiceActionId'] as String
            : null,
        productId:
            json.containsKey('ProductId') ? json['ProductId'] as String : null,
        provisioningArtifactId: json.containsKey('ProvisioningArtifactId')
            ? json['ProvisioningArtifactId'] as String
            : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
      );
}

class GetAwsOrganizationsAccessStatusOutput {
  /// The status of the portfolio share feature.
  final String accessStatus;

  GetAwsOrganizationsAccessStatusOutput({
    this.accessStatus,
  });
  static GetAwsOrganizationsAccessStatusOutput fromJson(
          Map<String, dynamic> json) =>
      GetAwsOrganizationsAccessStatusOutput(
        accessStatus: json.containsKey('AccessStatus')
            ? json['AccessStatus'] as String
            : null,
      );
}

/// Summary information about a product path for a user.
class LaunchPathSummary {
  /// The identifier of the product path.
  final String id;

  /// The constraints on the portfolio-product relationship.
  final List<ConstraintSummary> constraintSummaries;

  /// The tags associated with this product path.
  final List<Tag> tags;

  /// The name of the portfolio to which the user was assigned.
  final String name;

  LaunchPathSummary({
    this.id,
    this.constraintSummaries,
    this.tags,
    this.name,
  });
  static LaunchPathSummary fromJson(Map<String, dynamic> json) =>
      LaunchPathSummary(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        constraintSummaries: json.containsKey('ConstraintSummaries')
            ? (json['ConstraintSummaries'] as List)
                .map((e) => ConstraintSummary.fromJson(e))
                .toList()
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

class ListAcceptedPortfolioSharesOutput {
  /// Information about the portfolios.
  final List<PortfolioDetail> portfolioDetails;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListAcceptedPortfolioSharesOutput({
    this.portfolioDetails,
    this.nextPageToken,
  });
  static ListAcceptedPortfolioSharesOutput fromJson(
          Map<String, dynamic> json) =>
      ListAcceptedPortfolioSharesOutput(
        portfolioDetails: json.containsKey('PortfolioDetails')
            ? (json['PortfolioDetails'] as List)
                .map((e) => PortfolioDetail.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListBudgetsForResourceOutput {
  /// Information about the associated budgets.
  final List<BudgetDetail> budgets;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListBudgetsForResourceOutput({
    this.budgets,
    this.nextPageToken,
  });
  static ListBudgetsForResourceOutput fromJson(Map<String, dynamic> json) =>
      ListBudgetsForResourceOutput(
        budgets: json.containsKey('Budgets')
            ? (json['Budgets'] as List)
                .map((e) => BudgetDetail.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListConstraintsForPortfolioOutput {
  /// Information about the constraints.
  final List<ConstraintDetail> constraintDetails;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListConstraintsForPortfolioOutput({
    this.constraintDetails,
    this.nextPageToken,
  });
  static ListConstraintsForPortfolioOutput fromJson(
          Map<String, dynamic> json) =>
      ListConstraintsForPortfolioOutput(
        constraintDetails: json.containsKey('ConstraintDetails')
            ? (json['ConstraintDetails'] as List)
                .map((e) => ConstraintDetail.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListLaunchPathsOutput {
  /// Information about the launch path.
  final List<LaunchPathSummary> launchPathSummaries;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListLaunchPathsOutput({
    this.launchPathSummaries,
    this.nextPageToken,
  });
  static ListLaunchPathsOutput fromJson(Map<String, dynamic> json) =>
      ListLaunchPathsOutput(
        launchPathSummaries: json.containsKey('LaunchPathSummaries')
            ? (json['LaunchPathSummaries'] as List)
                .map((e) => LaunchPathSummary.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListOrganizationPortfolioAccessOutput {
  /// Displays information about the organization nodes.
  final List<OrganizationNode> organizationNodes;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListOrganizationPortfolioAccessOutput({
    this.organizationNodes,
    this.nextPageToken,
  });
  static ListOrganizationPortfolioAccessOutput fromJson(
          Map<String, dynamic> json) =>
      ListOrganizationPortfolioAccessOutput(
        organizationNodes: json.containsKey('OrganizationNodes')
            ? (json['OrganizationNodes'] as List)
                .map((e) => OrganizationNode.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListPortfolioAccessOutput {
  /// Information about the AWS accounts with access to the portfolio.
  final List<String> accountIds;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListPortfolioAccessOutput({
    this.accountIds,
    this.nextPageToken,
  });
  static ListPortfolioAccessOutput fromJson(Map<String, dynamic> json) =>
      ListPortfolioAccessOutput(
        accountIds: json.containsKey('AccountIds')
            ? (json['AccountIds'] as List).map((e) => e as String).toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListPortfoliosForProductOutput {
  /// Information about the portfolios.
  final List<PortfolioDetail> portfolioDetails;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListPortfoliosForProductOutput({
    this.portfolioDetails,
    this.nextPageToken,
  });
  static ListPortfoliosForProductOutput fromJson(Map<String, dynamic> json) =>
      ListPortfoliosForProductOutput(
        portfolioDetails: json.containsKey('PortfolioDetails')
            ? (json['PortfolioDetails'] as List)
                .map((e) => PortfolioDetail.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListPortfoliosOutput {
  /// Information about the portfolios.
  final List<PortfolioDetail> portfolioDetails;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListPortfoliosOutput({
    this.portfolioDetails,
    this.nextPageToken,
  });
  static ListPortfoliosOutput fromJson(Map<String, dynamic> json) =>
      ListPortfoliosOutput(
        portfolioDetails: json.containsKey('PortfolioDetails')
            ? (json['PortfolioDetails'] as List)
                .map((e) => PortfolioDetail.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListPrincipalsForPortfolioOutput {
  /// The IAM principals (users or roles) associated with the portfolio.
  final List<Principal> principals;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListPrincipalsForPortfolioOutput({
    this.principals,
    this.nextPageToken,
  });
  static ListPrincipalsForPortfolioOutput fromJson(Map<String, dynamic> json) =>
      ListPrincipalsForPortfolioOutput(
        principals: json.containsKey('Principals')
            ? (json['Principals'] as List)
                .map((e) => Principal.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListProvisionedProductPlansOutput {
  /// Information about the plans.
  final List<ProvisionedProductPlanSummary> provisionedProductPlans;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListProvisionedProductPlansOutput({
    this.provisionedProductPlans,
    this.nextPageToken,
  });
  static ListProvisionedProductPlansOutput fromJson(
          Map<String, dynamic> json) =>
      ListProvisionedProductPlansOutput(
        provisionedProductPlans: json.containsKey('ProvisionedProductPlans')
            ? (json['ProvisionedProductPlans'] as List)
                .map((e) => ProvisionedProductPlanSummary.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListProvisioningArtifactsForServiceActionOutput {
  /// An array of objects with information about product views and provisioning
  /// artifacts.
  final List<ProvisioningArtifactView> provisioningArtifactViews;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListProvisioningArtifactsForServiceActionOutput({
    this.provisioningArtifactViews,
    this.nextPageToken,
  });
  static ListProvisioningArtifactsForServiceActionOutput fromJson(
          Map<String, dynamic> json) =>
      ListProvisioningArtifactsForServiceActionOutput(
        provisioningArtifactViews: json.containsKey('ProvisioningArtifactViews')
            ? (json['ProvisioningArtifactViews'] as List)
                .map((e) => ProvisioningArtifactView.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListProvisioningArtifactsOutput {
  /// Information about the provisioning artifacts.
  final List<ProvisioningArtifactDetail> provisioningArtifactDetails;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListProvisioningArtifactsOutput({
    this.provisioningArtifactDetails,
    this.nextPageToken,
  });
  static ListProvisioningArtifactsOutput fromJson(Map<String, dynamic> json) =>
      ListProvisioningArtifactsOutput(
        provisioningArtifactDetails:
            json.containsKey('ProvisioningArtifactDetails')
                ? (json['ProvisioningArtifactDetails'] as List)
                    .map((e) => ProvisioningArtifactDetail.fromJson(e))
                    .toList()
                : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListRecordHistoryOutput {
  /// The records, in reverse chronological order.
  final List<RecordDetail> recordDetails;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListRecordHistoryOutput({
    this.recordDetails,
    this.nextPageToken,
  });
  static ListRecordHistoryOutput fromJson(Map<String, dynamic> json) =>
      ListRecordHistoryOutput(
        recordDetails: json.containsKey('RecordDetails')
            ? (json['RecordDetails'] as List)
                .map((e) => RecordDetail.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

/// The search filter to use when listing history records.
class ListRecordHistorySearchFilter {
  /// The filter key.
  ///
  /// *    `product` - Filter results based on the specified product identifier.
  ///
  /// *    `provisionedproduct` - Filter results based on the provisioned
  /// product identifier.
  final String key;

  /// The filter value.
  final String value;

  ListRecordHistorySearchFilter({
    this.key,
    this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListResourcesForTagOptionOutput {
  /// Information about the resources.
  final List<ResourceDetail> resourceDetails;

  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  final String pageToken;

  ListResourcesForTagOptionOutput({
    this.resourceDetails,
    this.pageToken,
  });
  static ListResourcesForTagOptionOutput fromJson(Map<String, dynamic> json) =>
      ListResourcesForTagOptionOutput(
        resourceDetails: json.containsKey('ResourceDetails')
            ? (json['ResourceDetails'] as List)
                .map((e) => ResourceDetail.fromJson(e))
                .toList()
            : null,
        pageToken:
            json.containsKey('PageToken') ? json['PageToken'] as String : null,
      );
}

class ListServiceActionsForProvisioningArtifactOutput {
  /// An object containing information about the self-service actions associated
  /// with the provisioning artifact.
  final List<ServiceActionSummary> serviceActionSummaries;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListServiceActionsForProvisioningArtifactOutput({
    this.serviceActionSummaries,
    this.nextPageToken,
  });
  static ListServiceActionsForProvisioningArtifactOutput fromJson(
          Map<String, dynamic> json) =>
      ListServiceActionsForProvisioningArtifactOutput(
        serviceActionSummaries: json.containsKey('ServiceActionSummaries')
            ? (json['ServiceActionSummaries'] as List)
                .map((e) => ServiceActionSummary.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListServiceActionsOutput {
  /// An object containing information about the service actions associated with
  /// the provisioning artifact.
  final List<ServiceActionSummary> serviceActionSummaries;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListServiceActionsOutput({
    this.serviceActionSummaries,
    this.nextPageToken,
  });
  static ListServiceActionsOutput fromJson(Map<String, dynamic> json) =>
      ListServiceActionsOutput(
        serviceActionSummaries: json.containsKey('ServiceActionSummaries')
            ? (json['ServiceActionSummaries'] as List)
                .map((e) => ServiceActionSummary.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class ListStackInstancesForProvisionedProductOutput {
  /// List of stack instances.
  final List<StackInstance> stackInstances;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ListStackInstancesForProvisionedProductOutput({
    this.stackInstances,
    this.nextPageToken,
  });
  static ListStackInstancesForProvisionedProductOutput fromJson(
          Map<String, dynamic> json) =>
      ListStackInstancesForProvisionedProductOutput(
        stackInstances: json.containsKey('StackInstances')
            ? (json['StackInstances'] as List)
                .map((e) => StackInstance.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

/// Filters to use when listing TagOptions.
class ListTagOptionsFilters {
  /// The TagOption key.
  final String key;

  /// The TagOption value.
  final String value;

  /// The active state.
  final bool active;

  ListTagOptionsFilters({
    this.key,
    this.value,
    this.active,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListTagOptionsOutput {
  /// Information about the TagOptions.
  final List<TagOptionDetail> tagOptionDetails;

  /// The page token for the next set of results. To retrieve the first set of
  /// results, use null.
  final String pageToken;

  ListTagOptionsOutput({
    this.tagOptionDetails,
    this.pageToken,
  });
  static ListTagOptionsOutput fromJson(Map<String, dynamic> json) =>
      ListTagOptionsOutput(
        tagOptionDetails: json.containsKey('TagOptionDetails')
            ? (json['TagOptionDetails'] as List)
                .map((e) => TagOptionDetail.fromJson(e))
                .toList()
            : null,
        pageToken:
            json.containsKey('PageToken') ? json['PageToken'] as String : null,
      );
}

/// Information about the organization node.
class OrganizationNode {
  /// The organization node type.
  final String type;

  /// The identifier of the organization node.
  final String value;

  OrganizationNode({
    this.type,
    this.value,
  });
  static OrganizationNode fromJson(Map<String, dynamic> json) =>
      OrganizationNode(
        type: json.containsKey('Type') ? json['Type'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The constraints that the administrator has put on the parameter.
class ParameterConstraints {
  /// The values that the administrator has allowed for the parameter.
  final List<String> allowedValues;

  ParameterConstraints({
    this.allowedValues,
  });
  static ParameterConstraints fromJson(Map<String, dynamic> json) =>
      ParameterConstraints(
        allowedValues: json.containsKey('AllowedValues')
            ? (json['AllowedValues'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// Information about a portfolio.
class PortfolioDetail {
  /// The portfolio identifier.
  final String id;

  /// The ARN assigned to the portfolio.
  final String arn;

  /// The name to use for display purposes.
  final String displayName;

  /// The description of the portfolio.
  final String description;

  /// The UTC time stamp of the creation time.
  final DateTime createdTime;

  /// The name of the portfolio provider.
  final String providerName;

  PortfolioDetail({
    this.id,
    this.arn,
    this.displayName,
    this.description,
    this.createdTime,
    this.providerName,
  });
  static PortfolioDetail fromJson(Map<String, dynamic> json) => PortfolioDetail(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        arn: json.containsKey('ARN') ? json['ARN'] as String : null,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
        providerName: json.containsKey('ProviderName')
            ? json['ProviderName'] as String
            : null,
      );
}

/// Information about a principal.
class Principal {
  /// The ARN of the principal (IAM user, role, or group).
  final String principalArn;

  /// The principal type. The supported value is `IAM`.
  final String principalType;

  Principal({
    this.principalArn,
    this.principalType,
  });
  static Principal fromJson(Map<String, dynamic> json) => Principal(
        principalArn: json.containsKey('PrincipalARN')
            ? json['PrincipalARN'] as String
            : null,
        principalType: json.containsKey('PrincipalType')
            ? json['PrincipalType'] as String
            : null,
      );
}

/// A single product view aggregation value/count pair, containing metadata
/// about each product to which the calling user has access.
class ProductViewAggregationValue {
  /// The value of the product view aggregation.
  final String value;

  /// An approximate count of the products that match the value.
  final int approximateCount;

  ProductViewAggregationValue({
    this.value,
    this.approximateCount,
  });
  static ProductViewAggregationValue fromJson(Map<String, dynamic> json) =>
      ProductViewAggregationValue(
        value: json.containsKey('Value') ? json['Value'] as String : null,
        approximateCount: json.containsKey('ApproximateCount')
            ? json['ApproximateCount'] as int
            : null,
      );
}

/// Information about a product view.
class ProductViewDetail {
  /// Summary information about the product view.
  final ProductViewSummary productViewSummary;

  /// The status of the product.
  ///
  /// *    `AVAILABLE` - The product is ready for use.
  ///
  /// *    `CREATING` - Product creation has started; the product is not ready
  /// for use.
  ///
  /// *    `FAILED` - An action failed.
  final String status;

  /// The ARN of the product.
  final String productArn;

  /// The UTC time stamp of the creation time.
  final DateTime createdTime;

  ProductViewDetail({
    this.productViewSummary,
    this.status,
    this.productArn,
    this.createdTime,
  });
  static ProductViewDetail fromJson(Map<String, dynamic> json) =>
      ProductViewDetail(
        productViewSummary: json.containsKey('ProductViewSummary')
            ? ProductViewSummary.fromJson(json['ProductViewSummary'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        productArn: json.containsKey('ProductARN')
            ? json['ProductARN'] as String
            : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
      );
}

/// Summary information about a product view.
class ProductViewSummary {
  /// The product view identifier.
  final String id;

  /// The product identifier.
  final String productId;

  /// The name of the product.
  final String name;

  /// The owner of the product. Contact the product administrator for the
  /// significance of this value.
  final String owner;

  /// Short description of the product.
  final String shortDescription;

  /// The product type. Contact the product administrator for the significance
  /// of this value. If this value is `MARKETPLACE`, the product was created by
  /// AWS Marketplace.
  final String type;

  /// The distributor of the product. Contact the product administrator for the
  /// significance of this value.
  final String distributor;

  /// Indicates whether the product has a default path. If the product does not
  /// have a default path, call ListLaunchPaths to disambiguate between paths.
  /// Otherwise, ListLaunchPaths is not required, and the output of
  /// ProductViewSummary can be used directly with
  /// DescribeProvisioningParameters.
  final bool hasDefaultPath;

  /// The email contact information to obtain support for this Product.
  final String supportEmail;

  /// The description of the support for this Product.
  final String supportDescription;

  /// The URL information to obtain support for this Product.
  final String supportUrl;

  ProductViewSummary({
    this.id,
    this.productId,
    this.name,
    this.owner,
    this.shortDescription,
    this.type,
    this.distributor,
    this.hasDefaultPath,
    this.supportEmail,
    this.supportDescription,
    this.supportUrl,
  });
  static ProductViewSummary fromJson(Map<String, dynamic> json) =>
      ProductViewSummary(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        productId:
            json.containsKey('ProductId') ? json['ProductId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        owner: json.containsKey('Owner') ? json['Owner'] as String : null,
        shortDescription: json.containsKey('ShortDescription')
            ? json['ShortDescription'] as String
            : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        distributor: json.containsKey('Distributor')
            ? json['Distributor'] as String
            : null,
        hasDefaultPath: json.containsKey('HasDefaultPath')
            ? json['HasDefaultPath'] as bool
            : null,
        supportEmail: json.containsKey('SupportEmail')
            ? json['SupportEmail'] as String
            : null,
        supportDescription: json.containsKey('SupportDescription')
            ? json['SupportDescription'] as String
            : null,
        supportUrl: json.containsKey('SupportUrl')
            ? json['SupportUrl'] as String
            : null,
      );
}

class ProvisionProductOutput {
  /// Information about the result of provisioning the product.
  final RecordDetail recordDetail;

  ProvisionProductOutput({
    this.recordDetail,
  });
  static ProvisionProductOutput fromJson(Map<String, dynamic> json) =>
      ProvisionProductOutput(
        recordDetail: json.containsKey('RecordDetail')
            ? RecordDetail.fromJson(json['RecordDetail'])
            : null,
      );
}

/// Information about a provisioned product.
class ProvisionedProductAttribute {
  /// The user-friendly name of the provisioned product.
  final String name;

  /// The ARN of the provisioned product.
  final String arn;

  /// The type of provisioned product. The supported values are `CFN_STACK` and
  /// `CFN_STACKSET`.
  final String type;

  /// The identifier of the provisioned product.
  final String id;

  /// The current status of the provisioned product.
  ///
  /// *    `AVAILABLE` - Stable state, ready to perform any operation. The most
  /// recent operation succeeded and completed.
  ///
  /// *    `UNDER_CHANGE` - Transitive state. Operations performed might not
  /// have valid results. Wait for an `AVAILABLE` status before performing
  /// operations.
  ///
  /// *    `TAINTED` - Stable state, ready to perform any operation. The stack
  /// has completed the requested operation but is not exactly what was
  /// requested. For example, a request to update to a new version failed and
  /// the stack rolled back to the current version.
  ///
  /// *    `ERROR` - An unexpected error occurred. The provisioned product
  /// exists but the stack is not running. For example, CloudFormation received
  /// a parameter value that was not valid and could not launch the stack.
  ///
  /// *    `PLAN_IN_PROGRESS` - Transitive state. The plan operations were
  /// performed to provision a new product, but resources have not yet been
  /// created. After reviewing the list of resources to be created, execute the
  /// plan. Wait for an `AVAILABLE` status before performing operations.
  final String status;

  /// The current status message of the provisioned product.
  final String statusMessage;

  /// The UTC time stamp of the creation time.
  final DateTime createdTime;

  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  final String idempotencyToken;

  /// The record identifier of the last request performed on this provisioned
  /// product.
  final String lastRecordId;

  /// One or more tags.
  final List<Tag> tags;

  /// The assigned identifier for the resource, such as an EC2 instance ID or an
  /// S3 bucket name.
  final String physicalId;

  /// The product identifier.
  final String productId;

  /// The identifier of the provisioning artifact.
  final String provisioningArtifactId;

  /// The Amazon Resource Name (ARN) of the IAM user.
  final String userArn;

  /// The ARN of the IAM user in the session. This ARN might contain a session
  /// ID.
  final String userArnSession;

  ProvisionedProductAttribute({
    this.name,
    this.arn,
    this.type,
    this.id,
    this.status,
    this.statusMessage,
    this.createdTime,
    this.idempotencyToken,
    this.lastRecordId,
    this.tags,
    this.physicalId,
    this.productId,
    this.provisioningArtifactId,
    this.userArn,
    this.userArnSession,
  });
  static ProvisionedProductAttribute fromJson(Map<String, dynamic> json) =>
      ProvisionedProductAttribute(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusMessage: json.containsKey('StatusMessage')
            ? json['StatusMessage'] as String
            : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
        idempotencyToken: json.containsKey('IdempotencyToken')
            ? json['IdempotencyToken'] as String
            : null,
        lastRecordId: json.containsKey('LastRecordId')
            ? json['LastRecordId'] as String
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        physicalId: json.containsKey('PhysicalId')
            ? json['PhysicalId'] as String
            : null,
        productId:
            json.containsKey('ProductId') ? json['ProductId'] as String : null,
        provisioningArtifactId: json.containsKey('ProvisioningArtifactId')
            ? json['ProvisioningArtifactId'] as String
            : null,
        userArn: json.containsKey('UserArn') ? json['UserArn'] as String : null,
        userArnSession: json.containsKey('UserArnSession')
            ? json['UserArnSession'] as String
            : null,
      );
}

/// Information about a provisioned product.
class ProvisionedProductDetail {
  /// The user-friendly name of the provisioned product.
  final String name;

  /// The ARN of the provisioned product.
  final String arn;

  /// The type of provisioned product. The supported values are `CFN_STACK` and
  /// `CFN_STACKSET`.
  final String type;

  /// The identifier of the provisioned product.
  final String id;

  /// The current status of the provisioned product.
  ///
  /// *    `AVAILABLE` - Stable state, ready to perform any operation. The most
  /// recent operation succeeded and completed.
  ///
  /// *    `UNDER_CHANGE` - Transitive state. Operations performed might not
  /// have valid results. Wait for an `AVAILABLE` status before performing
  /// operations.
  ///
  /// *    `TAINTED` - Stable state, ready to perform any operation. The stack
  /// has completed the requested operation but is not exactly what was
  /// requested. For example, a request to update to a new version failed and
  /// the stack rolled back to the current version.
  ///
  /// *    `ERROR` - An unexpected error occurred. The provisioned product
  /// exists but the stack is not running. For example, CloudFormation received
  /// a parameter value that was not valid and could not launch the stack.
  ///
  /// *    `PLAN_IN_PROGRESS` - Transitive state. The plan operations were
  /// performed to provision a new product, but resources have not yet been
  /// created. After reviewing the list of resources to be created, execute the
  /// plan. Wait for an `AVAILABLE` status before performing operations.
  final String status;

  /// The current status message of the provisioned product.
  final String statusMessage;

  /// The UTC time stamp of the creation time.
  final DateTime createdTime;

  /// A unique identifier that you provide to ensure idempotency. If multiple
  /// requests differ only by the idempotency token, the same response is
  /// returned for each repeated request.
  final String idempotencyToken;

  /// The record identifier of the last request performed on this provisioned
  /// product.
  final String lastRecordId;

  /// The product identifier. For example, `prod-abcdzk7xy33qa`.
  final String productId;

  /// The identifier of the provisioning artifact. For example,
  /// `pa-4abcdjnxjj6ne`.
  final String provisioningArtifactId;

  ProvisionedProductDetail({
    this.name,
    this.arn,
    this.type,
    this.id,
    this.status,
    this.statusMessage,
    this.createdTime,
    this.idempotencyToken,
    this.lastRecordId,
    this.productId,
    this.provisioningArtifactId,
  });
  static ProvisionedProductDetail fromJson(Map<String, dynamic> json) =>
      ProvisionedProductDetail(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusMessage: json.containsKey('StatusMessage')
            ? json['StatusMessage'] as String
            : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
        idempotencyToken: json.containsKey('IdempotencyToken')
            ? json['IdempotencyToken'] as String
            : null,
        lastRecordId: json.containsKey('LastRecordId')
            ? json['LastRecordId'] as String
            : null,
        productId:
            json.containsKey('ProductId') ? json['ProductId'] as String : null,
        provisioningArtifactId: json.containsKey('ProvisioningArtifactId')
            ? json['ProvisioningArtifactId'] as String
            : null,
      );
}

/// Information about a plan.
class ProvisionedProductPlanDetails {
  /// The UTC time stamp of the creation time.
  final DateTime createdTime;

  /// The path identifier of the product. This value is optional if the product
  /// has a default path, and required if the product has more than one path. To
  /// list the paths for a product, use ListLaunchPaths.
  final String pathId;

  /// The product identifier.
  final String productId;

  /// The name of the plan.
  final String planName;

  /// The plan identifier.
  final String planId;

  /// The product identifier.
  final String provisionProductId;

  /// The user-friendly name of the provisioned product.
  final String provisionProductName;

  /// The plan type.
  final String planType;

  /// The identifier of the provisioning artifact.
  final String provisioningArtifactId;

  /// The status.
  final String status;

  /// The time when the plan was last updated.
  final DateTime updatedTime;

  /// Passed to CloudFormation. The SNS topic ARNs to which to publish
  /// stack-related events.
  final List<String> notificationArns;

  /// Parameters specified by the administrator that are required for
  /// provisioning the product.
  final List<UpdateProvisioningParameter> provisioningParameters;

  /// One or more tags.
  final List<Tag> tags;

  /// The status message.
  final String statusMessage;

  ProvisionedProductPlanDetails({
    this.createdTime,
    this.pathId,
    this.productId,
    this.planName,
    this.planId,
    this.provisionProductId,
    this.provisionProductName,
    this.planType,
    this.provisioningArtifactId,
    this.status,
    this.updatedTime,
    this.notificationArns,
    this.provisioningParameters,
    this.tags,
    this.statusMessage,
  });
  static ProvisionedProductPlanDetails fromJson(Map<String, dynamic> json) =>
      ProvisionedProductPlanDetails(
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
        pathId: json.containsKey('PathId') ? json['PathId'] as String : null,
        productId:
            json.containsKey('ProductId') ? json['ProductId'] as String : null,
        planName:
            json.containsKey('PlanName') ? json['PlanName'] as String : null,
        planId: json.containsKey('PlanId') ? json['PlanId'] as String : null,
        provisionProductId: json.containsKey('ProvisionProductId')
            ? json['ProvisionProductId'] as String
            : null,
        provisionProductName: json.containsKey('ProvisionProductName')
            ? json['ProvisionProductName'] as String
            : null,
        planType:
            json.containsKey('PlanType') ? json['PlanType'] as String : null,
        provisioningArtifactId: json.containsKey('ProvisioningArtifactId')
            ? json['ProvisioningArtifactId'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        updatedTime: json.containsKey('UpdatedTime')
            ? DateTime.parse(json['UpdatedTime'])
            : null,
        notificationArns: json.containsKey('NotificationArns')
            ? (json['NotificationArns'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        provisioningParameters: json.containsKey('ProvisioningParameters')
            ? (json['ProvisioningParameters'] as List)
                .map((e) => UpdateProvisioningParameter.fromJson(e))
                .toList()
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        statusMessage: json.containsKey('StatusMessage')
            ? json['StatusMessage'] as String
            : null,
      );
}

/// Summary information about a plan.
class ProvisionedProductPlanSummary {
  /// The name of the plan.
  final String planName;

  /// The plan identifier.
  final String planId;

  /// The product identifier.
  final String provisionProductId;

  /// The user-friendly name of the provisioned product.
  final String provisionProductName;

  /// The plan type.
  final String planType;

  /// The identifier of the provisioning artifact.
  final String provisioningArtifactId;

  ProvisionedProductPlanSummary({
    this.planName,
    this.planId,
    this.provisionProductId,
    this.provisionProductName,
    this.planType,
    this.provisioningArtifactId,
  });
  static ProvisionedProductPlanSummary fromJson(Map<String, dynamic> json) =>
      ProvisionedProductPlanSummary(
        planName:
            json.containsKey('PlanName') ? json['PlanName'] as String : null,
        planId: json.containsKey('PlanId') ? json['PlanId'] as String : null,
        provisionProductId: json.containsKey('ProvisionProductId')
            ? json['ProvisionProductId'] as String
            : null,
        provisionProductName: json.containsKey('ProvisionProductName')
            ? json['ProvisionProductName'] as String
            : null,
        planType:
            json.containsKey('PlanType') ? json['PlanType'] as String : null,
        provisioningArtifactId: json.containsKey('ProvisioningArtifactId')
            ? json['ProvisioningArtifactId'] as String
            : null,
      );
}

/// Information about a provisioning artifact. A provisioning artifact is also
/// known as a product version.
class ProvisioningArtifact {
  /// The identifier of the provisioning artifact.
  final String id;

  /// The name of the provisioning artifact.
  final String name;

  /// The description of the provisioning artifact.
  final String description;

  /// The UTC time stamp of the creation time.
  final DateTime createdTime;

  /// Information set by the administrator to provide guidance to end users
  /// about which provisioning artifacts to use.
  final String guidance;

  ProvisioningArtifact({
    this.id,
    this.name,
    this.description,
    this.createdTime,
    this.guidance,
  });
  static ProvisioningArtifact fromJson(Map<String, dynamic> json) =>
      ProvisioningArtifact(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
        guidance:
            json.containsKey('Guidance') ? json['Guidance'] as String : null,
      );
}

/// Information about a provisioning artifact (also known as a version) for a
/// product.
class ProvisioningArtifactDetail {
  /// The identifier of the provisioning artifact.
  final String id;

  /// The name of the provisioning artifact.
  final String name;

  /// The description of the provisioning artifact.
  final String description;

  /// The type of provisioning artifact.
  ///
  /// *    `CLOUD_FORMATION_TEMPLATE` - AWS CloudFormation template
  ///
  /// *    `MARKETPLACE_AMI` - AWS Marketplace AMI
  ///
  /// *    `MARKETPLACE_CAR` - AWS Marketplace Clusters and AWS Resources
  final String type;

  /// The UTC time stamp of the creation time.
  final DateTime createdTime;

  /// Indicates whether the product version is active.
  final bool active;

  /// Information set by the administrator to provide guidance to end users
  /// about which provisioning artifacts to use.
  final String guidance;

  ProvisioningArtifactDetail({
    this.id,
    this.name,
    this.description,
    this.type,
    this.createdTime,
    this.active,
    this.guidance,
  });
  static ProvisioningArtifactDetail fromJson(Map<String, dynamic> json) =>
      ProvisioningArtifactDetail(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
        active: json.containsKey('Active') ? json['Active'] as bool : null,
        guidance:
            json.containsKey('Guidance') ? json['Guidance'] as String : null,
      );
}

/// Information about a parameter used to provision a product.
class ProvisioningArtifactParameter {
  /// The parameter key.
  final String parameterKey;

  /// The default value.
  final String defaultValue;

  /// The parameter type.
  final String parameterType;

  /// If this value is true, the value for this parameter is obfuscated from
  /// view when the parameter is retrieved. This parameter is used to hide
  /// sensitive information.
  final bool isNoEcho;

  /// The description of the parameter.
  final String description;

  /// Constraints that the administrator has put on a parameter.
  final ParameterConstraints parameterConstraints;

  ProvisioningArtifactParameter({
    this.parameterKey,
    this.defaultValue,
    this.parameterType,
    this.isNoEcho,
    this.description,
    this.parameterConstraints,
  });
  static ProvisioningArtifactParameter fromJson(Map<String, dynamic> json) =>
      ProvisioningArtifactParameter(
        parameterKey: json.containsKey('ParameterKey')
            ? json['ParameterKey'] as String
            : null,
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        parameterType: json.containsKey('ParameterType')
            ? json['ParameterType'] as String
            : null,
        isNoEcho:
            json.containsKey('IsNoEcho') ? json['IsNoEcho'] as bool : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        parameterConstraints: json.containsKey('ParameterConstraints')
            ? ParameterConstraints.fromJson(json['ParameterConstraints'])
            : null,
      );
}

/// The user-defined preferences that will be applied during product
/// provisioning, unless overridden by `ProvisioningPreferences` or
/// `UpdateProvisioningPreferences`.
///
/// For more information on maximum concurrent accounts and failure tolerance,
/// see
/// [Stack set operation options](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options)
/// in the _AWS CloudFormation User Guide_.
class ProvisioningArtifactPreferences {
  /// One or more AWS accounts where stack instances are deployed from the stack
  /// set. These accounts can be scoped in
  /// `ProvisioningPreferences$StackSetAccounts` and
  /// `UpdateProvisioningPreferences$StackSetAccounts`.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  final List<String> stackSetAccounts;

  /// One or more AWS Regions where stack instances are deployed from the stack
  /// set. These regions can be scoped in
  /// `ProvisioningPreferences$StackSetRegions` and
  /// `UpdateProvisioningPreferences$StackSetRegions`.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  final List<String> stackSetRegions;

  ProvisioningArtifactPreferences({
    this.stackSetAccounts,
    this.stackSetRegions,
  });
  static ProvisioningArtifactPreferences fromJson(Map<String, dynamic> json) =>
      ProvisioningArtifactPreferences(
        stackSetAccounts: json.containsKey('StackSetAccounts')
            ? (json['StackSetAccounts'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        stackSetRegions: json.containsKey('StackSetRegions')
            ? (json['StackSetRegions'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// Information about a provisioning artifact (also known as a version) for a
/// product.
class ProvisioningArtifactProperties {
  /// The name of the provisioning artifact (for example, v1 v2beta). No spaces
  /// are allowed.
  final String name;

  /// The description of the provisioning artifact, including how it differs
  /// from the previous provisioning artifact.
  final String description;

  /// The URL of the CloudFormation template in Amazon S3. Specify the URL in
  /// JSON format as follows:
  ///
  ///  `"LoadTemplateFromURL":
  /// "https://s3.amazonaws.com/cf-templates-ozkq9d3hgiq2-us-east-1/..."`
  final Map<String, String> info;

  /// The type of provisioning artifact.
  ///
  /// *    `CLOUD_FORMATION_TEMPLATE` - AWS CloudFormation template
  ///
  /// *    `MARKETPLACE_AMI` - AWS Marketplace AMI
  ///
  /// *    `MARKETPLACE_CAR` - AWS Marketplace Clusters and AWS Resources
  final String type;

  /// If set to true, AWS Service Catalog stops validating the specified
  /// provisioning artifact even if it is invalid.
  final bool disableTemplateValidation;

  ProvisioningArtifactProperties({
    this.name,
    this.description,
    @required this.info,
    this.type,
    this.disableTemplateValidation,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Summary information about a provisioning artifact (also known as a version)
/// for a product.
class ProvisioningArtifactSummary {
  /// The identifier of the provisioning artifact.
  final String id;

  /// The name of the provisioning artifact.
  final String name;

  /// The description of the provisioning artifact.
  final String description;

  /// The UTC time stamp of the creation time.
  final DateTime createdTime;

  /// The metadata for the provisioning artifact. This is used with AWS
  /// Marketplace products.
  final Map<String, String> provisioningArtifactMetadata;

  ProvisioningArtifactSummary({
    this.id,
    this.name,
    this.description,
    this.createdTime,
    this.provisioningArtifactMetadata,
  });
  static ProvisioningArtifactSummary fromJson(Map<String, dynamic> json) =>
      ProvisioningArtifactSummary(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
        provisioningArtifactMetadata:
            json.containsKey('ProvisioningArtifactMetadata')
                ? (json['ProvisioningArtifactMetadata'] as Map)
                    .map((k, v) => MapEntry(k as String, v as String))
                : null,
      );
}

/// An object that contains summary information about a product view and a
/// provisioning artifact.
class ProvisioningArtifactView {
  /// Summary information about a product view.
  final ProductViewSummary productViewSummary;

  /// Information about a provisioning artifact. A provisioning artifact is also
  /// known as a product version.
  final ProvisioningArtifact provisioningArtifact;

  ProvisioningArtifactView({
    this.productViewSummary,
    this.provisioningArtifact,
  });
  static ProvisioningArtifactView fromJson(Map<String, dynamic> json) =>
      ProvisioningArtifactView(
        productViewSummary: json.containsKey('ProductViewSummary')
            ? ProductViewSummary.fromJson(json['ProductViewSummary'])
            : null,
        provisioningArtifact: json.containsKey('ProvisioningArtifact')
            ? ProvisioningArtifact.fromJson(json['ProvisioningArtifact'])
            : null,
      );
}

/// Information about a parameter used to provision a product.
class ProvisioningParameter {
  /// The parameter key.
  final String key;

  /// The parameter value.
  final String value;

  ProvisioningParameter({
    this.key,
    this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The user-defined preferences that will be applied when updating a
/// provisioned product. Not all preferences are applicable to all provisioned
/// product types.
class ProvisioningPreferences {
  /// One or more AWS accounts that will have access to the provisioned product.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  ///
  /// The AWS accounts specified should be within the list of accounts in the
  /// `STACKSET` constraint. To get the list of accounts in the `STACKSET`
  /// constraint, use the `DescribeProvisioningParameters` operation.
  ///
  /// If no values are specified, the default value is all accounts from the
  /// `STACKSET` constraint.
  final List<String> stackSetAccounts;

  /// One or more AWS Regions where the provisioned product will be available.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  ///
  /// The specified regions should be within the list of regions from the
  /// `STACKSET` constraint. To get the list of regions in the `STACKSET`
  /// constraint, use the `DescribeProvisioningParameters` operation.
  ///
  /// If no values are specified, the default value is all regions from the
  /// `STACKSET` constraint.
  final List<String> stackSetRegions;

  /// The number of accounts, per region, for which this operation can fail
  /// before AWS Service Catalog stops the operation in that region. If the
  /// operation is stopped in a region, AWS Service Catalog doesn't attempt the
  /// operation in any subsequent regions.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  ///
  /// Conditional: You must specify either `StackSetFailureToleranceCount` or
  /// `StackSetFailureTolerancePercentage`, but not both.
  ///
  /// The default value is `0` if no value is specified.
  final int stackSetFailureToleranceCount;

  /// The percentage of accounts, per region, for which this stack operation can
  /// fail before AWS Service Catalog stops the operation in that region. If the
  /// operation is stopped in a region, AWS Service Catalog doesn't attempt the
  /// operation in any subsequent regions.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// AWS Service Catalog rounds down to the next whole number.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  ///
  /// Conditional: You must specify either `StackSetFailureToleranceCount` or
  /// `StackSetFailureTolerancePercentage`, but not both.
  final int stackSetFailureTolerancePercentage;

  /// The maximum number of accounts in which to perform this operation at one
  /// time. This is dependent on the value of `StackSetFailureToleranceCount`.
  /// `StackSetMaxConcurrentCount` is at most one more than the
  /// `StackSetFailureToleranceCount`.
  ///
  /// Note that this setting lets you specify the maximum for operations. For
  /// large deployments, under certain circumstances the actual number of
  /// accounts acted upon concurrently may be lower due to service throttling.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  ///
  /// Conditional: You must specify either `StackSetMaxConcurrentCount` or
  /// `StackSetMaxConcurrentPercentage`, but not both.
  final int stackSetMaxConcurrencyCount;

  /// The maximum percentage of accounts in which to perform this operation at
  /// one time.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// AWS Service Catalog rounds down to the next whole number. This is true
  /// except in cases where rounding down would result is zero. In this case,
  /// AWS Service Catalog sets the number as `1` instead.
  ///
  /// Note that this setting lets you specify the maximum for operations. For
  /// large deployments, under certain circumstances the actual number of
  /// accounts acted upon concurrently may be lower due to service throttling.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  ///
  /// Conditional: You must specify either `StackSetMaxConcurrentCount` or
  /// `StackSetMaxConcurrentPercentage`, but not both.
  final int stackSetMaxConcurrencyPercentage;

  ProvisioningPreferences({
    this.stackSetAccounts,
    this.stackSetRegions,
    this.stackSetFailureToleranceCount,
    this.stackSetFailureTolerancePercentage,
    this.stackSetMaxConcurrencyCount,
    this.stackSetMaxConcurrencyPercentage,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about a request operation.
class RecordDetail {
  /// The identifier of the record.
  final String recordId;

  /// The user-friendly name of the provisioned product.
  final String provisionedProductName;

  /// The status of the provisioned product.
  ///
  /// *    `CREATED` - The request was created but the operation has not
  /// started.
  ///
  /// *    `IN_PROGRESS` - The requested operation is in progress.
  ///
  /// *    `IN_PROGRESS_IN_ERROR` - The provisioned product is under change but
  /// the requested operation failed and some remediation is occurring. For
  /// example, a rollback.
  ///
  /// *    `SUCCEEDED` - The requested operation has successfully completed.
  ///
  /// *    `FAILED` - The requested operation has unsuccessfully completed.
  /// Investigate using the error messages returned.
  final String status;

  /// The UTC time stamp of the creation time.
  final DateTime createdTime;

  /// The time when the record was last updated.
  final DateTime updatedTime;

  /// The type of provisioned product. The supported values are `CFN_STACK` and
  /// `CFN_STACKSET`.
  final String provisionedProductType;

  /// The record type.
  ///
  /// *    `PROVISION_PRODUCT`
  ///
  /// *    `UPDATE_PROVISIONED_PRODUCT`
  ///
  /// *    `TERMINATE_PROVISIONED_PRODUCT`
  final String recordType;

  /// The identifier of the provisioned product.
  final String provisionedProductId;

  /// The product identifier.
  final String productId;

  /// The identifier of the provisioning artifact.
  final String provisioningArtifactId;

  /// The path identifier.
  final String pathId;

  /// The errors that occurred.
  final List<RecordError> recordErrors;

  /// One or more tags.
  final List<RecordTag> recordTags;

  RecordDetail({
    this.recordId,
    this.provisionedProductName,
    this.status,
    this.createdTime,
    this.updatedTime,
    this.provisionedProductType,
    this.recordType,
    this.provisionedProductId,
    this.productId,
    this.provisioningArtifactId,
    this.pathId,
    this.recordErrors,
    this.recordTags,
  });
  static RecordDetail fromJson(Map<String, dynamic> json) => RecordDetail(
        recordId:
            json.containsKey('RecordId') ? json['RecordId'] as String : null,
        provisionedProductName: json.containsKey('ProvisionedProductName')
            ? json['ProvisionedProductName'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
        updatedTime: json.containsKey('UpdatedTime')
            ? DateTime.parse(json['UpdatedTime'])
            : null,
        provisionedProductType: json.containsKey('ProvisionedProductType')
            ? json['ProvisionedProductType'] as String
            : null,
        recordType: json.containsKey('RecordType')
            ? json['RecordType'] as String
            : null,
        provisionedProductId: json.containsKey('ProvisionedProductId')
            ? json['ProvisionedProductId'] as String
            : null,
        productId:
            json.containsKey('ProductId') ? json['ProductId'] as String : null,
        provisioningArtifactId: json.containsKey('ProvisioningArtifactId')
            ? json['ProvisioningArtifactId'] as String
            : null,
        pathId: json.containsKey('PathId') ? json['PathId'] as String : null,
        recordErrors: json.containsKey('RecordErrors')
            ? (json['RecordErrors'] as List)
                .map((e) => RecordError.fromJson(e))
                .toList()
            : null,
        recordTags: json.containsKey('RecordTags')
            ? (json['RecordTags'] as List)
                .map((e) => RecordTag.fromJson(e))
                .toList()
            : null,
      );
}

/// The error code and description resulting from an operation.
class RecordError {
  /// The numeric value of the error.
  final String code;

  /// The description of the error.
  final String description;

  RecordError({
    this.code,
    this.description,
  });
  static RecordError fromJson(Map<String, dynamic> json) => RecordError(
        code: json.containsKey('Code') ? json['Code'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

/// The output for the product created as the result of a request. For example,
/// the output for a CloudFormation-backed product that creates an S3 bucket
/// would include the S3 bucket URL.
class RecordOutput {
  /// The output key.
  final String outputKey;

  /// The output value.
  final String outputValue;

  /// The description of the output.
  final String description;

  RecordOutput({
    this.outputKey,
    this.outputValue,
    this.description,
  });
  static RecordOutput fromJson(Map<String, dynamic> json) => RecordOutput(
        outputKey:
            json.containsKey('OutputKey') ? json['OutputKey'] as String : null,
        outputValue: json.containsKey('OutputValue')
            ? json['OutputValue'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

/// Information about a tag, which is a key-value pair.
class RecordTag {
  /// The key for this tag.
  final String key;

  /// The value for this tag.
  final String value;

  RecordTag({
    this.key,
    this.value,
  });
  static RecordTag fromJson(Map<String, dynamic> json) => RecordTag(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
}

class RejectPortfolioShareOutput {
  RejectPortfolioShareOutput();
  static RejectPortfolioShareOutput fromJson(Map<String, dynamic> json) =>
      RejectPortfolioShareOutput();
}

/// Information about a resource change that will occur when a plan is executed.
class ResourceChange {
  /// The change action.
  final String action;

  /// The ID of the resource, as defined in the CloudFormation template.
  final String logicalResourceId;

  /// The ID of the resource, if it was already created.
  final String physicalResourceId;

  /// The type of resource.
  final String resourceType;

  /// If the change type is `Modify`, indicates whether the existing resource is
  /// deleted and replaced with a new one.
  final String replacement;

  /// The change scope.
  final List<String> scope;

  /// Information about the resource changes.
  final List<ResourceChangeDetail> details;

  ResourceChange({
    this.action,
    this.logicalResourceId,
    this.physicalResourceId,
    this.resourceType,
    this.replacement,
    this.scope,
    this.details,
  });
  static ResourceChange fromJson(Map<String, dynamic> json) => ResourceChange(
        action: json.containsKey('Action') ? json['Action'] as String : null,
        logicalResourceId: json.containsKey('LogicalResourceId')
            ? json['LogicalResourceId'] as String
            : null,
        physicalResourceId: json.containsKey('PhysicalResourceId')
            ? json['PhysicalResourceId'] as String
            : null,
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        replacement: json.containsKey('Replacement')
            ? json['Replacement'] as String
            : null,
        scope: json.containsKey('Scope')
            ? (json['Scope'] as List).map((e) => e as String).toList()
            : null,
        details: json.containsKey('Details')
            ? (json['Details'] as List)
                .map((e) => ResourceChangeDetail.fromJson(e))
                .toList()
            : null,
      );
}

/// Information about a change to a resource attribute.
class ResourceChangeDetail {
  /// Information about the resource attribute to be modified.
  final ResourceTargetDefinition target;

  /// For static evaluations, the value of the resource attribute will change
  /// and the new value is known. For dynamic evaluations, the value might
  /// change, and any new value will be determined when the plan is updated.
  final String evaluation;

  /// The ID of the entity that caused the change.
  final String causingEntity;

  ResourceChangeDetail({
    this.target,
    this.evaluation,
    this.causingEntity,
  });
  static ResourceChangeDetail fromJson(Map<String, dynamic> json) =>
      ResourceChangeDetail(
        target: json.containsKey('Target')
            ? ResourceTargetDefinition.fromJson(json['Target'])
            : null,
        evaluation: json.containsKey('Evaluation')
            ? json['Evaluation'] as String
            : null,
        causingEntity: json.containsKey('CausingEntity')
            ? json['CausingEntity'] as String
            : null,
      );
}

/// Information about a resource.
class ResourceDetail {
  /// The identifier of the resource.
  final String id;

  /// The ARN of the resource.
  final String arn;

  /// The name of the resource.
  final String name;

  /// The description of the resource.
  final String description;

  /// The creation time of the resource.
  final DateTime createdTime;

  ResourceDetail({
    this.id,
    this.arn,
    this.name,
    this.description,
    this.createdTime,
  });
  static ResourceDetail fromJson(Map<String, dynamic> json) => ResourceDetail(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        arn: json.containsKey('ARN') ? json['ARN'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        createdTime: json.containsKey('CreatedTime')
            ? DateTime.parse(json['CreatedTime'])
            : null,
      );
}

/// Information about a change to a resource attribute.
class ResourceTargetDefinition {
  /// The attribute to be changed.
  final String attribute;

  /// If the attribute is `Properties`, the value is the name of the property.
  /// Otherwise, the value is null.
  final String name;

  /// If the attribute is `Properties`, indicates whether a change to this
  /// property causes the resource to be re-created.
  final String requiresRecreation;

  ResourceTargetDefinition({
    this.attribute,
    this.name,
    this.requiresRecreation,
  });
  static ResourceTargetDefinition fromJson(Map<String, dynamic> json) =>
      ResourceTargetDefinition(
        attribute:
            json.containsKey('Attribute') ? json['Attribute'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        requiresRecreation: json.containsKey('RequiresRecreation')
            ? json['RequiresRecreation'] as String
            : null,
      );
}

class ScanProvisionedProductsOutput {
  /// Information about the provisioned products.
  final List<ProvisionedProductDetail> provisionedProducts;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  ScanProvisionedProductsOutput({
    this.provisionedProducts,
    this.nextPageToken,
  });
  static ScanProvisionedProductsOutput fromJson(Map<String, dynamic> json) =>
      ScanProvisionedProductsOutput(
        provisionedProducts: json.containsKey('ProvisionedProducts')
            ? (json['ProvisionedProducts'] as List)
                .map((e) => ProvisionedProductDetail.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class SearchProductsAsAdminOutput {
  /// Information about the product views.
  final List<ProductViewDetail> productViewDetails;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  SearchProductsAsAdminOutput({
    this.productViewDetails,
    this.nextPageToken,
  });
  static SearchProductsAsAdminOutput fromJson(Map<String, dynamic> json) =>
      SearchProductsAsAdminOutput(
        productViewDetails: json.containsKey('ProductViewDetails')
            ? (json['ProductViewDetails'] as List)
                .map((e) => ProductViewDetail.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class SearchProductsOutput {
  /// Information about the product views.
  final List<ProductViewSummary> productViewSummaries;

  /// The product view aggregations.
  final Map<String, List<ProductViewAggregationValue>> productViewAggregations;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  SearchProductsOutput({
    this.productViewSummaries,
    this.productViewAggregations,
    this.nextPageToken,
  });
  static SearchProductsOutput fromJson(Map<String, dynamic> json) =>
      SearchProductsOutput(
        productViewSummaries: json.containsKey('ProductViewSummaries')
            ? (json['ProductViewSummaries'] as List)
                .map((e) => ProductViewSummary.fromJson(e))
                .toList()
            : null,
        productViewAggregations: json.containsKey('ProductViewAggregations')
            ? (json['ProductViewAggregations'] as Map).map((k, v) => MapEntry(
                k as String,
                (v as List)
                    .map((e) => ProductViewAggregationValue.fromJson(e))
                    .toList()))
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

class SearchProvisionedProductsOutput {
  /// Information about the provisioned products.
  final List<ProvisionedProductAttribute> provisionedProducts;

  /// The number of provisioned products found.
  final int totalResultsCount;

  /// The page token to use to retrieve the next set of results. If there are no
  /// additional results, this value is null.
  final String nextPageToken;

  SearchProvisionedProductsOutput({
    this.provisionedProducts,
    this.totalResultsCount,
    this.nextPageToken,
  });
  static SearchProvisionedProductsOutput fromJson(Map<String, dynamic> json) =>
      SearchProvisionedProductsOutput(
        provisionedProducts: json.containsKey('ProvisionedProducts')
            ? (json['ProvisionedProducts'] as List)
                .map((e) => ProvisionedProductAttribute.fromJson(e))
                .toList()
            : null,
        totalResultsCount: json.containsKey('TotalResultsCount')
            ? json['TotalResultsCount'] as int
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
}

/// A self-service action association consisting of the Action ID, the Product
/// ID, and the Provisioning Artifact ID.
class ServiceActionAssociation {
  /// The self-service action identifier. For example, `act-fs7abcd89wxyz`.
  final String serviceActionId;

  /// The product identifier. For example, `prod-abcdzk7xy33qa`.
  final String productId;

  /// The identifier of the provisioning artifact. For example,
  /// `pa-4abcdjnxjj6ne`.
  final String provisioningArtifactId;

  ServiceActionAssociation({
    @required this.serviceActionId,
    @required this.productId,
    @required this.provisioningArtifactId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object containing detailed information about the self-service action.
class ServiceActionDetail {
  /// Summary information about the self-service action.
  final ServiceActionSummary serviceActionSummary;

  /// A map that defines the self-service action.
  final Map<String, String> definition;

  ServiceActionDetail({
    this.serviceActionSummary,
    this.definition,
  });
  static ServiceActionDetail fromJson(Map<String, dynamic> json) =>
      ServiceActionDetail(
        serviceActionSummary: json.containsKey('ServiceActionSummary')
            ? ServiceActionSummary.fromJson(json['ServiceActionSummary'])
            : null,
        definition: json.containsKey('Definition')
            ? (json['Definition'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Detailed information about the self-service action.
class ServiceActionSummary {
  /// The self-service action identifier.
  final String id;

  /// The self-service action name.
  final String name;

  /// The self-service action description.
  final String description;

  /// The self-service action definition type. For example, `SSM_AUTOMATION`.
  final String definitionType;

  ServiceActionSummary({
    this.id,
    this.name,
    this.description,
    this.definitionType,
  });
  static ServiceActionSummary fromJson(Map<String, dynamic> json) =>
      ServiceActionSummary(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        definitionType: json.containsKey('DefinitionType')
            ? json['DefinitionType'] as String
            : null,
      );
}

/// Information about the portfolio share operation.
class ShareDetails {
  /// List of accounts for whom the operation succeeded.
  final List<String> successfulShares;

  /// List of errors.
  final List<ShareError> shareErrors;

  ShareDetails({
    this.successfulShares,
    this.shareErrors,
  });
  static ShareDetails fromJson(Map<String, dynamic> json) => ShareDetails(
        successfulShares: json.containsKey('SuccessfulShares')
            ? (json['SuccessfulShares'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        shareErrors: json.containsKey('ShareErrors')
            ? (json['ShareErrors'] as List)
                .map((e) => ShareError.fromJson(e))
                .toList()
            : null,
      );
}

/// Errors that occurred during the portfolio share operation.
class ShareError {
  /// List of accounts impacted by the error.
  final List<String> accounts;

  /// Information about the error.
  final String message;

  /// Error type that happened when processing the operation.
  final String error;

  ShareError({
    this.accounts,
    this.message,
    this.error,
  });
  static ShareError fromJson(Map<String, dynamic> json) => ShareError(
        accounts: json.containsKey('Accounts')
            ? (json['Accounts'] as List).map((e) => e as String).toList()
            : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        error: json.containsKey('Error') ? json['Error'] as String : null,
      );
}

/// An AWS CloudFormation stack, in a specific account and region, that's part
/// of a stack set operation. A stack instance is a reference to an attempted or
/// actual stack in a given account within a given region. A stack instance can
/// exist without a stack—for example, if the stack couldn't be created for some
/// reason. A stack instance is associated with only one stack set. Each stack
/// instance contains the ID of its associated stack set, as well as the ID of
/// the actual stack and the stack status.
class StackInstance {
  /// The name of the AWS account that the stack instance is associated with.
  final String account;

  /// The name of the AWS region that the stack instance is associated with.
  final String region;

  /// The status of the stack instance, in terms of its synchronization with its
  /// associated stack set.
  ///
  /// *    `INOPERABLE`: A `DeleteStackInstances` operation has failed and left
  /// the stack in an unstable state. Stacks in this state are excluded from
  /// further `UpdateStackSet` operations. You might need to perform a
  /// `DeleteStackInstances` operation, with `RetainStacks` set to true, to
  /// delete the stack instance, and then delete the stack manually.
  ///
  /// *    `OUTDATED`: The stack isn't currently up to date with the stack set
  /// because either the associated stack failed during a `CreateStackSet` or
  /// `UpdateStackSet` operation, or the stack was part of a `CreateStackSet` or
  /// `UpdateStackSet` operation that failed or was stopped before the stack was
  /// created or updated.
  ///
  /// *    `CURRENT`: The stack is currently up to date with the stack set.
  final String stackInstanceStatus;

  StackInstance({
    this.account,
    this.region,
    this.stackInstanceStatus,
  });
  static StackInstance fromJson(Map<String, dynamic> json) => StackInstance(
        account: json.containsKey('Account') ? json['Account'] as String : null,
        region: json.containsKey('Region') ? json['Region'] as String : null,
        stackInstanceStatus: json.containsKey('StackInstanceStatus')
            ? json['StackInstanceStatus'] as String
            : null,
      );
}

/// Information about a tag. A tag is a key-value pair. Tags are propagated to
/// the resources created when provisioning a product.
class Tag {
  /// The tag key.
  final String key;

  /// The value for this key.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about a TagOption.
class TagOptionDetail {
  /// The TagOption key.
  final String key;

  /// The TagOption value.
  final String value;

  /// The TagOption active state.
  final bool active;

  /// The TagOption identifier.
  final String id;

  TagOptionDetail({
    this.key,
    this.value,
    this.active,
    this.id,
  });
  static TagOptionDetail fromJson(Map<String, dynamic> json) => TagOptionDetail(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
        active: json.containsKey('Active') ? json['Active'] as bool : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
      );
}

/// Summary information about a TagOption.
class TagOptionSummary {
  /// The TagOption key.
  final String key;

  /// The TagOption value.
  final List<String> values;

  TagOptionSummary({
    this.key,
    this.values,
  });
  static TagOptionSummary fromJson(Map<String, dynamic> json) =>
      TagOptionSummary(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        values: json.containsKey('Values')
            ? (json['Values'] as List).map((e) => e as String).toList()
            : null,
      );
}

class TerminateProvisionedProductOutput {
  /// Information about the result of this request.
  final RecordDetail recordDetail;

  TerminateProvisionedProductOutput({
    this.recordDetail,
  });
  static TerminateProvisionedProductOutput fromJson(
          Map<String, dynamic> json) =>
      TerminateProvisionedProductOutput(
        recordDetail: json.containsKey('RecordDetail')
            ? RecordDetail.fromJson(json['RecordDetail'])
            : null,
      );
}

class UpdateConstraintOutput {
  /// Information about the constraint.
  final ConstraintDetail constraintDetail;

  /// The constraint parameters.
  final String constraintParameters;

  /// The status of the current request.
  final String status;

  UpdateConstraintOutput({
    this.constraintDetail,
    this.constraintParameters,
    this.status,
  });
  static UpdateConstraintOutput fromJson(Map<String, dynamic> json) =>
      UpdateConstraintOutput(
        constraintDetail: json.containsKey('ConstraintDetail')
            ? ConstraintDetail.fromJson(json['ConstraintDetail'])
            : null,
        constraintParameters: json.containsKey('ConstraintParameters')
            ? json['ConstraintParameters'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

class UpdatePortfolioOutput {
  /// Information about the portfolio.
  final PortfolioDetail portfolioDetail;

  /// Information about the tags associated with the portfolio.
  final List<Tag> tags;

  UpdatePortfolioOutput({
    this.portfolioDetail,
    this.tags,
  });
  static UpdatePortfolioOutput fromJson(Map<String, dynamic> json) =>
      UpdatePortfolioOutput(
        portfolioDetail: json.containsKey('PortfolioDetail')
            ? PortfolioDetail.fromJson(json['PortfolioDetail'])
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class UpdateProductOutput {
  /// Information about the product view.
  final ProductViewDetail productViewDetail;

  /// Information about the tags associated with the product.
  final List<Tag> tags;

  UpdateProductOutput({
    this.productViewDetail,
    this.tags,
  });
  static UpdateProductOutput fromJson(Map<String, dynamic> json) =>
      UpdateProductOutput(
        productViewDetail: json.containsKey('ProductViewDetail')
            ? ProductViewDetail.fromJson(json['ProductViewDetail'])
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class UpdateProvisionedProductOutput {
  /// Information about the result of the request.
  final RecordDetail recordDetail;

  UpdateProvisionedProductOutput({
    this.recordDetail,
  });
  static UpdateProvisionedProductOutput fromJson(Map<String, dynamic> json) =>
      UpdateProvisionedProductOutput(
        recordDetail: json.containsKey('RecordDetail')
            ? RecordDetail.fromJson(json['RecordDetail'])
            : null,
      );
}

class UpdateProvisionedProductPropertiesOutput {
  /// The provisioned product identifier.
  final String provisionedProductId;

  /// A map that contains the properties updated.
  final Map<String, String> provisionedProductProperties;

  /// The identifier of the record.
  final String recordId;

  /// The status of the request.
  final String status;

  UpdateProvisionedProductPropertiesOutput({
    this.provisionedProductId,
    this.provisionedProductProperties,
    this.recordId,
    this.status,
  });
  static UpdateProvisionedProductPropertiesOutput fromJson(
          Map<String, dynamic> json) =>
      UpdateProvisionedProductPropertiesOutput(
        provisionedProductId: json.containsKey('ProvisionedProductId')
            ? json['ProvisionedProductId'] as String
            : null,
        provisionedProductProperties:
            json.containsKey('ProvisionedProductProperties')
                ? (json['ProvisionedProductProperties'] as Map)
                    .map((k, v) => MapEntry(k as String, v as String))
                : null,
        recordId:
            json.containsKey('RecordId') ? json['RecordId'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

class UpdateProvisioningArtifactOutput {
  /// Information about the provisioning artifact.
  final ProvisioningArtifactDetail provisioningArtifactDetail;

  /// The URL of the CloudFormation template in Amazon S3.
  final Map<String, String> info;

  /// The status of the current request.
  final String status;

  UpdateProvisioningArtifactOutput({
    this.provisioningArtifactDetail,
    this.info,
    this.status,
  });
  static UpdateProvisioningArtifactOutput fromJson(Map<String, dynamic> json) =>
      UpdateProvisioningArtifactOutput(
        provisioningArtifactDetail:
            json.containsKey('ProvisioningArtifactDetail')
                ? ProvisioningArtifactDetail.fromJson(
                    json['ProvisioningArtifactDetail'])
                : null,
        info: json.containsKey('Info')
            ? (json['Info'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

/// The parameter key-value pair used to update a provisioned product.
class UpdateProvisioningParameter {
  /// The parameter key.
  final String key;

  /// The parameter value.
  final String value;

  /// If set to true, `Value` is ignored and the previous parameter value is
  /// kept.
  final bool usePreviousValue;

  UpdateProvisioningParameter({
    this.key,
    this.value,
    this.usePreviousValue,
  });
  static UpdateProvisioningParameter fromJson(Map<String, dynamic> json) =>
      UpdateProvisioningParameter(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
        usePreviousValue: json.containsKey('UsePreviousValue')
            ? json['UsePreviousValue'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The user-defined preferences that will be applied when updating a
/// provisioned product. Not all preferences are applicable to all provisioned
/// product types.
class UpdateProvisioningPreferences {
  /// One or more AWS accounts that will have access to the provisioned product.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  ///
  /// The AWS accounts specified should be within the list of accounts in the
  /// `STACKSET` constraint. To get the list of accounts in the `STACKSET`
  /// constraint, use the `DescribeProvisioningParameters` operation.
  ///
  /// If no values are specified, the default value is all accounts from the
  /// `STACKSET` constraint.
  final List<String> stackSetAccounts;

  /// One or more AWS Regions where the provisioned product will be available.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  ///
  /// The specified regions should be within the list of regions from the
  /// `STACKSET` constraint. To get the list of regions in the `STACKSET`
  /// constraint, use the `DescribeProvisioningParameters` operation.
  ///
  /// If no values are specified, the default value is all regions from the
  /// `STACKSET` constraint.
  final List<String> stackSetRegions;

  /// The number of accounts, per region, for which this operation can fail
  /// before AWS Service Catalog stops the operation in that region. If the
  /// operation is stopped in a region, AWS Service Catalog doesn't attempt the
  /// operation in any subsequent regions.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  ///
  /// Conditional: You must specify either `StackSetFailureToleranceCount` or
  /// `StackSetFailureTolerancePercentage`, but not both.
  ///
  /// The default value is `0` if no value is specified.
  final int stackSetFailureToleranceCount;

  /// The percentage of accounts, per region, for which this stack operation can
  /// fail before AWS Service Catalog stops the operation in that region. If the
  /// operation is stopped in a region, AWS Service Catalog doesn't attempt the
  /// operation in any subsequent regions.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// AWS Service Catalog rounds down to the next whole number.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  ///
  /// Conditional: You must specify either `StackSetFailureToleranceCount` or
  /// `StackSetFailureTolerancePercentage`, but not both.
  final int stackSetFailureTolerancePercentage;

  /// The maximum number of accounts in which to perform this operation at one
  /// time. This is dependent on the value of `StackSetFailureToleranceCount`.
  /// `StackSetMaxConcurrentCount` is at most one more than the
  /// `StackSetFailureToleranceCount`.
  ///
  /// Note that this setting lets you specify the maximum for operations. For
  /// large deployments, under certain circumstances the actual number of
  /// accounts acted upon concurrently may be lower due to service throttling.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  ///
  /// Conditional: You must specify either `StackSetMaxConcurrentCount` or
  /// `StackSetMaxConcurrentPercentage`, but not both.
  final int stackSetMaxConcurrencyCount;

  /// The maximum percentage of accounts in which to perform this operation at
  /// one time.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// AWS Service Catalog rounds down to the next whole number. This is true
  /// except in cases where rounding down would result is zero. In this case,
  /// AWS Service Catalog sets the number as `1` instead.
  ///
  /// Note that this setting lets you specify the maximum for operations. For
  /// large deployments, under certain circumstances the actual number of
  /// accounts acted upon concurrently may be lower due to service throttling.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  ///
  /// Conditional: You must specify either `StackSetMaxConcurrentCount` or
  /// `StackSetMaxConcurrentPercentage`, but not both.
  final int stackSetMaxConcurrencyPercentage;

  /// Determines what action AWS Service Catalog performs to a stack set or a
  /// stack instance represented by the provisioned product. The default value
  /// is `UPDATE` if nothing is specified.
  ///
  /// Applicable only to a `CFN_STACKSET` provisioned product type.
  ///
  /// CREATE
  ///
  /// Creates a new stack instance in the stack set represented by the
  /// provisioned product. In this case, only new stack instances are created
  /// based on accounts and regions; if new ProductId or ProvisioningArtifactID
  /// are passed, they will be ignored.
  ///
  /// UPDATE
  ///
  /// Updates the stack set represented by the provisioned product and also its
  /// stack instances.
  ///
  /// DELETE
  ///
  /// Deletes a stack instance in the stack set represented by the provisioned
  /// product.
  final String stackSetOperationType;

  UpdateProvisioningPreferences({
    this.stackSetAccounts,
    this.stackSetRegions,
    this.stackSetFailureToleranceCount,
    this.stackSetFailureTolerancePercentage,
    this.stackSetMaxConcurrencyCount,
    this.stackSetMaxConcurrencyPercentage,
    this.stackSetOperationType,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateServiceActionOutput {
  /// Detailed information about the self-service action.
  final ServiceActionDetail serviceActionDetail;

  UpdateServiceActionOutput({
    this.serviceActionDetail,
  });
  static UpdateServiceActionOutput fromJson(Map<String, dynamic> json) =>
      UpdateServiceActionOutput(
        serviceActionDetail: json.containsKey('ServiceActionDetail')
            ? ServiceActionDetail.fromJson(json['ServiceActionDetail'])
            : null,
      );
}

class UpdateTagOptionOutput {
  /// Information about the TagOption.
  final TagOptionDetail tagOptionDetail;

  UpdateTagOptionOutput({
    this.tagOptionDetail,
  });
  static UpdateTagOptionOutput fromJson(Map<String, dynamic> json) =>
      UpdateTagOptionOutput(
        tagOptionDetail: json.containsKey('TagOptionDetail')
            ? TagOptionDetail.fromJson(json['TagOptionDetail'])
            : null,
      );
}

/// Additional information provided by the administrator.
class UsageInstruction {
  /// The usage instruction type for the value.
  final String type;

  /// The usage instruction value for this type.
  final String value;

  UsageInstruction({
    this.type,
    this.value,
  });
  static UsageInstruction fromJson(Map<String, dynamic> json) =>
      UsageInstruction(
        type: json.containsKey('Type') ? json['Type'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
}
