import 'package:meta/meta.dart';

/// AWS Service Catalog
///
///  [AWS Service Catalog](https://aws.amazon.com/servicecatalog/) enables
/// organizations to create and manage catalogs of IT services that are approved
/// for use on AWS. To get the most out of this documentation, you should be
/// familiar with the terminology discussed in [AWS Service Catalog
/// Concepts](http://docs.aws.amazon.com/servicecatalog/latest/adminguide/what-is_concepts.html).
class ServiceCatalogApi {
  /// Accepts an offer to share the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [portfolioShareType]: The type of shared portfolios to accept. The default
  /// is to accept imported portfolios.
  ///
  /// *    `AWS_ORGANIZATIONS` \- Accept portfolios shared by the master account
  /// of your organization.
  ///
  /// *    `IMPORTED` \- Accept imported portfolios.
  ///
  /// *    `AWS_SERVICECATALOG` \- Not supported. (Throws
  /// ResourceNotFoundException.)
  ///
  ///
  /// For example, `aws servicecatalog accept-portfolio-share --portfolio-id
  /// "port-2qwzkwxt3y5fk" --portfolio-share-type AWS_ORGANIZATIONS`
  Future<AcceptPortfolioShareOutput> acceptPortfolioShare(String portfolioId,
      {String acceptLanguage, String portfolioShareType}) async {
    return AcceptPortfolioShareOutput.fromJson({});
  }

  /// Associates the specified budget with the specified resource.
  ///
  /// [budgetName]: The name of the budget you want to associate.
  ///
  /// [resourceId]:  The resource identifier. Either a portfolio-id or a
  /// product-id.
  Future<AssociateBudgetWithResourceOutput> associateBudgetWithResource(
      {@required String budgetName, @required String resourceId}) async {
    return AssociateBudgetWithResourceOutput.fromJson({});
  }

  /// Associates the specified principal ARN with the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return AssociatePrincipalWithPortfolioOutput.fromJson({});
  }

  /// Associates the specified product with the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return AssociateProductWithPortfolioOutput.fromJson({});
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
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  Future<AssociateServiceActionWithProvisioningArtifactOutput>
      associateServiceActionWithProvisioningArtifact(
          {@required String productId,
          @required String provisioningArtifactId,
          @required String serviceActionId,
          String acceptLanguage}) async {
    return AssociateServiceActionWithProvisioningArtifactOutput.fromJson({});
  }

  /// Associate the specified TagOption with the specified portfolio or product.
  ///
  /// [resourceId]: The resource identifier.
  ///
  /// [tagOptionId]: The TagOption identifier.
  Future<AssociateTagOptionWithResourceOutput> associateTagOptionWithResource(
      {@required String resourceId, @required String tagOptionId}) async {
    return AssociateTagOptionWithResourceOutput.fromJson({});
  }

  /// Associates multiple self-service actions with provisioning artifacts.
  ///
  /// [serviceActionAssociations]: One or more associations, each consisting of
  /// the Action ID, the Product ID, and the Provisioning Artifact ID.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  Future<BatchAssociateServiceActionWithProvisioningArtifactOutput>
      batchAssociateServiceActionWithProvisioningArtifact(
          List<ServiceActionAssociation> serviceActionAssociations,
          {String acceptLanguage}) async {
    return BatchAssociateServiceActionWithProvisioningArtifactOutput.fromJson(
        {});
  }

  /// Disassociates a batch of self-service actions from the specified
  /// provisioning artifact.
  ///
  /// [serviceActionAssociations]: One or more associations, each consisting of
  /// the Action ID, the Product ID, and the Provisioning Artifact ID.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  Future<BatchDisassociateServiceActionFromProvisioningArtifactOutput>
      batchDisassociateServiceActionFromProvisioningArtifact(
          List<ServiceActionAssociation> serviceActionAssociations,
          {String acceptLanguage}) async {
    return BatchDisassociateServiceActionFromProvisioningArtifactOutput
        .fromJson({});
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
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return CopyProductOutput.fromJson({});
  }

  /// Creates a constraint.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
  ///  `{"NotificationArns" : \["arn:aws:sns:us-east-1:123456789012:Topic"\]}`
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
  ///  `{"Version": "String", "Properties": {"AccountList": \[ "String" \],
  /// "RegionList": \[ "String" \], "AdminRole": "String", "ExecutionRole":
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
  /// Specify the `Rules` property. For more information, see [Template
  /// Constraint
  /// Rules](http://docs.aws.amazon.com/servicecatalog/latest/adminguide/reference-template_constraint_rules.html).
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
    return CreateConstraintOutput.fromJson({});
  }

  /// Creates a portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return CreatePortfolioOutput.fromJson({});
  }

  /// Shares the specified portfolio with the specified account or organization
  /// node. Shares to an organization node can only be created by the master
  /// account of an Organization. AWSOrganizationsAccess must be enabled in
  /// order to create a portfolio share to an organization node.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return CreatePortfolioShareOutput.fromJson({});
  }

  /// Creates a product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return CreateProductOutput.fromJson({});
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
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return CreateProvisionedProductPlanOutput.fromJson({});
  }

  /// Creates a provisioning artifact (also known as a version) for the
  /// specified product.
  ///
  /// You cannot create a provisioning artifact for a product that was shared
  /// with you.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return CreateProvisioningArtifactOutput.fromJson({});
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
  /// For example: `\[{\\"Name\\":\\"InstanceId\\",\\"Type\\":\\"TARGET\\"}\]`.
  ///
  /// [description]: The self-service action description.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return CreateServiceActionOutput.fromJson({});
  }

  /// Creates a TagOption.
  ///
  /// [key]: The TagOption key.
  ///
  /// [value]: The TagOption value.
  Future<CreateTagOptionOutput> createTagOption(
      {@required String key, @required String value}) async {
    return CreateTagOptionOutput.fromJson({});
  }

  /// Deletes the specified constraint.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [id]: The identifier of the constraint.
  Future<DeleteConstraintOutput> deleteConstraint(String id,
      {String acceptLanguage}) async {
    return DeleteConstraintOutput.fromJson({});
  }

  /// Deletes the specified portfolio.
  ///
  /// You cannot delete a portfolio if it was shared with you or if it has
  /// associated products, users, constraints, or shared accounts.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [id]: The portfolio identifier.
  Future<DeletePortfolioOutput> deletePortfolio(String id,
      {String acceptLanguage}) async {
    return DeletePortfolioOutput.fromJson({});
  }

  /// Stops sharing the specified portfolio with the specified account or
  /// organization node. Shares to an organization node can only be deleted by
  /// the master account of an Organization.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return DeletePortfolioShareOutput.fromJson({});
  }

  /// Deletes the specified product.
  ///
  /// You cannot delete a product if it was shared with you or is associated
  /// with a portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [id]: The product identifier.
  Future<DeleteProductOutput> deleteProduct(String id,
      {String acceptLanguage}) async {
    return DeleteProductOutput.fromJson({});
  }

  /// Deletes the specified plan.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return DeleteProvisionedProductPlanOutput.fromJson({});
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
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [productId]: The product identifier.
  ///
  /// [provisioningArtifactId]: The identifier of the provisioning artifact.
  Future<DeleteProvisioningArtifactOutput> deleteProvisioningArtifact(
      {String acceptLanguage,
      @required String productId,
      @required String provisioningArtifactId}) async {
    return DeleteProvisioningArtifactOutput.fromJson({});
  }

  /// Deletes a self-service action.
  ///
  /// [id]: The self-service action identifier. For example,
  /// `act-fs7abcd89wxyz`.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  Future<DeleteServiceActionOutput> deleteServiceAction(String id,
      {String acceptLanguage}) async {
    return DeleteServiceActionOutput.fromJson({});
  }

  /// Deletes the specified TagOption.
  ///
  /// You cannot delete a TagOption if it is associated with a product or
  /// portfolio.
  ///
  /// [id]: The TagOption identifier.
  Future<DeleteTagOptionOutput> deleteTagOption(String id) async {
    return DeleteTagOptionOutput.fromJson({});
  }

  /// Gets information about the specified constraint.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [id]: The identifier of the constraint.
  Future<DescribeConstraintOutput> describeConstraint(String id,
      {String acceptLanguage}) async {
    return DescribeConstraintOutput.fromJson({});
  }

  /// Gets the status of the specified copy product operation.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [copyProductToken]: The token for the copy product operation. This token
  /// is returned by CopyProduct.
  Future<DescribeCopyProductStatusOutput> describeCopyProductStatus(
      String copyProductToken,
      {String acceptLanguage}) async {
    return DescribeCopyProductStatusOutput.fromJson({});
  }

  /// Gets information about the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [id]: The portfolio identifier.
  Future<DescribePortfolioOutput> describePortfolio(String id,
      {String acceptLanguage}) async {
    return DescribePortfolioOutput.fromJson({});
  }

  /// Gets the status of the specified portfolio share operation. This API can
  /// only be called by the master account in the organization.
  ///
  /// [portfolioShareToken]: The token for the portfolio share operation. This
  /// token is returned either by CreatePortfolioShare or by
  /// DeletePortfolioShare.
  Future<DescribePortfolioShareStatusOutput> describePortfolioShareStatus(
      String portfolioShareToken) async {
    return DescribePortfolioShareStatusOutput.fromJson({});
  }

  /// Gets information about the specified product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [id]: The product identifier.
  Future<DescribeProductOutput> describeProduct(String id,
      {String acceptLanguage}) async {
    return DescribeProductOutput.fromJson({});
  }

  /// Gets information about the specified product. This operation is run with
  /// administrator access.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [id]: The product identifier.
  Future<DescribeProductAsAdminOutput> describeProductAsAdmin(String id,
      {String acceptLanguage}) async {
    return DescribeProductAsAdminOutput.fromJson({});
  }

  /// Gets information about the specified product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [id]: The product view identifier.
  Future<DescribeProductViewOutput> describeProductView(String id,
      {String acceptLanguage}) async {
    return DescribeProductViewOutput.fromJson({});
  }

  /// Gets information about the specified provisioned product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [id]: The provisioned product identifier.
  Future<DescribeProvisionedProductOutput> describeProvisionedProduct(String id,
      {String acceptLanguage}) async {
    return DescribeProvisionedProductOutput.fromJson({});
  }

  /// Gets information about the resource changes for the specified plan.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return DescribeProvisionedProductPlanOutput.fromJson({});
  }

  /// Gets information about the specified provisioning artifact (also known as
  /// a version) for the specified product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return DescribeProvisioningArtifactOutput.fromJson({});
  }

  /// Gets information about the configuration required to provision the
  /// specified product using the specified provisioning artifact.
  ///
  /// If the output contains a TagOption key with an empty list of values, there
  /// is a TagOption conflict for that key. The end user cannot take action to
  /// fix the conflict, and launch is not blocked. In subsequent calls to
  /// ProvisionProduct, do not include conflicted TagOption keys as tags, or
  /// this causes the error "Parameter validation failed: Missing required
  /// parameter in Tags\[_N_\]:_Value_". Tag the provisioned product with the
  /// value `sc-tagoption-conflict-portfolioId-productId`.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return DescribeProvisioningParametersOutput.fromJson({});
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
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return DescribeRecordOutput.fromJson({});
  }

  /// Describes a self-service action.
  ///
  /// [id]: The self-service action identifier.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  Future<DescribeServiceActionOutput> describeServiceAction(String id,
      {String acceptLanguage}) async {
    return DescribeServiceActionOutput.fromJson({});
  }

  Future<DescribeServiceActionExecutionParametersOutput>
      describeServiceActionExecutionParameters(
          {@required String provisionedProductId,
          @required String serviceActionId,
          String acceptLanguage}) async {
    return DescribeServiceActionExecutionParametersOutput.fromJson({});
  }

  /// Gets information about the specified TagOption.
  ///
  /// [id]: The TagOption identifier.
  Future<DescribeTagOptionOutput> describeTagOption(String id) async {
    return DescribeTagOptionOutput.fromJson({});
  }

  /// Disable portfolio sharing through AWS Organizations feature. This feature
  /// will not delete your current shares but it will prevent you from creating
  /// new shares throughout your organization. Current shares will not be in
  /// sync with your organization structure if it changes after calling this
  /// API. This API can only be called by the master account in the
  /// organization.
  Future<DisableAwsOrganizationsAccessOutput>
      disableAwsOrganizationsAccess() async {
    return DisableAwsOrganizationsAccessOutput.fromJson({});
  }

  /// Disassociates the specified budget from the specified resource.
  ///
  /// [budgetName]: The name of the budget you want to disassociate.
  ///
  /// [resourceId]: The resource identifier you want to disassociate from.
  /// Either a portfolio-id or a product-id.
  Future<DisassociateBudgetFromResourceOutput> disassociateBudgetFromResource(
      {@required String budgetName, @required String resourceId}) async {
    return DisassociateBudgetFromResourceOutput.fromJson({});
  }

  /// Disassociates a previously associated principal ARN from a specified
  /// portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [principalArn]: The ARN of the principal (IAM user, role, or group).
  Future<DisassociatePrincipalFromPortfolioOutput>
      disassociatePrincipalFromPortfolio(
          {String acceptLanguage,
          @required String portfolioId,
          @required String principalArn}) async {
    return DisassociatePrincipalFromPortfolioOutput.fromJson({});
  }

  /// Disassociates the specified product from the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [productId]: The product identifier.
  ///
  /// [portfolioId]: The portfolio identifier.
  Future<DisassociateProductFromPortfolioOutput>
      disassociateProductFromPortfolio(
          {String acceptLanguage,
          @required String productId,
          @required String portfolioId}) async {
    return DisassociateProductFromPortfolioOutput.fromJson({});
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
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  Future<DisassociateServiceActionFromProvisioningArtifactOutput>
      disassociateServiceActionFromProvisioningArtifact(
          {@required String productId,
          @required String provisioningArtifactId,
          @required String serviceActionId,
          String acceptLanguage}) async {
    return DisassociateServiceActionFromProvisioningArtifactOutput.fromJson({});
  }

  /// Disassociates the specified TagOption from the specified resource.
  ///
  /// [resourceId]: The resource identifier.
  ///
  /// [tagOptionId]: The TagOption identifier.
  Future<DisassociateTagOptionFromResourceOutput>
      disassociateTagOptionFromResource(
          {@required String resourceId, @required String tagOptionId}) async {
    return DisassociateTagOptionFromResourceOutput.fromJson({});
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
    return EnableAwsOrganizationsAccessOutput.fromJson({});
  }

  /// Provisions or modifies a product based on the resource changes for the
  /// specified plan.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return ExecuteProvisionedProductPlanOutput.fromJson({});
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
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  Future<ExecuteProvisionedProductServiceActionOutput>
      executeProvisionedProductServiceAction(
          {@required String provisionedProductId,
          @required String serviceActionId,
          @required String executeToken,
          String acceptLanguage,
          Map<String, List<String>> parameters}) async {
    return ExecuteProvisionedProductServiceActionOutput.fromJson({});
  }

  /// Get the Access Status for AWS Organization portfolio share feature. This
  /// API can only be called by the master account in the organization.
  Future<GetAwsOrganizationsAccessStatusOutput>
      getAwsOrganizationsAccessStatus() async {
    return GetAwsOrganizationsAccessStatusOutput.fromJson({});
  }

  /// Lists all portfolios for which sharing was accepted by this account.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [portfolioShareType]: The type of shared portfolios to list. The default
  /// is to list imported portfolios.
  ///
  /// *    `AWS_ORGANIZATIONS` \- List portfolios shared by the master account
  /// of your organization
  ///
  /// *    `AWS_SERVICECATALOG` \- List default portfolios
  ///
  /// *    `IMPORTED` \- List imported portfolios
  Future<ListAcceptedPortfolioSharesOutput> listAcceptedPortfolioShares(
      {String acceptLanguage,
      String pageToken,
      int pageSize,
      String portfolioShareType}) async {
    return ListAcceptedPortfolioSharesOutput.fromJson({});
  }

  /// Lists all the budgets associated to the specified resource.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [resourceId]: The resource identifier.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<ListBudgetsForResourceOutput> listBudgetsForResource(String resourceId,
      {String acceptLanguage, int pageSize, String pageToken}) async {
    return ListBudgetsForResourceOutput.fromJson({});
  }

  /// Lists the constraints for the specified portfolio and product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return ListConstraintsForPortfolioOutput.fromJson({});
  }

  /// Lists the paths to the specified product. A path is how the user has
  /// access to a specified product, and is necessary when provisioning a
  /// product. A path also determines the constraints put on the product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [productId]: The product identifier.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<ListLaunchPathsOutput> listLaunchPaths(String productId,
      {String acceptLanguage, int pageSize, String pageToken}) async {
    return ListLaunchPathsOutput.fromJson({});
  }

  /// Lists the organization nodes that have access to the specified portfolio.
  /// This API can only be called by the master account in the organization.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [portfolioId]: The portfolio identifier. For example,
  /// `port-2abcdext3y5fk`.
  ///
  /// [organizationNodeType]: The organization node type that will be returned
  /// in the output.
  ///
  /// *    `ORGANIZATION` \- Organization that has access to the portfolio.
  ///
  /// *    `ORGANIZATIONAL_UNIT` \- Organizational unit that has access to the
  /// portfolio within your organization.
  ///
  /// *    `ACCOUNT` \- Account that has access to the portfolio within your
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
    return ListOrganizationPortfolioAccessOutput.fromJson({});
  }

  /// Lists the account IDs that have access to the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  Future<ListPortfolioAccessOutput> listPortfolioAccess(String portfolioId,
      {String acceptLanguage}) async {
    return ListPortfolioAccessOutput.fromJson({});
  }

  /// Lists all portfolios in the catalog.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  Future<ListPortfoliosOutput> listPortfolios(
      {String acceptLanguage, String pageToken, int pageSize}) async {
    return ListPortfoliosOutput.fromJson({});
  }

  /// Lists all portfolios that the specified product is associated with.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return ListPortfoliosForProductOutput.fromJson({});
  }

  /// Lists all principal ARNs associated with the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return ListPrincipalsForPortfolioOutput.fromJson({});
  }

  /// Lists the plans for the specified provisioned product or all plans to
  /// which the user has access.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return ListProvisionedProductPlansOutput.fromJson({});
  }

  /// Lists all provisioning artifacts (also known as versions) for the
  /// specified product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [productId]: The product identifier.
  Future<ListProvisioningArtifactsOutput> listProvisioningArtifacts(
      String productId,
      {String acceptLanguage}) async {
    return ListProvisioningArtifactsOutput.fromJson({});
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
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  Future<ListProvisioningArtifactsForServiceActionOutput>
      listProvisioningArtifactsForServiceAction(String serviceActionId,
          {int pageSize, String pageToken, String acceptLanguage}) async {
    return ListProvisioningArtifactsForServiceActionOutput.fromJson({});
  }

  /// Lists the specified requests or all performed requests.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return ListRecordHistoryOutput.fromJson({});
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
    return ListResourcesForTagOptionOutput.fromJson({});
  }

  /// Lists all self-service actions.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [pageSize]: The maximum number of items to return with this call.
  ///
  /// [pageToken]: The page token for the next set of results. To retrieve the
  /// first set of results, use null.
  Future<ListServiceActionsOutput> listServiceActions(
      {String acceptLanguage, int pageSize, String pageToken}) async {
    return ListServiceActionsOutput.fromJson({});
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
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  Future<ListServiceActionsForProvisioningArtifactOutput>
      listServiceActionsForProvisioningArtifact(
          {@required String productId,
          @required String provisioningArtifactId,
          int pageSize,
          String pageToken,
          String acceptLanguage}) async {
    return ListServiceActionsForProvisioningArtifactOutput.fromJson({});
  }

  /// Returns summary information about stack instances that are associated with
  /// the specified `CFN_STACKSET` type provisioned product. You can filter for
  /// stack instances that are associated with a specific AWS account name or
  /// region.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return ListStackInstancesForProvisionedProductOutput.fromJson({});
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
    return ListTagOptionsOutput.fromJson({});
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
  /// in Tags\[_N_\]:_Value_".
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return ProvisionProductOutput.fromJson({});
  }

  /// Rejects an offer to share the specified portfolio.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  ///
  /// [portfolioId]: The portfolio identifier.
  ///
  /// [portfolioShareType]: The type of shared portfolios to reject. The default
  /// is to reject imported portfolios.
  ///
  /// *    `AWS_ORGANIZATIONS` \- Reject portfolios shared by the master account
  /// of your organization.
  ///
  /// *    `IMPORTED` \- Reject imported portfolios.
  ///
  /// *    `AWS_SERVICECATALOG` \- Not supported. (Throws
  /// ResourceNotFoundException.)
  ///
  ///
  /// For example, `aws servicecatalog reject-portfolio-share --portfolio-id
  /// "port-2qwzkwxt3y5fk" --portfolio-share-type AWS_ORGANIZATIONS`
  Future<RejectPortfolioShareOutput> rejectPortfolioShare(String portfolioId,
      {String acceptLanguage, String portfolioShareType}) async {
    return RejectPortfolioShareOutput.fromJson({});
  }

  /// Lists the provisioned products that are available (not terminated).
  ///
  /// To use additional filtering, see SearchProvisionedProducts.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return ScanProvisionedProductsOutput.fromJson({});
  }

  /// Gets information about the products to which the caller has access.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return SearchProductsOutput.fromJson({});
  }

  /// Gets information about the products for the specified portfolio or all
  /// products.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return SearchProductsAsAdminOutput.fromJson({});
  }

  /// Gets information about the provisioned products that meet the specified
  /// criteria.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
  /// Example: `"SearchQuery":\["status:AVAILABLE"\]`
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
    return SearchProvisionedProductsOutput.fromJson({});
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
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  Future<TerminateProvisionedProductOutput> terminateProvisionedProduct(
      String terminateToken,
      {String provisionedProductName,
      String provisionedProductId,
      bool ignoreErrors,
      String acceptLanguage}) async {
    return TerminateProvisionedProductOutput.fromJson({});
  }

  /// Updates the specified constraint.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
  ///  `{"NotificationArns" : \["arn:aws:sns:us-east-1:123456789012:Topic"\]}`
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
  ///  `{"Version": "String", "Properties": {"AccountList": \[ "String" \],
  /// "RegionList": \[ "String" \], "AdminRole": "String", "ExecutionRole":
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
  /// Specify the `Rules` property. For more information, see [Template
  /// Constraint
  /// Rules](http://docs.aws.amazon.com/servicecatalog/latest/adminguide/reference-template_constraint_rules.html).
  Future<UpdateConstraintOutput> updateConstraint(String id,
      {String acceptLanguage, String description, String parameters}) async {
    return UpdateConstraintOutput.fromJson({});
  }

  /// Updates the specified portfolio.
  ///
  /// You cannot update a product that was shared with you.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return UpdatePortfolioOutput.fromJson({});
  }

  /// Updates the specified product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return UpdateProductOutput.fromJson({});
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
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return UpdateProvisionedProductOutput.fromJson({});
  }

  /// Requests updates to the properties of the specified provisioned product.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return UpdateProvisionedProductPropertiesOutput.fromJson({});
  }

  /// Updates the specified provisioning artifact (also known as a version) for
  /// the specified product.
  ///
  /// You cannot update a provisioning artifact for a product that was shared
  /// with you.
  ///
  /// [acceptLanguage]: The language code.
  ///
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
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
    return UpdateProvisioningArtifactOutput.fromJson({});
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
  /// *    `en` \- English (default)
  ///
  /// *    `jp` \- Japanese
  ///
  /// *    `zh` \- Chinese
  Future<UpdateServiceActionOutput> updateServiceAction(String id,
      {String name,
      Map<String, String> definition,
      String description,
      String acceptLanguage}) async {
    return UpdateServiceActionOutput.fromJson({});
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
    return UpdateTagOptionOutput.fromJson({});
  }
}

class AcceptPortfolioShareOutput {
  AcceptPortfolioShareOutput();
  static AcceptPortfolioShareOutput fromJson(Map<String, dynamic> json) =>
      AcceptPortfolioShareOutput();
}

class AccessLevelFilter {
  /// The access level.
  ///
  /// *    `Account` \- Filter results based on the account.
  ///
  /// *    `Role` \- Filter results based on the federated role of the specified
  /// user.
  ///
  /// *    `User` \- Filter results based on the specified user.
  final String key;

  /// The user to which the access level applies. The only supported value is
  /// `Self`.
  final String value;

  AccessLevelFilter({
    this.key,
    this.value,
  });
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
      BatchAssociateServiceActionWithProvisioningArtifactOutput();
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
      BatchDisassociateServiceActionFromProvisioningArtifactOutput();
}

class BudgetDetail {
  /// Name of the associated budget.
  final String budgetName;

  BudgetDetail({
    this.budgetName,
  });
  static BudgetDetail fromJson(Map<String, dynamic> json) => BudgetDetail();
}

class CloudWatchDashboard {
  /// The name of the CloudWatch dashboard.
  final String name;

  CloudWatchDashboard({
    this.name,
  });
  static CloudWatchDashboard fromJson(Map<String, dynamic> json) =>
      CloudWatchDashboard();
}

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
      ConstraintDetail();
}

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
      ConstraintSummary();
}

class CopyProductOutput {
  /// The token to use to track the progress of the operation.
  final String copyProductToken;

  CopyProductOutput({
    this.copyProductToken,
  });
  static CopyProductOutput fromJson(Map<String, dynamic> json) =>
      CopyProductOutput();
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
      CreateConstraintOutput();
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
      CreatePortfolioOutput();
}

class CreatePortfolioShareOutput {
  /// The portfolio share unique identifier. This will only be returned if
  /// portfolio is shared to an organization node.
  final String portfolioShareToken;

  CreatePortfolioShareOutput({
    this.portfolioShareToken,
  });
  static CreatePortfolioShareOutput fromJson(Map<String, dynamic> json) =>
      CreatePortfolioShareOutput();
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
      CreateProductOutput();
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
      CreateProvisionedProductPlanOutput();
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
      CreateProvisioningArtifactOutput();
}

class CreateServiceActionOutput {
  /// An object containing information about the self-service action.
  final ServiceActionDetail serviceActionDetail;

  CreateServiceActionOutput({
    this.serviceActionDetail,
  });
  static CreateServiceActionOutput fromJson(Map<String, dynamic> json) =>
      CreateServiceActionOutput();
}

class CreateTagOptionOutput {
  /// Information about the TagOption.
  final TagOptionDetail tagOptionDetail;

  CreateTagOptionOutput({
    this.tagOptionDetail,
  });
  static CreateTagOptionOutput fromJson(Map<String, dynamic> json) =>
      CreateTagOptionOutput();
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
      DeletePortfolioShareOutput();
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
      DescribeConstraintOutput();
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
      DescribeCopyProductStatusOutput();
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
      DescribePortfolioOutput();
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
      DescribePortfolioShareStatusOutput();
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
      DescribeProductAsAdminOutput();
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
      DescribeProductOutput();
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
      DescribeProductViewOutput();
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
      DescribeProvisionedProductOutput();
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
      DescribeProvisionedProductPlanOutput();
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
      DescribeProvisioningArtifactOutput();
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
      DescribeProvisioningParametersOutput();
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
      DescribeRecordOutput();
}

class DescribeServiceActionExecutionParametersOutput {
  final List<ExecutionParameter> serviceActionParameters;

  DescribeServiceActionExecutionParametersOutput({
    this.serviceActionParameters,
  });
  static DescribeServiceActionExecutionParametersOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeServiceActionExecutionParametersOutput();
}

class DescribeServiceActionOutput {
  /// Detailed information about the self-service action.
  final ServiceActionDetail serviceActionDetail;

  DescribeServiceActionOutput({
    this.serviceActionDetail,
  });
  static DescribeServiceActionOutput fromJson(Map<String, dynamic> json) =>
      DescribeServiceActionOutput();
}

class DescribeTagOptionOutput {
  /// Information about the TagOption.
  final TagOptionDetail tagOptionDetail;

  DescribeTagOptionOutput({
    this.tagOptionDetail,
  });
  static DescribeTagOptionOutput fromJson(Map<String, dynamic> json) =>
      DescribeTagOptionOutput();
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
      ExecuteProvisionedProductPlanOutput();
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
      ExecuteProvisionedProductServiceActionOutput();
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
      ExecutionParameter();
}

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
      FailedServiceActionAssociation();
}

class GetAwsOrganizationsAccessStatusOutput {
  /// The status of the portfolio share feature.
  final String accessStatus;

  GetAwsOrganizationsAccessStatusOutput({
    this.accessStatus,
  });
  static GetAwsOrganizationsAccessStatusOutput fromJson(
          Map<String, dynamic> json) =>
      GetAwsOrganizationsAccessStatusOutput();
}

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
      LaunchPathSummary();
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
      ListAcceptedPortfolioSharesOutput();
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
      ListBudgetsForResourceOutput();
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
      ListConstraintsForPortfolioOutput();
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
      ListLaunchPathsOutput();
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
      ListOrganizationPortfolioAccessOutput();
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
      ListPortfolioAccessOutput();
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
      ListPortfoliosForProductOutput();
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
      ListPortfoliosOutput();
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
      ListPrincipalsForPortfolioOutput();
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
      ListProvisionedProductPlansOutput();
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
      ListProvisioningArtifactsForServiceActionOutput();
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
      ListProvisioningArtifactsOutput();
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
      ListRecordHistoryOutput();
}

class ListRecordHistorySearchFilter {
  /// The filter key.
  ///
  /// *    `product` \- Filter results based on the specified product
  /// identifier.
  ///
  /// *    `provisionedproduct` \- Filter results based on the provisioned
  /// product identifier.
  final String key;

  /// The filter value.
  final String value;

  ListRecordHistorySearchFilter({
    this.key,
    this.value,
  });
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
      ListResourcesForTagOptionOutput();
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
      ListServiceActionsForProvisioningArtifactOutput();
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
      ListServiceActionsOutput();
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
      ListStackInstancesForProvisionedProductOutput();
}

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
      ListTagOptionsOutput();
}

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
      OrganizationNode();
}

class ParameterConstraints {
  /// The values that the administrator has allowed for the parameter.
  final List<String> allowedValues;

  ParameterConstraints({
    this.allowedValues,
  });
  static ParameterConstraints fromJson(Map<String, dynamic> json) =>
      ParameterConstraints();
}

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
  static PortfolioDetail fromJson(Map<String, dynamic> json) =>
      PortfolioDetail();
}

class Principal {
  /// The ARN of the principal (IAM user, role, or group).
  final String principalArn;

  /// The principal type. The supported value is `IAM`.
  final String principalType;

  Principal({
    this.principalArn,
    this.principalType,
  });
  static Principal fromJson(Map<String, dynamic> json) => Principal();
}

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
      ProductViewAggregationValue();
}

class ProductViewDetail {
  /// Summary information about the product view.
  final ProductViewSummary productViewSummary;

  /// The status of the product.
  ///
  /// *    `AVAILABLE` \- The product is ready for use.
  ///
  /// *    `CREATING` \- Product creation has started; the product is not ready
  /// for use.
  ///
  /// *    `FAILED` \- An action failed.
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
      ProductViewDetail();
}

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
      ProductViewSummary();
}

class ProvisionProductOutput {
  /// Information about the result of provisioning the product.
  final RecordDetail recordDetail;

  ProvisionProductOutput({
    this.recordDetail,
  });
  static ProvisionProductOutput fromJson(Map<String, dynamic> json) =>
      ProvisionProductOutput();
}

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
  /// *    `AVAILABLE` \- Stable state, ready to perform any operation. The most
  /// recent operation succeeded and completed.
  ///
  /// *    `UNDER_CHANGE` \- Transitive state. Operations performed might not
  /// have valid results. Wait for an `AVAILABLE` status before performing
  /// operations.
  ///
  /// *    `TAINTED` \- Stable state, ready to perform any operation. The stack
  /// has completed the requested operation but is not exactly what was
  /// requested. For example, a request to update to a new version failed and
  /// the stack rolled back to the current version.
  ///
  /// *    `ERROR` \- An unexpected error occurred. The provisioned product
  /// exists but the stack is not running. For example, CloudFormation received
  /// a parameter value that was not valid and could not launch the stack.
  ///
  /// *    `PLAN\_IN\_PROGRESS` \- Transitive state. The plan operations were
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
      ProvisionedProductAttribute();
}

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
  /// *    `AVAILABLE` \- Stable state, ready to perform any operation. The most
  /// recent operation succeeded and completed.
  ///
  /// *    `UNDER_CHANGE` \- Transitive state. Operations performed might not
  /// have valid results. Wait for an `AVAILABLE` status before performing
  /// operations.
  ///
  /// *    `TAINTED` \- Stable state, ready to perform any operation. The stack
  /// has completed the requested operation but is not exactly what was
  /// requested. For example, a request to update to a new version failed and
  /// the stack rolled back to the current version.
  ///
  /// *    `ERROR` \- An unexpected error occurred. The provisioned product
  /// exists but the stack is not running. For example, CloudFormation received
  /// a parameter value that was not valid and could not launch the stack.
  ///
  /// *    `PLAN\_IN\_PROGRESS` \- Transitive state. The plan operations were
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
      ProvisionedProductDetail();
}

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
      ProvisionedProductPlanDetails();
}

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
      ProvisionedProductPlanSummary();
}

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
      ProvisioningArtifact();
}

class ProvisioningArtifactDetail {
  /// The identifier of the provisioning artifact.
  final String id;

  /// The name of the provisioning artifact.
  final String name;

  /// The description of the provisioning artifact.
  final String description;

  /// The type of provisioning artifact.
  ///
  /// *    `CLOUD\_FORMATION\_TEMPLATE` \- AWS CloudFormation template
  ///
  /// *    `MARKETPLACE_AMI` \- AWS Marketplace AMI
  ///
  /// *    `MARKETPLACE_CAR` \- AWS Marketplace Clusters and AWS Resources
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
      ProvisioningArtifactDetail();
}

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
      ProvisioningArtifactParameter();
}

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
      ProvisioningArtifactPreferences();
}

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
  /// *    `CLOUD\_FORMATION\_TEMPLATE` \- AWS CloudFormation template
  ///
  /// *    `MARKETPLACE_AMI` \- AWS Marketplace AMI
  ///
  /// *    `MARKETPLACE_CAR` \- AWS Marketplace Clusters and AWS Resources
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
}

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
      ProvisioningArtifactSummary();
}

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
      ProvisioningArtifactView();
}

class ProvisioningParameter {
  /// The parameter key.
  final String key;

  /// The parameter value.
  final String value;

  ProvisioningParameter({
    this.key,
    this.value,
  });
}

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
}

class RecordDetail {
  /// The identifier of the record.
  final String recordId;

  /// The user-friendly name of the provisioned product.
  final String provisionedProductName;

  /// The status of the provisioned product.
  ///
  /// *    `CREATED` \- The request was created but the operation has not
  /// started.
  ///
  /// *    `IN_PROGRESS` \- The requested operation is in progress.
  ///
  /// *    `IN\_PROGRESS\_IN_ERROR` \- The provisioned product is under change
  /// but the requested operation failed and some remediation is occurring. For
  /// example, a rollback.
  ///
  /// *    `SUCCEEDED` \- The requested operation has successfully completed.
  ///
  /// *    `FAILED` \- The requested operation has unsuccessfully completed.
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
  /// *    `UPDATE\_PROVISIONED\_PRODUCT`
  ///
  /// *    `TERMINATE\_PROVISIONED\_PRODUCT`
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
  static RecordDetail fromJson(Map<String, dynamic> json) => RecordDetail();
}

class RecordError {
  /// The numeric value of the error.
  final String code;

  /// The description of the error.
  final String description;

  RecordError({
    this.code,
    this.description,
  });
  static RecordError fromJson(Map<String, dynamic> json) => RecordError();
}

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
  static RecordOutput fromJson(Map<String, dynamic> json) => RecordOutput();
}

class RecordTag {
  /// The key for this tag.
  final String key;

  /// The value for this tag.
  final String value;

  RecordTag({
    this.key,
    this.value,
  });
  static RecordTag fromJson(Map<String, dynamic> json) => RecordTag();
}

class RejectPortfolioShareOutput {
  RejectPortfolioShareOutput();
  static RejectPortfolioShareOutput fromJson(Map<String, dynamic> json) =>
      RejectPortfolioShareOutput();
}

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
  static ResourceChange fromJson(Map<String, dynamic> json) => ResourceChange();
}

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
      ResourceChangeDetail();
}

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
  static ResourceDetail fromJson(Map<String, dynamic> json) => ResourceDetail();
}

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
      ResourceTargetDefinition();
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
      ScanProvisionedProductsOutput();
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
      SearchProductsAsAdminOutput();
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
      SearchProductsOutput();
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
      SearchProvisionedProductsOutput();
}

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
}

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
      ServiceActionDetail();
}

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
      ServiceActionSummary();
}

class ShareDetails {
  /// List of accounts for whom the operation succeeded.
  final List<String> successfulShares;

  /// List of errors.
  final List<ShareError> shareErrors;

  ShareDetails({
    this.successfulShares,
    this.shareErrors,
  });
  static ShareDetails fromJson(Map<String, dynamic> json) => ShareDetails();
}

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
  static ShareError fromJson(Map<String, dynamic> json) => ShareError();
}

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
  static StackInstance fromJson(Map<String, dynamic> json) => StackInstance();
}

class Tag {
  /// The tag key.
  final String key;

  /// The value for this key.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

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
  static TagOptionDetail fromJson(Map<String, dynamic> json) =>
      TagOptionDetail();
}

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
      TagOptionSummary();
}

class TerminateProvisionedProductOutput {
  /// Information about the result of this request.
  final RecordDetail recordDetail;

  TerminateProvisionedProductOutput({
    this.recordDetail,
  });
  static TerminateProvisionedProductOutput fromJson(
          Map<String, dynamic> json) =>
      TerminateProvisionedProductOutput();
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
      UpdateConstraintOutput();
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
      UpdatePortfolioOutput();
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
      UpdateProductOutput();
}

class UpdateProvisionedProductOutput {
  /// Information about the result of the request.
  final RecordDetail recordDetail;

  UpdateProvisionedProductOutput({
    this.recordDetail,
  });
  static UpdateProvisionedProductOutput fromJson(Map<String, dynamic> json) =>
      UpdateProvisionedProductOutput();
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
      UpdateProvisionedProductPropertiesOutput();
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
      UpdateProvisioningArtifactOutput();
}

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
      UpdateProvisioningParameter();
}

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
}

class UpdateServiceActionOutput {
  /// Detailed information about the self-service action.
  final ServiceActionDetail serviceActionDetail;

  UpdateServiceActionOutput({
    this.serviceActionDetail,
  });
  static UpdateServiceActionOutput fromJson(Map<String, dynamic> json) =>
      UpdateServiceActionOutput();
}

class UpdateTagOptionOutput {
  /// Information about the TagOption.
  final TagOptionDetail tagOptionDetail;

  UpdateTagOptionOutput({
    this.tagOptionDetail,
  });
  static UpdateTagOptionOutput fromJson(Map<String, dynamic> json) =>
      UpdateTagOptionOutput();
}

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
      UsageInstruction();
}
