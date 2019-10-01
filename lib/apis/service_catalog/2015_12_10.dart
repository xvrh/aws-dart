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
  Future<void> acceptPortfolioShare(String portfolioId,
      {String acceptLanguage, String portfolioShareType}) async {}

  /// Associates the specified budget with the specified resource.
  Future<void> associateBudgetWithResource(
      {@required String budgetName, @required String resourceId}) async {}

  /// Associates the specified principal ARN with the specified portfolio.
  Future<void> associatePrincipalWithPortfolio(
      {String acceptLanguage,
      @required String portfolioId,
      @required String principalArn,
      @required String principalType}) async {}

  /// Associates the specified product with the specified portfolio.
  Future<void> associateProductWithPortfolio(
      {String acceptLanguage,
      @required String productId,
      @required String portfolioId,
      String sourcePortfolioId}) async {}

  /// Associates a self-service action with a provisioning artifact.
  Future<void> associateServiceActionWithProvisioningArtifact(
      {@required String productId,
      @required String provisioningArtifactId,
      @required String serviceActionId,
      String acceptLanguage}) async {}

  /// Associate the specified TagOption with the specified portfolio or product.
  Future<void> associateTagOptionWithResource(
      {@required String resourceId, @required String tagOptionId}) async {}

  /// Associates multiple self-service actions with provisioning artifacts.
  Future<void> batchAssociateServiceActionWithProvisioningArtifact(
      List<ServiceActionAssociation> serviceActionAssociations,
      {String acceptLanguage}) async {}

  /// Disassociates a batch of self-service actions from the specified
  /// provisioning artifact.
  Future<void> batchDisassociateServiceActionFromProvisioningArtifact(
      List<ServiceActionAssociation> serviceActionAssociations,
      {String acceptLanguage}) async {}

  /// Copies the specified source product to the specified target product or a
  /// new product.
  ///
  /// You can copy a product to the same account or another account. You can
  /// copy a product to the same region or another region.
  ///
  /// This operation is performed asynchronously. To track the progress of the
  /// operation, use DescribeCopyProductStatus.
  Future<void> copyProduct(
      {String acceptLanguage,
      @required String sourceProductArn,
      String targetProductId,
      String targetProductName,
      List<Map<String, String>> sourceProvisioningArtifactIdentifiers,
      List<String> copyOptions,
      @required String idempotencyToken}) async {}

  /// Creates a constraint.
  Future<void> createConstraint(
      {String acceptLanguage,
      @required String portfolioId,
      @required String productId,
      @required String parameters,
      @required String type,
      String description,
      @required String idempotencyToken}) async {}

  /// Creates a portfolio.
  Future<void> createPortfolio(
      {String acceptLanguage,
      @required String displayName,
      String description,
      @required String providerName,
      List<Tag> tags,
      @required String idempotencyToken}) async {}

  /// Shares the specified portfolio with the specified account or organization
  /// node. Shares to an organization node can only be created by the master
  /// account of an Organization. AWSOrganizationsAccess must be enabled in
  /// order to create a portfolio share to an organization node.
  Future<void> createPortfolioShare(String portfolioId,
      {String acceptLanguage,
      String accountId,
      OrganizationNode organizationNode}) async {}

  /// Creates a product.
  Future<void> createProduct(
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
      @required String idempotencyToken}) async {}

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
  Future<void> createProvisionedProductPlan(
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
      List<Tag> tags}) async {}

  /// Creates a provisioning artifact (also known as a version) for the
  /// specified product.
  ///
  /// You cannot create a provisioning artifact for a product that was shared
  /// with you.
  Future<void> createProvisioningArtifact(
      {String acceptLanguage,
      @required String productId,
      @required ProvisioningArtifactProperties parameters,
      @required String idempotencyToken}) async {}

  /// Creates a self-service action.
  Future<void> createServiceAction(
      {@required String name,
      @required String definitionType,
      @required Map<String, String> definition,
      String description,
      String acceptLanguage,
      @required String idempotencyToken}) async {}

  /// Creates a TagOption.
  Future<void> createTagOption(
      {@required String key, @required String value}) async {}

  /// Deletes the specified constraint.
  Future<void> deleteConstraint(String id, {String acceptLanguage}) async {}

  /// Deletes the specified portfolio.
  ///
  /// You cannot delete a portfolio if it was shared with you or if it has
  /// associated products, users, constraints, or shared accounts.
  Future<void> deletePortfolio(String id, {String acceptLanguage}) async {}

  /// Stops sharing the specified portfolio with the specified account or
  /// organization node. Shares to an organization node can only be deleted by
  /// the master account of an Organization.
  Future<void> deletePortfolioShare(String portfolioId,
      {String acceptLanguage,
      String accountId,
      OrganizationNode organizationNode}) async {}

  /// Deletes the specified product.
  ///
  /// You cannot delete a product if it was shared with you or is associated
  /// with a portfolio.
  Future<void> deleteProduct(String id, {String acceptLanguage}) async {}

  /// Deletes the specified plan.
  Future<void> deleteProvisionedProductPlan(String planId,
      {String acceptLanguage, bool ignoreErrors}) async {}

  /// Deletes the specified provisioning artifact (also known as a version) for
  /// the specified product.
  ///
  /// You cannot delete a provisioning artifact associated with a product that
  /// was shared with you. You cannot delete the last provisioning artifact for
  /// a product, because a product must have at least one provisioning artifact.
  Future<void> deleteProvisioningArtifact(
      {String acceptLanguage,
      @required String productId,
      @required String provisioningArtifactId}) async {}

  /// Deletes a self-service action.
  Future<void> deleteServiceAction(String id, {String acceptLanguage}) async {}

  /// Deletes the specified TagOption.
  ///
  /// You cannot delete a TagOption if it is associated with a product or
  /// portfolio.
  Future<void> deleteTagOption(String id) async {}

  /// Gets information about the specified constraint.
  Future<void> describeConstraint(String id, {String acceptLanguage}) async {}

  /// Gets the status of the specified copy product operation.
  Future<void> describeCopyProductStatus(String copyProductToken,
      {String acceptLanguage}) async {}

  /// Gets information about the specified portfolio.
  Future<void> describePortfolio(String id, {String acceptLanguage}) async {}

  /// Gets the status of the specified portfolio share operation. This API can
  /// only be called by the master account in the organization.
  Future<void> describePortfolioShareStatus(String portfolioShareToken) async {}

  /// Gets information about the specified product.
  Future<void> describeProduct(String id, {String acceptLanguage}) async {}

  /// Gets information about the specified product. This operation is run with
  /// administrator access.
  Future<void> describeProductAsAdmin(String id,
      {String acceptLanguage}) async {}

  /// Gets information about the specified product.
  Future<void> describeProductView(String id, {String acceptLanguage}) async {}

  /// Gets information about the specified provisioned product.
  Future<void> describeProvisionedProduct(String id,
      {String acceptLanguage}) async {}

  /// Gets information about the resource changes for the specified plan.
  Future<void> describeProvisionedProductPlan(String planId,
      {String acceptLanguage, int pageSize, String pageToken}) async {}

  /// Gets information about the specified provisioning artifact (also known as
  /// a version) for the specified product.
  Future<void> describeProvisioningArtifact(
      {String acceptLanguage,
      @required String provisioningArtifactId,
      @required String productId,
      bool verbose}) async {}

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
  Future<void> describeProvisioningParameters(
      {String acceptLanguage,
      @required String productId,
      @required String provisioningArtifactId,
      String pathId}) async {}

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
  Future<void> describeRecord(String id,
      {String acceptLanguage, String pageToken, int pageSize}) async {}

  /// Describes a self-service action.
  Future<void> describeServiceAction(String id,
      {String acceptLanguage}) async {}

  Future<void> describeServiceActionExecutionParameters(
      {@required String provisionedProductId,
      @required String serviceActionId,
      String acceptLanguage}) async {}

  /// Gets information about the specified TagOption.
  Future<void> describeTagOption(String id) async {}

  /// Disable portfolio sharing through AWS Organizations feature. This feature
  /// will not delete your current shares but it will prevent you from creating
  /// new shares throughout your organization. Current shares will not be in
  /// sync with your organization structure if it changes after calling this
  /// API. This API can only be called by the master account in the
  /// organization.
  Future<void> disableAwsOrganizationsAccess() async {}

  /// Disassociates the specified budget from the specified resource.
  Future<void> disassociateBudgetFromResource(
      {@required String budgetName, @required String resourceId}) async {}

  /// Disassociates a previously associated principal ARN from a specified
  /// portfolio.
  Future<void> disassociatePrincipalFromPortfolio(
      {String acceptLanguage,
      @required String portfolioId,
      @required String principalArn}) async {}

  /// Disassociates the specified product from the specified portfolio.
  Future<void> disassociateProductFromPortfolio(
      {String acceptLanguage,
      @required String productId,
      @required String portfolioId}) async {}

  /// Disassociates the specified self-service action association from the
  /// specified provisioning artifact.
  Future<void> disassociateServiceActionFromProvisioningArtifact(
      {@required String productId,
      @required String provisioningArtifactId,
      @required String serviceActionId,
      String acceptLanguage}) async {}

  /// Disassociates the specified TagOption from the specified resource.
  Future<void> disassociateTagOptionFromResource(
      {@required String resourceId, @required String tagOptionId}) async {}

  /// Enable portfolio sharing feature through AWS Organizations. This API will
  /// allow Service Catalog to receive updates on your organization in order to
  /// sync your shares with the current structure. This API can only be called
  /// by the master account in the organization.
  ///
  /// By calling this API Service Catalog will make a call to
  /// organizations:EnableAWSServiceAccess on your behalf so that your shares
  /// can be in sync with any changes in your AWS Organizations structure.
  Future<void> enableAwsOrganizationsAccess() async {}

  /// Provisions or modifies a product based on the resource changes for the
  /// specified plan.
  Future<void> executeProvisionedProductPlan(
      {String acceptLanguage,
      @required String planId,
      @required String idempotencyToken}) async {}

  /// Executes a self-service action against a provisioned product.
  Future<void> executeProvisionedProductServiceAction(
      {@required String provisionedProductId,
      @required String serviceActionId,
      @required String executeToken,
      String acceptLanguage,
      Map<String, List<String>> parameters}) async {}

  /// Get the Access Status for AWS Organization portfolio share feature. This
  /// API can only be called by the master account in the organization.
  Future<void> getAwsOrganizationsAccessStatus() async {}

  /// Lists all portfolios for which sharing was accepted by this account.
  Future<void> listAcceptedPortfolioShares(
      {String acceptLanguage,
      String pageToken,
      int pageSize,
      String portfolioShareType}) async {}

  /// Lists all the budgets associated to the specified resource.
  Future<void> listBudgetsForResource(String resourceId,
      {String acceptLanguage, int pageSize, String pageToken}) async {}

  /// Lists the constraints for the specified portfolio and product.
  Future<void> listConstraintsForPortfolio(String portfolioId,
      {String acceptLanguage,
      String productId,
      int pageSize,
      String pageToken}) async {}

  /// Lists the paths to the specified product. A path is how the user has
  /// access to a specified product, and is necessary when provisioning a
  /// product. A path also determines the constraints put on the product.
  Future<void> listLaunchPaths(String productId,
      {String acceptLanguage, int pageSize, String pageToken}) async {}

  /// Lists the organization nodes that have access to the specified portfolio.
  /// This API can only be called by the master account in the organization.
  Future<void> listOrganizationPortfolioAccess(
      {String acceptLanguage,
      @required String portfolioId,
      @required String organizationNodeType,
      String pageToken,
      int pageSize}) async {}

  /// Lists the account IDs that have access to the specified portfolio.
  Future<void> listPortfolioAccess(String portfolioId,
      {String acceptLanguage}) async {}

  /// Lists all portfolios in the catalog.
  Future<void> listPortfolios(
      {String acceptLanguage, String pageToken, int pageSize}) async {}

  /// Lists all portfolios that the specified product is associated with.
  Future<void> listPortfoliosForProduct(String productId,
      {String acceptLanguage, String pageToken, int pageSize}) async {}

  /// Lists all principal ARNs associated with the specified portfolio.
  Future<void> listPrincipalsForPortfolio(String portfolioId,
      {String acceptLanguage, int pageSize, String pageToken}) async {}

  /// Lists the plans for the specified provisioned product or all plans to
  /// which the user has access.
  Future<void> listProvisionedProductPlans(
      {String acceptLanguage,
      String provisionProductId,
      int pageSize,
      String pageToken,
      AccessLevelFilter accessLevelFilter}) async {}

  /// Lists all provisioning artifacts (also known as versions) for the
  /// specified product.
  Future<void> listProvisioningArtifacts(String productId,
      {String acceptLanguage}) async {}

  /// Lists all provisioning artifacts (also known as versions) for the
  /// specified self-service action.
  Future<void> listProvisioningArtifactsForServiceAction(String serviceActionId,
      {int pageSize, String pageToken, String acceptLanguage}) async {}

  /// Lists the specified requests or all performed requests.
  Future<void> listRecordHistory(
      {String acceptLanguage,
      AccessLevelFilter accessLevelFilter,
      ListRecordHistorySearchFilter searchFilter,
      int pageSize,
      String pageToken}) async {}

  /// Lists the resources associated with the specified TagOption.
  Future<void> listResourcesForTagOption(String tagOptionId,
      {String resourceType, int pageSize, String pageToken}) async {}

  /// Lists all self-service actions.
  Future<void> listServiceActions(
      {String acceptLanguage, int pageSize, String pageToken}) async {}

  /// Returns a paginated list of self-service actions associated with the
  /// specified Product ID and Provisioning Artifact ID.
  Future<void> listServiceActionsForProvisioningArtifact(
      {@required String productId,
      @required String provisioningArtifactId,
      int pageSize,
      String pageToken,
      String acceptLanguage}) async {}

  /// Returns summary information about stack instances that are associated with
  /// the specified `CFN_STACKSET` type provisioned product. You can filter for
  /// stack instances that are associated with a specific AWS account name or
  /// region.
  Future<void> listStackInstancesForProvisionedProduct(
      String provisionedProductId,
      {String acceptLanguage,
      String pageToken,
      int pageSize}) async {}

  /// Lists the specified TagOptions or all TagOptions.
  Future<void> listTagOptions(
      {ListTagOptionsFilters filters, int pageSize, String pageToken}) async {}

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
  Future<void> provisionProduct(
      {String acceptLanguage,
      @required String productId,
      @required String provisioningArtifactId,
      String pathId,
      @required String provisionedProductName,
      List<ProvisioningParameter> provisioningParameters,
      ProvisioningPreferences provisioningPreferences,
      List<Tag> tags,
      List<String> notificationArns,
      @required String provisionToken}) async {}

  /// Rejects an offer to share the specified portfolio.
  Future<void> rejectPortfolioShare(String portfolioId,
      {String acceptLanguage, String portfolioShareType}) async {}

  /// Lists the provisioned products that are available (not terminated).
  ///
  /// To use additional filtering, see SearchProvisionedProducts.
  Future<void> scanProvisionedProducts(
      {String acceptLanguage,
      AccessLevelFilter accessLevelFilter,
      int pageSize,
      String pageToken}) async {}

  /// Gets information about the products to which the caller has access.
  Future<void> searchProducts(
      {String acceptLanguage,
      Map<String, List<String>> filters,
      int pageSize,
      String sortBy,
      String sortOrder,
      String pageToken}) async {}

  /// Gets information about the products for the specified portfolio or all
  /// products.
  Future<void> searchProductsAsAdmin(
      {String acceptLanguage,
      String portfolioId,
      Map<String, List<String>> filters,
      String sortBy,
      String sortOrder,
      String pageToken,
      int pageSize,
      String productSource}) async {}

  /// Gets information about the provisioned products that meet the specified
  /// criteria.
  Future<void> searchProvisionedProducts(
      {String acceptLanguage,
      AccessLevelFilter accessLevelFilter,
      Map<String, List<String>> filters,
      String sortBy,
      String sortOrder,
      int pageSize,
      String pageToken}) async {}

  /// Terminates the specified provisioned product.
  ///
  /// This operation does not delete any records associated with the provisioned
  /// product.
  ///
  /// You can check the status of this request using DescribeRecord.
  Future<void> terminateProvisionedProduct(String terminateToken,
      {String provisionedProductName,
      String provisionedProductId,
      bool ignoreErrors,
      String acceptLanguage}) async {}

  /// Updates the specified constraint.
  Future<void> updateConstraint(String id,
      {String acceptLanguage, String description, String parameters}) async {}

  /// Updates the specified portfolio.
  ///
  /// You cannot update a product that was shared with you.
  Future<void> updatePortfolio(String id,
      {String acceptLanguage,
      String displayName,
      String description,
      String providerName,
      List<Tag> addTags,
      List<String> removeTags}) async {}

  /// Updates the specified product.
  Future<void> updateProduct(String id,
      {String acceptLanguage,
      String name,
      String owner,
      String description,
      String distributor,
      String supportDescription,
      String supportEmail,
      String supportUrl,
      List<Tag> addTags,
      List<String> removeTags}) async {}

  /// Requests updates to the configuration of the specified provisioned
  /// product.
  ///
  /// If there are tags associated with the object, they cannot be updated or
  /// added. Depending on the specific updates requested, this operation can
  /// update with no interruption, with some interruption, or replace the
  /// provisioned product entirely.
  ///
  /// You can check the status of this request using DescribeRecord.
  Future<void> updateProvisionedProduct(String updateToken,
      {String acceptLanguage,
      String provisionedProductName,
      String provisionedProductId,
      String productId,
      String provisioningArtifactId,
      String pathId,
      List<UpdateProvisioningParameter> provisioningParameters,
      UpdateProvisioningPreferences provisioningPreferences,
      List<Tag> tags}) async {}

  /// Requests updates to the properties of the specified provisioned product.
  Future<void> updateProvisionedProductProperties(
      {String acceptLanguage,
      @required String provisionedProductId,
      @required Map<String, String> provisionedProductProperties,
      @required String idempotencyToken}) async {}

  /// Updates the specified provisioning artifact (also known as a version) for
  /// the specified product.
  ///
  /// You cannot update a provisioning artifact for a product that was shared
  /// with you.
  Future<void> updateProvisioningArtifact(
      {String acceptLanguage,
      @required String productId,
      @required String provisioningArtifactId,
      String name,
      String description,
      bool active,
      String guidance}) async {}

  /// Updates a self-service action.
  Future<void> updateServiceAction(String id,
      {String name,
      Map<String, String> definition,
      String description,
      String acceptLanguage}) async {}

  /// Updates the specified TagOption.
  Future<void> updateTagOption(String id, {String value, bool active}) async {}
}

class AcceptPortfolioShareOutput {}

class AccessLevelFilter {}

class AssociateBudgetWithResourceOutput {}

class AssociatePrincipalWithPortfolioOutput {}

class AssociateProductWithPortfolioOutput {}

class AssociateServiceActionWithProvisioningArtifactOutput {}

class AssociateTagOptionWithResourceOutput {}

class BatchAssociateServiceActionWithProvisioningArtifactOutput {}

class BatchDisassociateServiceActionFromProvisioningArtifactOutput {}

class BudgetDetail {}

class CloudWatchDashboard {}

class ConstraintDetail {}

class ConstraintSummary {}

class CopyProductOutput {}

class CreateConstraintOutput {}

class CreatePortfolioOutput {}

class CreatePortfolioShareOutput {}

class CreateProductOutput {}

class CreateProvisionedProductPlanOutput {}

class CreateProvisioningArtifactOutput {}

class CreateServiceActionOutput {}

class CreateTagOptionOutput {}

class DeleteConstraintOutput {}

class DeletePortfolioOutput {}

class DeletePortfolioShareOutput {}

class DeleteProductOutput {}

class DeleteProvisionedProductPlanOutput {}

class DeleteProvisioningArtifactOutput {}

class DeleteServiceActionOutput {}

class DeleteTagOptionOutput {}

class DescribeConstraintOutput {}

class DescribeCopyProductStatusOutput {}

class DescribePortfolioOutput {}

class DescribePortfolioShareStatusOutput {}

class DescribeProductAsAdminOutput {}

class DescribeProductOutput {}

class DescribeProductViewOutput {}

class DescribeProvisionedProductOutput {}

class DescribeProvisionedProductPlanOutput {}

class DescribeProvisioningArtifactOutput {}

class DescribeProvisioningParametersOutput {}

class DescribeRecordOutput {}

class DescribeServiceActionExecutionParametersOutput {}

class DescribeServiceActionOutput {}

class DescribeTagOptionOutput {}

class DisableAwsOrganizationsAccessOutput {}

class DisassociateBudgetFromResourceOutput {}

class DisassociatePrincipalFromPortfolioOutput {}

class DisassociateProductFromPortfolioOutput {}

class DisassociateServiceActionFromProvisioningArtifactOutput {}

class DisassociateTagOptionFromResourceOutput {}

class EnableAwsOrganizationsAccessOutput {}

class ExecuteProvisionedProductPlanOutput {}

class ExecuteProvisionedProductServiceActionOutput {}

class ExecutionParameter {}

class FailedServiceActionAssociation {}

class GetAwsOrganizationsAccessStatusOutput {}

class LaunchPathSummary {}

class ListAcceptedPortfolioSharesOutput {}

class ListBudgetsForResourceOutput {}

class ListConstraintsForPortfolioOutput {}

class ListLaunchPathsOutput {}

class ListOrganizationPortfolioAccessOutput {}

class ListPortfolioAccessOutput {}

class ListPortfoliosForProductOutput {}

class ListPortfoliosOutput {}

class ListPrincipalsForPortfolioOutput {}

class ListProvisionedProductPlansOutput {}

class ListProvisioningArtifactsForServiceActionOutput {}

class ListProvisioningArtifactsOutput {}

class ListRecordHistoryOutput {}

class ListRecordHistorySearchFilter {}

class ListResourcesForTagOptionOutput {}

class ListServiceActionsForProvisioningArtifactOutput {}

class ListServiceActionsOutput {}

class ListStackInstancesForProvisionedProductOutput {}

class ListTagOptionsFilters {}

class ListTagOptionsOutput {}

class OrganizationNode {}

class ParameterConstraints {}

class PortfolioDetail {}

class Principal {}

class ProductViewAggregationValue {}

class ProductViewDetail {}

class ProductViewSummary {}

class ProvisionProductOutput {}

class ProvisionedProductAttribute {}

class ProvisionedProductDetail {}

class ProvisionedProductPlanDetails {}

class ProvisionedProductPlanSummary {}

class ProvisioningArtifact {}

class ProvisioningArtifactDetail {}

class ProvisioningArtifactParameter {}

class ProvisioningArtifactPreferences {}

class ProvisioningArtifactProperties {}

class ProvisioningArtifactSummary {}

class ProvisioningArtifactView {}

class ProvisioningParameter {}

class ProvisioningPreferences {}

class RecordDetail {}

class RecordError {}

class RecordOutput {}

class RecordTag {}

class RejectPortfolioShareOutput {}

class ResourceChange {}

class ResourceChangeDetail {}

class ResourceDetail {}

class ResourceTargetDefinition {}

class ScanProvisionedProductsOutput {}

class SearchProductsAsAdminOutput {}

class SearchProductsOutput {}

class SearchProvisionedProductsOutput {}

class ServiceActionAssociation {}

class ServiceActionDetail {}

class ServiceActionSummary {}

class ShareDetails {}

class ShareError {}

class StackInstance {}

class Tag {}

class TagOptionDetail {}

class TagOptionSummary {}

class TerminateProvisionedProductOutput {}

class UpdateConstraintOutput {}

class UpdatePortfolioOutput {}

class UpdateProductOutput {}

class UpdateProvisionedProductOutput {}

class UpdateProvisionedProductPropertiesOutput {}

class UpdateProvisioningArtifactOutput {}

class UpdateProvisioningParameter {}

class UpdateProvisioningPreferences {}

class UpdateServiceActionOutput {}

class UpdateTagOptionOutput {}

class UsageInstruction {}
