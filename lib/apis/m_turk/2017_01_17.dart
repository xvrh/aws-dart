import 'package:meta/meta.dart';

/// Amazon Mechanical Turk API Reference
class MTurkApi {
  final _client;
  MTurkApi(client) : _client = client.configured('MTurk', serializer: 'json');

  ///  The `AcceptQualificationRequest` operation approves a Worker's request
  /// for a Qualification.
  ///
  ///  Only the owner of the Qualification type can grant a Qualification
  /// request for that type.
  ///
  ///  A successful request for the `AcceptQualificationRequest` operation
  /// returns with no errors and an empty body.
  ///
  /// [qualificationRequestId]: The ID of the Qualification request, as returned
  /// by the `GetQualificationRequests` operation.
  ///
  /// [integerValue]:  The value of the Qualification. You can omit this value
  /// if you are using the presence or absence of the Qualification as the basis
  /// for a HIT requirement.
  Future<AcceptQualificationRequestResponse> acceptQualificationRequest(
      String qualificationRequestId,
      {int integerValue}) async {
    var response_ = await _client.send('AcceptQualificationRequest', {
      'QualificationRequestId': qualificationRequestId,
      if (integerValue != null) 'IntegerValue': integerValue,
    });
    return AcceptQualificationRequestResponse.fromJson(response_);
  }

  ///  The `ApproveAssignment` operation approves the results of a completed
  /// assignment.
  ///
  ///  Approving an assignment initiates two payments from the Requester's
  /// Amazon.com account
  ///
  /// *    The Worker who submitted the results is paid the reward specified in
  /// the HIT.
  ///
  /// *    Amazon Mechanical Turk fees are debited.
  ///
  ///
  ///  If the Requester's account does not have adequate funds for these
  /// payments, the call to ApproveAssignment returns an exception, and the
  /// approval is not processed. You can include an optional feedback message
  /// with the approval, which the Worker can see in the Status section of the
  /// web site.
  ///
  ///  You can also call this operation for assignments that were previous
  /// rejected and approve them by explicitly overriding the previous rejection.
  /// This only works on rejected assignments that were submitted within the
  /// previous 30 days and only if the assignment's related HIT has not been
  /// deleted.
  ///
  /// [assignmentId]:  The ID of the assignment. The assignment must correspond
  /// to a HIT created by the Requester.
  ///
  /// [requesterFeedback]:  A message for the Worker, which the Worker can see
  /// in the Status section of the web site.
  ///
  /// [overrideRejection]:  A flag indicating that an assignment should be
  /// approved even if it was previously rejected. Defaults to `False`.
  Future<ApproveAssignmentResponse> approveAssignment(String assignmentId,
      {String requesterFeedback, bool overrideRejection}) async {
    var response_ = await _client.send('ApproveAssignment', {
      'AssignmentId': assignmentId,
      if (requesterFeedback != null) 'RequesterFeedback': requesterFeedback,
      if (overrideRejection != null) 'OverrideRejection': overrideRejection,
    });
    return ApproveAssignmentResponse.fromJson(response_);
  }

  ///  The `AssociateQualificationWithWorker` operation gives a Worker a
  /// Qualification. `AssociateQualificationWithWorker` does not require that
  /// the Worker submit a Qualification request. It gives the Qualification
  /// directly to the Worker.
  ///
  ///  You can only assign a Qualification of a Qualification type that you
  /// created (using the `CreateQualificationType` operation).
  ///
  ///   Note: `AssociateQualificationWithWorker` does not affect any pending
  /// Qualification requests for the Qualification by the Worker. If you assign
  /// a Qualification to a Worker, then later grant a Qualification request made
  /// by the Worker, the granting of the request may modify the Qualification
  /// score. To resolve a pending Qualification request without affecting the
  /// Qualification the Worker already has, reject the request with the
  /// `RejectQualificationRequest` operation.
  ///
  /// [qualificationTypeId]: The ID of the Qualification type to use for the
  /// assigned Qualification.
  ///
  /// [workerId]:  The ID of the Worker to whom the Qualification is being
  /// assigned. Worker IDs are included with submitted HIT assignments and
  /// Qualification requests.
  ///
  /// [integerValue]: The value of the Qualification to assign.
  ///
  /// [sendNotification]:  Specifies whether to send a notification email
  /// message to the Worker saying that the qualification was assigned to the
  /// Worker. Note: this is true by default.
  Future<AssociateQualificationWithWorkerResponse>
      associateQualificationWithWorker(
          {@required String qualificationTypeId,
          @required String workerId,
          int integerValue,
          bool sendNotification}) async {
    var response_ = await _client.send('AssociateQualificationWithWorker', {
      'QualificationTypeId': qualificationTypeId,
      'WorkerId': workerId,
      if (integerValue != null) 'IntegerValue': integerValue,
      if (sendNotification != null) 'SendNotification': sendNotification,
    });
    return AssociateQualificationWithWorkerResponse.fromJson(response_);
  }

  ///  The `CreateAdditionalAssignmentsForHIT` operation increases the maximum
  /// number of assignments of an existing HIT.
  ///
  ///  To extend the maximum number of assignments, specify the number of
  /// additional assignments.
  ///
  ///
  ///
  /// *   HITs created with fewer than 10 assignments cannot be extended to have
  /// 10 or more assignments. Attempting to add assignments in a way that brings
  /// the total number of assignments for a HIT from fewer than 10 assignments
  /// to 10 or more assignments will result in an
  /// `AWS.MechanicalTurk.InvalidMaximumAssignmentsIncrease` exception.
  ///
  /// *   HITs that were created before July 22, 2015 cannot be extended.
  /// Attempting to extend HITs that were created before July 22, 2015 will
  /// result in an `AWS.MechanicalTurk.HITTooOldForExtension` exception.
  ///
  /// [hitId]: The ID of the HIT to extend.
  ///
  /// [numberOfAdditionalAssignments]: The number of additional assignments to
  /// request for this HIT.
  ///
  /// [uniqueRequestToken]:  A unique identifier for this request, which allows
  /// you to retry the call on error without extending the HIT multiple times.
  /// This is useful in cases such as network timeouts where it is unclear
  /// whether or not the call succeeded on the server. If the extend HIT already
  /// exists in the system from a previous call using the same
  /// `UniqueRequestToken`, subsequent calls will return an error with a message
  /// containing the request ID.
  Future<CreateAdditionalAssignmentsForHitResponse>
      createAdditionalAssignmentsForHit(
          {@required String hitId,
          @required int numberOfAdditionalAssignments,
          String uniqueRequestToken}) async {
    var response_ = await _client.send('CreateAdditionalAssignmentsForHIT', {
      'HITId': hitId,
      'NumberOfAdditionalAssignments': numberOfAdditionalAssignments,
      if (uniqueRequestToken != null) 'UniqueRequestToken': uniqueRequestToken,
    });
    return CreateAdditionalAssignmentsForHitResponse.fromJson(response_);
  }

  /// The `CreateHIT` operation creates a new Human Intelligence Task (HIT). The
  /// new HIT is made available for Workers to find and accept on the Amazon
  /// Mechanical Turk website.
  ///
  ///  This operation allows you to specify a new HIT by passing in values for
  /// the properties of the HIT, such as its title, reward amount and number of
  /// assignments. When you pass these values to `CreateHIT`, a new HIT is
  /// created for you, with a new `HITTypeID`. The HITTypeID can be used to
  /// create additional HITs in the future without needing to specify common
  /// parameters such as the title, description and reward amount each time.
  ///
  ///  An alternative way to create HITs is to first generate a HITTypeID using
  /// the `CreateHITType` operation and then call the `CreateHITWithHITType`
  /// operation. This is the recommended best practice for Requesters who are
  /// creating large numbers of HITs.
  ///
  /// CreateHIT also supports several ways to provide question data: by
  /// providing a value for the `Question` parameter that fully specifies the
  /// contents of the HIT, or by providing a `HitLayoutId` and associated
  /// `HitLayoutParameters`.
  ///
  ///   If a HIT is created with 10 or more maximum assignments, there is an
  /// additional fee. For more information, see
  /// [Amazon Mechanical Turk Pricing](https://requester.mturk.com/pricing).
  ///
  /// [maxAssignments]:  The number of times the HIT can be accepted and
  /// completed before the HIT becomes unavailable.
  ///
  /// [autoApprovalDelayInSeconds]:  The number of seconds after an assignment
  /// for the HIT has been submitted, after which the assignment is considered
  /// Approved automatically unless the Requester explicitly rejects it.
  ///
  /// [lifetimeInSeconds]:  An amount of time, in seconds, after which the HIT
  /// is no longer available for users to accept. After the lifetime of the HIT
  /// elapses, the HIT no longer appears in HIT searches, even if not all of the
  /// assignments for the HIT have been accepted.
  ///
  /// [assignmentDurationInSeconds]:  The amount of time, in seconds, that a
  /// Worker has to complete the HIT after accepting it. If a Worker does not
  /// complete the assignment within the specified duration, the assignment is
  /// considered abandoned. If the HIT is still active (that is, its lifetime
  /// has not elapsed), the assignment becomes available for other users to find
  /// and accept.
  ///
  /// [reward]:  The amount of money the Requester will pay a Worker for
  /// successfully completing the HIT.
  ///
  /// [title]:  The title of the HIT. A title should be short and descriptive
  /// about the kind of task the HIT contains. On the Amazon Mechanical Turk web
  /// site, the HIT title appears in search results, and everywhere the HIT is
  /// mentioned.
  ///
  /// [keywords]:  One or more words or phrases that describe the HIT, separated
  /// by commas. These words are used in searches to find HITs.
  ///
  /// [description]:  A general description of the HIT. A description includes
  /// detailed information about the kind of task the HIT contains. On the
  /// Amazon Mechanical Turk web site, the HIT description appears in the
  /// expanded view of search results, and in the HIT and assignment screens. A
  /// good description gives the user enough information to evaluate the HIT
  /// before accepting it.
  ///
  /// [question]:  The data the person completing the HIT uses to produce the
  /// results.
  ///
  ///  Constraints: Must be a QuestionForm data structure, an ExternalQuestion
  /// data structure, or an HTMLQuestion data structure. The XML question data
  /// must not be larger than 64 kilobytes (65,535 bytes) in size, including
  /// whitespace.
  ///
  /// Either a Question parameter or a HITLayoutId parameter must be provided.
  ///
  /// [requesterAnnotation]:  An arbitrary data field. The RequesterAnnotation
  /// parameter lets your application attach arbitrary data to the HIT for
  /// tracking purposes. For example, this parameter could be an identifier
  /// internal to the Requester's application that corresponds with the HIT.
  ///
  ///  The RequesterAnnotation parameter for a HIT is only visible to the
  /// Requester who created the HIT. It is not shown to the Worker, or any other
  /// Requester.
  ///
  ///  The RequesterAnnotation parameter may be different for each HIT you
  /// submit. It does not affect how your HITs are grouped.
  ///
  /// [qualificationRequirements]:  Conditions that a Worker's Qualifications
  /// must meet in order to accept the HIT. A HIT can have between zero and ten
  /// Qualification requirements. All requirements must be met in order for a
  /// Worker to accept the HIT. Additionally, other actions can be restricted
  /// using the `ActionsGuarded` field on each `QualificationRequirement`
  /// structure.
  ///
  /// [uniqueRequestToken]:  A unique identifier for this request which allows
  /// you to retry the call on error without creating duplicate HITs. This is
  /// useful in cases such as network timeouts where it is unclear whether or
  /// not the call succeeded on the server. If the HIT already exists in the
  /// system from a previous call using the same UniqueRequestToken, subsequent
  /// calls will return a AWS.MechanicalTurk.HitAlreadyExists error with a
  /// message containing the HITId.
  ///
  ///   Note: It is your responsibility to ensure uniqueness of the token. The
  /// unique token expires after 24 hours. Subsequent calls using the same
  /// UniqueRequestToken made after the 24 hour limit could create duplicate
  /// HITs.
  ///
  /// [assignmentReviewPolicy]:  The Assignment-level Review Policy applies to
  /// the assignments under the HIT. You can specify for Mechanical Turk to take
  /// various actions based on the policy.
  ///
  /// [hitReviewPolicy]:  The HIT-level Review Policy applies to the HIT. You
  /// can specify for Mechanical Turk to take various actions based on the
  /// policy.
  ///
  /// [hitLayoutId]:  The HITLayoutId allows you to use a pre-existing HIT
  /// design with placeholder values and create an additional HIT by providing
  /// those values as HITLayoutParameters.
  ///
  ///  Constraints: Either a Question parameter or a HITLayoutId parameter must
  /// be provided.
  ///
  /// [hitLayoutParameters]:  If the HITLayoutId is provided, any placeholder
  /// values must be filled in with values using the HITLayoutParameter
  /// structure. For more information, see HITLayout.
  Future<CreateHitResponse> createHit(
      {int maxAssignments,
      BigInt autoApprovalDelayInSeconds,
      @required BigInt lifetimeInSeconds,
      @required BigInt assignmentDurationInSeconds,
      @required String reward,
      @required String title,
      String keywords,
      @required String description,
      String question,
      String requesterAnnotation,
      List<QualificationRequirement> qualificationRequirements,
      String uniqueRequestToken,
      ReviewPolicy assignmentReviewPolicy,
      ReviewPolicy hitReviewPolicy,
      String hitLayoutId,
      List<HitLayoutParameter> hitLayoutParameters}) async {
    var response_ = await _client.send('CreateHIT', {
      if (maxAssignments != null) 'MaxAssignments': maxAssignments,
      if (autoApprovalDelayInSeconds != null)
        'AutoApprovalDelayInSeconds': autoApprovalDelayInSeconds,
      'LifetimeInSeconds': lifetimeInSeconds,
      'AssignmentDurationInSeconds': assignmentDurationInSeconds,
      'Reward': reward,
      'Title': title,
      if (keywords != null) 'Keywords': keywords,
      'Description': description,
      if (question != null) 'Question': question,
      if (requesterAnnotation != null)
        'RequesterAnnotation': requesterAnnotation,
      if (qualificationRequirements != null)
        'QualificationRequirements': qualificationRequirements,
      if (uniqueRequestToken != null) 'UniqueRequestToken': uniqueRequestToken,
      if (assignmentReviewPolicy != null)
        'AssignmentReviewPolicy': assignmentReviewPolicy,
      if (hitReviewPolicy != null) 'HITReviewPolicy': hitReviewPolicy,
      if (hitLayoutId != null) 'HITLayoutId': hitLayoutId,
      if (hitLayoutParameters != null)
        'HITLayoutParameters': hitLayoutParameters,
    });
    return CreateHitResponse.fromJson(response_);
  }

  ///  The `CreateHITType` operation creates a new HIT type. This operation
  /// allows you to define a standard set of HIT properties to use when creating
  /// HITs. If you register a HIT type with values that match an existing HIT
  /// type, the HIT type ID of the existing type will be returned.
  ///
  /// [autoApprovalDelayInSeconds]:  The number of seconds after an assignment
  /// for the HIT has been submitted, after which the assignment is considered
  /// Approved automatically unless the Requester explicitly rejects it.
  ///
  /// [assignmentDurationInSeconds]:  The amount of time, in seconds, that a
  /// Worker has to complete the HIT after accepting it. If a Worker does not
  /// complete the assignment within the specified duration, the assignment is
  /// considered abandoned. If the HIT is still active (that is, its lifetime
  /// has not elapsed), the assignment becomes available for other users to find
  /// and accept.
  ///
  /// [reward]:  The amount of money the Requester will pay a Worker for
  /// successfully completing the HIT.
  ///
  /// [title]:  The title of the HIT. A title should be short and descriptive
  /// about the kind of task the HIT contains. On the Amazon Mechanical Turk web
  /// site, the HIT title appears in search results, and everywhere the HIT is
  /// mentioned.
  ///
  /// [keywords]:  One or more words or phrases that describe the HIT, separated
  /// by commas. These words are used in searches to find HITs.
  ///
  /// [description]:  A general description of the HIT. A description includes
  /// detailed information about the kind of task the HIT contains. On the
  /// Amazon Mechanical Turk web site, the HIT description appears in the
  /// expanded view of search results, and in the HIT and assignment screens. A
  /// good description gives the user enough information to evaluate the HIT
  /// before accepting it.
  ///
  /// [qualificationRequirements]:  Conditions that a Worker's Qualifications
  /// must meet in order to accept the HIT. A HIT can have between zero and ten
  /// Qualification requirements. All requirements must be met in order for a
  /// Worker to accept the HIT. Additionally, other actions can be restricted
  /// using the `ActionsGuarded` field on each `QualificationRequirement`
  /// structure.
  Future<CreateHitTypeResponse> createHitType(
      {BigInt autoApprovalDelayInSeconds,
      @required BigInt assignmentDurationInSeconds,
      @required String reward,
      @required String title,
      String keywords,
      @required String description,
      List<QualificationRequirement> qualificationRequirements}) async {
    var response_ = await _client.send('CreateHITType', {
      if (autoApprovalDelayInSeconds != null)
        'AutoApprovalDelayInSeconds': autoApprovalDelayInSeconds,
      'AssignmentDurationInSeconds': assignmentDurationInSeconds,
      'Reward': reward,
      'Title': title,
      if (keywords != null) 'Keywords': keywords,
      'Description': description,
      if (qualificationRequirements != null)
        'QualificationRequirements': qualificationRequirements,
    });
    return CreateHitTypeResponse.fromJson(response_);
  }

  ///  The `CreateHITWithHITType` operation creates a new Human Intelligence
  /// Task (HIT) using an existing HITTypeID generated by the `CreateHITType`
  /// operation.
  ///
  ///  This is an alternative way to create HITs from the `CreateHIT` operation.
  /// This is the recommended best practice for Requesters who are creating
  /// large numbers of HITs.
  ///
  /// CreateHITWithHITType also supports several ways to provide question data:
  /// by providing a value for the `Question` parameter that fully specifies the
  /// contents of the HIT, or by providing a `HitLayoutId` and associated
  /// `HitLayoutParameters`.
  ///
  ///   If a HIT is created with 10 or more maximum assignments, there is an
  /// additional fee. For more information, see
  /// [Amazon Mechanical Turk Pricing](https://requester.mturk.com/pricing).
  ///
  /// [hitTypeId]: The HIT type ID you want to create this HIT with.
  ///
  /// [maxAssignments]:  The number of times the HIT can be accepted and
  /// completed before the HIT becomes unavailable.
  ///
  /// [lifetimeInSeconds]:  An amount of time, in seconds, after which the HIT
  /// is no longer available for users to accept. After the lifetime of the HIT
  /// elapses, the HIT no longer appears in HIT searches, even if not all of the
  /// assignments for the HIT have been accepted.
  ///
  /// [question]:  The data the person completing the HIT uses to produce the
  /// results.
  ///
  ///  Constraints: Must be a QuestionForm data structure, an ExternalQuestion
  /// data structure, or an HTMLQuestion data structure. The XML question data
  /// must not be larger than 64 kilobytes (65,535 bytes) in size, including
  /// whitespace.
  ///
  /// Either a Question parameter or a HITLayoutId parameter must be provided.
  ///
  /// [requesterAnnotation]:  An arbitrary data field. The RequesterAnnotation
  /// parameter lets your application attach arbitrary data to the HIT for
  /// tracking purposes. For example, this parameter could be an identifier
  /// internal to the Requester's application that corresponds with the HIT.
  ///
  ///  The RequesterAnnotation parameter for a HIT is only visible to the
  /// Requester who created the HIT. It is not shown to the Worker, or any other
  /// Requester.
  ///
  ///  The RequesterAnnotation parameter may be different for each HIT you
  /// submit. It does not affect how your HITs are grouped.
  ///
  /// [uniqueRequestToken]:  A unique identifier for this request which allows
  /// you to retry the call on error without creating duplicate HITs. This is
  /// useful in cases such as network timeouts where it is unclear whether or
  /// not the call succeeded on the server. If the HIT already exists in the
  /// system from a previous call using the same UniqueRequestToken, subsequent
  /// calls will return a AWS.MechanicalTurk.HitAlreadyExists error with a
  /// message containing the HITId.
  ///
  ///   Note: It is your responsibility to ensure uniqueness of the token. The
  /// unique token expires after 24 hours. Subsequent calls using the same
  /// UniqueRequestToken made after the 24 hour limit could create duplicate
  /// HITs.
  ///
  /// [assignmentReviewPolicy]:  The Assignment-level Review Policy applies to
  /// the assignments under the HIT. You can specify for Mechanical Turk to take
  /// various actions based on the policy.
  ///
  /// [hitReviewPolicy]:  The HIT-level Review Policy applies to the HIT. You
  /// can specify for Mechanical Turk to take various actions based on the
  /// policy.
  ///
  /// [hitLayoutId]:  The HITLayoutId allows you to use a pre-existing HIT
  /// design with placeholder values and create an additional HIT by providing
  /// those values as HITLayoutParameters.
  ///
  ///  Constraints: Either a Question parameter or a HITLayoutId parameter must
  /// be provided.
  ///
  /// [hitLayoutParameters]:  If the HITLayoutId is provided, any placeholder
  /// values must be filled in with values using the HITLayoutParameter
  /// structure. For more information, see HITLayout.
  Future<CreateHitWithHitTypeResponse> createHitWithHitType(
      {@required String hitTypeId,
      int maxAssignments,
      @required BigInt lifetimeInSeconds,
      String question,
      String requesterAnnotation,
      String uniqueRequestToken,
      ReviewPolicy assignmentReviewPolicy,
      ReviewPolicy hitReviewPolicy,
      String hitLayoutId,
      List<HitLayoutParameter> hitLayoutParameters}) async {
    var response_ = await _client.send('CreateHITWithHITType', {
      'HITTypeId': hitTypeId,
      if (maxAssignments != null) 'MaxAssignments': maxAssignments,
      'LifetimeInSeconds': lifetimeInSeconds,
      if (question != null) 'Question': question,
      if (requesterAnnotation != null)
        'RequesterAnnotation': requesterAnnotation,
      if (uniqueRequestToken != null) 'UniqueRequestToken': uniqueRequestToken,
      if (assignmentReviewPolicy != null)
        'AssignmentReviewPolicy': assignmentReviewPolicy,
      if (hitReviewPolicy != null) 'HITReviewPolicy': hitReviewPolicy,
      if (hitLayoutId != null) 'HITLayoutId': hitLayoutId,
      if (hitLayoutParameters != null)
        'HITLayoutParameters': hitLayoutParameters,
    });
    return CreateHitWithHitTypeResponse.fromJson(response_);
  }

  ///  The `CreateQualificationType` operation creates a new Qualification type,
  /// which is represented by a `QualificationType` data structure.
  ///
  /// [name]:  The name you give to the Qualification type. The type name is
  /// used to represent the Qualification to Workers, and to find the type using
  /// a Qualification type search. It must be unique across all of your
  /// Qualification types.
  ///
  /// [keywords]: One or more words or phrases that describe the Qualification
  /// type, separated by commas. The keywords of a type make the type easier to
  /// find during a search.
  ///
  /// [description]: A long description for the Qualification type. On the
  /// Amazon Mechanical Turk website, the long description is displayed when a
  /// Worker examines a Qualification type.
  ///
  /// [qualificationTypeStatus]: The initial status of the Qualification type.
  ///
  /// Constraints: Valid values are: Active | Inactive
  ///
  /// [retryDelayInSeconds]: The number of seconds that a Worker must wait after
  /// requesting a Qualification of the Qualification type before the worker can
  /// retry the Qualification request.
  ///
  /// Constraints: None. If not specified, retries are disabled and Workers can
  /// request a Qualification of this type only once, even if the Worker has not
  /// been granted the Qualification. It is not possible to disable retries for
  /// a Qualification type after it has been created with retries enabled. If
  /// you want to disable retries, you must delete existing retry-enabled
  /// Qualification type and then create a new Qualification type with retries
  /// disabled.
  ///
  /// [test]:  The questions for the Qualification test a Worker must answer
  /// correctly to obtain a Qualification of this type. If this parameter is
  /// specified, `TestDurationInSeconds` must also be specified.
  ///
  /// Constraints: Must not be longer than 65535 bytes. Must be a QuestionForm
  /// data structure. This parameter cannot be specified if AutoGranted is true.
  ///
  /// Constraints: None. If not specified, the Worker may request the
  /// Qualification without answering any questions.
  ///
  /// [answerKey]: The answers to the Qualification test specified in the Test
  /// parameter, in the form of an AnswerKey data structure.
  ///
  /// Constraints: Must not be longer than 65535 bytes.
  ///
  /// Constraints: None. If not specified, you must process Qualification
  /// requests manually.
  ///
  /// [testDurationInSeconds]: The number of seconds the Worker has to complete
  /// the Qualification test, starting from the time the Worker requests the
  /// Qualification.
  ///
  /// [autoGranted]: Specifies whether requests for the Qualification type are
  /// granted immediately, without prompting the Worker with a Qualification
  /// test.
  ///
  /// Constraints: If the Test parameter is specified, this parameter cannot be
  /// true.
  ///
  /// [autoGrantedValue]: The Qualification value to use for automatically
  /// granted Qualifications. This parameter is used only if the AutoGranted
  /// parameter is true.
  Future<CreateQualificationTypeResponse> createQualificationType(
      {@required String name,
      String keywords,
      @required String description,
      @required String qualificationTypeStatus,
      BigInt retryDelayInSeconds,
      String test,
      String answerKey,
      BigInt testDurationInSeconds,
      bool autoGranted,
      int autoGrantedValue}) async {
    var response_ = await _client.send('CreateQualificationType', {
      'Name': name,
      if (keywords != null) 'Keywords': keywords,
      'Description': description,
      'QualificationTypeStatus': qualificationTypeStatus,
      if (retryDelayInSeconds != null)
        'RetryDelayInSeconds': retryDelayInSeconds,
      if (test != null) 'Test': test,
      if (answerKey != null) 'AnswerKey': answerKey,
      if (testDurationInSeconds != null)
        'TestDurationInSeconds': testDurationInSeconds,
      if (autoGranted != null) 'AutoGranted': autoGranted,
      if (autoGrantedValue != null) 'AutoGrantedValue': autoGrantedValue,
    });
    return CreateQualificationTypeResponse.fromJson(response_);
  }

  /// The `CreateWorkerBlock` operation allows you to prevent a Worker from
  /// working on your HITs. For example, you can block a Worker who is producing
  /// poor quality work. You can block up to 100,000 Workers.
  ///
  /// [workerId]: The ID of the Worker to block.
  ///
  /// [reason]: A message explaining the reason for blocking the Worker. This
  /// parameter enables you to keep track of your Workers. The Worker does not
  /// see this message.
  Future<CreateWorkerBlockResponse> createWorkerBlock(
      {@required String workerId, @required String reason}) async {
    var response_ = await _client.send('CreateWorkerBlock', {
      'WorkerId': workerId,
      'Reason': reason,
    });
    return CreateWorkerBlockResponse.fromJson(response_);
  }

  ///  The `DeleteHIT` operation is used to delete HIT that is no longer needed.
  /// Only the Requester who created the HIT can delete it.
  ///
  ///  You can only dispose of HITs that are in the `Reviewable` state, with all
  /// of their submitted assignments already either approved or rejected. If you
  /// call the DeleteHIT operation on a HIT that is not in the `Reviewable`
  /// state (for example, that has not expired, or still has active
  /// assignments), or on a HIT that is Reviewable but without all of its
  /// submitted assignments already approved or rejected, the service will
  /// return an error.
  ///
  ///   *    HITs are automatically disposed of after 120 days.
  ///
  /// *    After you dispose of a HIT, you can no longer approve the HIT's
  /// rejected assignments.
  ///
  /// *    Disposed HITs are not returned in results for the ListHITs operation.
  ///
  /// *    Disposing HITs can improve the performance of operations such as
  /// ListReviewableHITs and ListHITs.
  ///
  /// [hitId]: The ID of the HIT to be deleted.
  Future<DeleteHitResponse> deleteHit(String hitId) async {
    var response_ = await _client.send('DeleteHIT', {
      'HITId': hitId,
    });
    return DeleteHitResponse.fromJson(response_);
  }

  ///  The `DeleteQualificationType` deletes a Qualification type and deletes
  /// any HIT types that are associated with the Qualification type.
  ///
  /// This operation does not revoke Qualifications already assigned to Workers
  /// because the Qualifications might be needed for active HITs. If there are
  /// any pending requests for the Qualification type, Amazon Mechanical Turk
  /// rejects those requests. After you delete a Qualification type, you can no
  /// longer use it to create HITs or HIT types.
  ///
  ///
  ///
  /// DeleteQualificationType must wait for all the HITs that use the deleted
  /// Qualification type to be deleted before completing. It may take up to 48
  /// hours before DeleteQualificationType completes and the unique name of the
  /// Qualification type is available for reuse with CreateQualificationType.
  ///
  /// [qualificationTypeId]: The ID of the QualificationType to dispose.
  Future<DeleteQualificationTypeResponse> deleteQualificationType(
      String qualificationTypeId) async {
    var response_ = await _client.send('DeleteQualificationType', {
      'QualificationTypeId': qualificationTypeId,
    });
    return DeleteQualificationTypeResponse.fromJson(response_);
  }

  /// The `DeleteWorkerBlock` operation allows you to reinstate a blocked Worker
  /// to work on your HITs. This operation reverses the effects of the
  /// CreateWorkerBlock operation. You need the Worker ID to use this operation.
  /// If the Worker ID is missing or invalid, this operation fails and returns
  /// the message “WorkerId is invalid.” If the specified Worker is not blocked,
  /// this operation returns successfully.
  ///
  /// [workerId]: The ID of the Worker to unblock.
  ///
  /// [reason]: A message that explains the reason for unblocking the Worker.
  /// The Worker does not see this message.
  Future<DeleteWorkerBlockResponse> deleteWorkerBlock(String workerId,
      {String reason}) async {
    var response_ = await _client.send('DeleteWorkerBlock', {
      'WorkerId': workerId,
      if (reason != null) 'Reason': reason,
    });
    return DeleteWorkerBlockResponse.fromJson(response_);
  }

  ///  The `DisassociateQualificationFromWorker` revokes a previously granted
  /// Qualification from a user.
  ///
  ///  You can provide a text message explaining why the Qualification was
  /// revoked. The user who had the Qualification can see this message.
  ///
  /// [workerId]: The ID of the Worker who possesses the Qualification to be
  /// revoked.
  ///
  /// [qualificationTypeId]: The ID of the Qualification type of the
  /// Qualification to be revoked.
  ///
  /// [reason]: A text message that explains why the Qualification was revoked.
  /// The user who had the Qualification sees this message.
  Future<DisassociateQualificationFromWorkerResponse>
      disassociateQualificationFromWorker(
          {@required String workerId,
          @required String qualificationTypeId,
          String reason}) async {
    var response_ = await _client.send('DisassociateQualificationFromWorker', {
      'WorkerId': workerId,
      'QualificationTypeId': qualificationTypeId,
      if (reason != null) 'Reason': reason,
    });
    return DisassociateQualificationFromWorkerResponse.fromJson(response_);
  }

  /// The `GetAccountBalance` operation retrieves the amount of money in your
  /// Amazon Mechanical Turk account.
  Future<GetAccountBalanceResponse> getAccountBalance() async {
    var response_ = await _client.send('GetAccountBalance', {});
    return GetAccountBalanceResponse.fromJson(response_);
  }

  ///  The `GetAssignment` operation retrieves the details of the specified
  /// Assignment.
  ///
  /// [assignmentId]: The ID of the Assignment to be retrieved.
  Future<GetAssignmentResponse> getAssignment(String assignmentId) async {
    var response_ = await _client.send('GetAssignment', {
      'AssignmentId': assignmentId,
    });
    return GetAssignmentResponse.fromJson(response_);
  }

  ///  The `GetFileUploadURL` operation generates and returns a temporary URL.
  /// You use the temporary URL to retrieve a file uploaded by a Worker as an
  /// answer to a FileUploadAnswer question for a HIT. The temporary URL is
  /// generated the instant the GetFileUploadURL operation is called, and is
  /// valid for 60 seconds. You can get a temporary file upload URL any time
  /// until the HIT is disposed. After the HIT is disposed, any uploaded files
  /// are deleted, and cannot be retrieved. Pending Deprecation on December 12,
  /// 2017. The Answer Specification structure will no longer support the
  /// `FileUploadAnswer` element to be used for the QuestionForm data structure.
  /// Instead, we recommend that Requesters who want to create HITs asking
  /// Workers to upload files to use Amazon S3.
  ///
  /// [assignmentId]: The ID of the assignment that contains the question with a
  /// FileUploadAnswer.
  ///
  /// [questionIdentifier]: The identifier of the question with a
  /// FileUploadAnswer, as specified in the QuestionForm of the HIT.
  Future<GetFileUploadUrlResponse> getFileUploadUrl(
      {@required String assignmentId,
      @required String questionIdentifier}) async {
    var response_ = await _client.send('GetFileUploadURL', {
      'AssignmentId': assignmentId,
      'QuestionIdentifier': questionIdentifier,
    });
    return GetFileUploadUrlResponse.fromJson(response_);
  }

  ///  The `GetHIT` operation retrieves the details of the specified HIT.
  ///
  /// [hitId]: The ID of the HIT to be retrieved.
  Future<GetHitResponse> getHit(String hitId) async {
    var response_ = await _client.send('GetHIT', {
      'HITId': hitId,
    });
    return GetHitResponse.fromJson(response_);
  }

  ///  The `GetQualificationScore` operation returns the value of a Worker's
  /// Qualification for a given Qualification type.
  ///
  ///  To get a Worker's Qualification, you must know the Worker's ID. The
  /// Worker's ID is included in the assignment data returned by the
  /// `ListAssignmentsForHIT` operation.
  ///
  /// Only the owner of a Qualification type can query the value of a Worker's
  /// Qualification of that type.
  ///
  /// [qualificationTypeId]: The ID of the QualificationType.
  ///
  /// [workerId]: The ID of the Worker whose Qualification is being updated.
  Future<GetQualificationScoreResponse> getQualificationScore(
      {@required String qualificationTypeId, @required String workerId}) async {
    var response_ = await _client.send('GetQualificationScore', {
      'QualificationTypeId': qualificationTypeId,
      'WorkerId': workerId,
    });
    return GetQualificationScoreResponse.fromJson(response_);
  }

  ///  The `GetQualificationType`operation retrieves information about a
  /// Qualification type using its ID.
  ///
  /// [qualificationTypeId]: The ID of the QualificationType.
  Future<GetQualificationTypeResponse> getQualificationType(
      String qualificationTypeId) async {
    var response_ = await _client.send('GetQualificationType', {
      'QualificationTypeId': qualificationTypeId,
    });
    return GetQualificationTypeResponse.fromJson(response_);
  }

  ///  The `ListAssignmentsForHIT` operation retrieves completed assignments for
  /// a HIT. You can use this operation to retrieve the results for a HIT.
  ///
  ///  You can get assignments for a HIT at any time, even if the HIT is not yet
  /// Reviewable. If a HIT requested multiple assignments, and has received some
  /// results but has not yet become Reviewable, you can still retrieve the
  /// partial results with this operation.
  ///
  ///  Use the AssignmentStatus parameter to control which set of assignments
  /// for a HIT are returned. The ListAssignmentsForHIT operation can return
  /// submitted assignments awaiting approval, or it can return assignments that
  /// have already been approved or rejected. You can set
  /// AssignmentStatus=Approved,Rejected to get assignments that have already
  /// been approved and rejected together in one result set.
  ///
  ///  Only the Requester who created the HIT can retrieve the assignments for
  /// that HIT.
  ///
  ///  Results are sorted and divided into numbered pages and the operation
  /// returns a single page of results. You can use the parameters of the
  /// operation to control sorting and pagination.
  ///
  /// [hitId]: The ID of the HIT.
  ///
  /// [nextToken]: Pagination token
  ///
  /// [assignmentStatuses]: The status of the assignments to return: Submitted |
  /// Approved | Rejected
  Future<ListAssignmentsForHitResponse> listAssignmentsForHit(String hitId,
      {String nextToken,
      int maxResults,
      List<String> assignmentStatuses}) async {
    var response_ = await _client.send('ListAssignmentsForHIT', {
      'HITId': hitId,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (assignmentStatuses != null) 'AssignmentStatuses': assignmentStatuses,
    });
    return ListAssignmentsForHitResponse.fromJson(response_);
  }

  ///  The `ListBonusPayments` operation retrieves the amounts of bonuses you
  /// have paid to Workers for a given HIT or assignment.
  ///
  /// [hitId]: The ID of the HIT associated with the bonus payments to retrieve.
  /// If not specified, all bonus payments for all assignments for the given HIT
  /// are returned. Either the HITId parameter or the AssignmentId parameter
  /// must be specified
  ///
  /// [assignmentId]: The ID of the assignment associated with the bonus
  /// payments to retrieve. If specified, only bonus payments for the given
  /// assignment are returned. Either the HITId parameter or the AssignmentId
  /// parameter must be specified
  ///
  /// [nextToken]: Pagination token
  Future<ListBonusPaymentsResponse> listBonusPayments(
      {String hitId,
      String assignmentId,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListBonusPayments', {
      if (hitId != null) 'HITId': hitId,
      if (assignmentId != null) 'AssignmentId': assignmentId,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListBonusPaymentsResponse.fromJson(response_);
  }

  ///  The `ListHITs` operation returns all of a Requester's HITs. The operation
  /// returns HITs of any status, except for HITs that have been deleted of with
  /// the DeleteHIT operation or that have been auto-deleted.
  ///
  /// [nextToken]: Pagination token
  Future<ListHITsResponse> listHITs({String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListHITs', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListHITsResponse.fromJson(response_);
  }

  ///  The `ListHITsForQualificationType` operation returns the HITs that use
  /// the given Qualification type for a Qualification requirement. The
  /// operation returns HITs of any status, except for HITs that have been
  /// deleted with the `DeleteHIT` operation or that have been auto-deleted.
  ///
  /// [qualificationTypeId]:  The ID of the Qualification type to use when
  /// querying HITs.
  ///
  /// [nextToken]: Pagination Token
  ///
  /// [maxResults]:  Limit the number of results returned.
  Future<ListHITsForQualificationTypeResponse> listHITsForQualificationType(
      String qualificationTypeId,
      {String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListHITsForQualificationType', {
      'QualificationTypeId': qualificationTypeId,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListHITsForQualificationTypeResponse.fromJson(response_);
  }

  ///  The `ListQualificationRequests` operation retrieves requests for
  /// Qualifications of a particular Qualification type. The owner of the
  /// Qualification type calls this operation to poll for pending requests, and
  /// accepts them using the AcceptQualification operation.
  ///
  /// [qualificationTypeId]: The ID of the QualificationType.
  ///
  /// [maxResults]:  The maximum number of results to return in a single call.
  Future<ListQualificationRequestsResponse> listQualificationRequests(
      {String qualificationTypeId, String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListQualificationRequests', {
      if (qualificationTypeId != null)
        'QualificationTypeId': qualificationTypeId,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListQualificationRequestsResponse.fromJson(response_);
  }

  ///  The `ListQualificationTypes` operation returns a list of Qualification
  /// types, filtered by an optional search term.
  ///
  /// [query]:  A text query against all of the searchable attributes of
  /// Qualification types.
  ///
  /// [mustBeRequestable]: Specifies that only Qualification types that a user
  /// can request through the Amazon Mechanical Turk web site, such as by taking
  /// a Qualification test, are returned as results of the search. Some
  /// Qualification types, such as those assigned automatically by the system,
  /// cannot be requested directly by users. If false, all Qualification types,
  /// including those managed by the system, are considered. Valid values are
  /// True | False.
  ///
  /// [mustBeOwnedByCaller]:  Specifies that only Qualification types that the
  /// Requester created are returned. If false, the operation returns all
  /// Qualification types.
  ///
  /// [maxResults]:  The maximum number of results to return in a single call.
  Future<ListQualificationTypesResponse> listQualificationTypes(
      bool mustBeRequestable,
      {String query,
      bool mustBeOwnedByCaller,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListQualificationTypes', {
      if (query != null) 'Query': query,
      'MustBeRequestable': mustBeRequestable,
      if (mustBeOwnedByCaller != null)
        'MustBeOwnedByCaller': mustBeOwnedByCaller,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListQualificationTypesResponse.fromJson(response_);
  }

  ///  The `ListReviewPolicyResultsForHIT` operation retrieves the computed
  /// results and the actions taken in the course of executing your Review
  /// Policies for a given HIT. For information about how to specify Review
  /// Policies when you call CreateHIT, see Review Policies. The
  /// ListReviewPolicyResultsForHIT operation can return results for both
  /// Assignment-level and HIT-level review results.
  ///
  /// [hitId]: The unique identifier of the HIT to retrieve review results for.
  ///
  /// [policyLevels]:  The Policy Level(s) to retrieve review results for - HIT
  /// or Assignment. If omitted, the default behavior is to retrieve all data
  /// for both policy levels. For a list of all the described policies, see
  /// Review Policies.
  ///
  /// [retrieveActions]:  Specify if the operation should retrieve a list of the
  /// actions taken executing the Review Policies and their outcomes.
  ///
  /// [retrieveResults]:  Specify if the operation should retrieve a list of the
  /// results computed by the Review Policies.
  ///
  /// [nextToken]: Pagination token
  ///
  /// [maxResults]: Limit the number of results returned.
  Future<ListReviewPolicyResultsForHitResponse> listReviewPolicyResultsForHit(
      String hitId,
      {List<String> policyLevels,
      bool retrieveActions,
      bool retrieveResults,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListReviewPolicyResultsForHIT', {
      'HITId': hitId,
      if (policyLevels != null) 'PolicyLevels': policyLevels,
      if (retrieveActions != null) 'RetrieveActions': retrieveActions,
      if (retrieveResults != null) 'RetrieveResults': retrieveResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListReviewPolicyResultsForHitResponse.fromJson(response_);
  }

  ///  The `ListReviewableHITs` operation retrieves the HITs with Status equal
  /// to Reviewable or Status equal to Reviewing that belong to the Requester
  /// calling the operation.
  ///
  /// [hitTypeId]:  The ID of the HIT type of the HITs to consider for the
  /// query. If not specified, all HITs for the Reviewer are considered
  ///
  /// [status]:  Can be either `Reviewable` or `Reviewing`. Reviewable is the
  /// default value.
  ///
  /// [nextToken]: Pagination Token
  ///
  /// [maxResults]:  Limit the number of results returned.
  Future<ListReviewableHITsResponse> listReviewableHITs(
      {String hitTypeId,
      String status,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListReviewableHITs', {
      if (hitTypeId != null) 'HITTypeId': hitTypeId,
      if (status != null) 'Status': status,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListReviewableHITsResponse.fromJson(response_);
  }

  /// The `ListWorkersBlocks` operation retrieves a list of Workers who are
  /// blocked from working on your HITs.
  ///
  /// [nextToken]: Pagination token
  Future<ListWorkerBlocksResponse> listWorkerBlocks(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListWorkerBlocks', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListWorkerBlocksResponse.fromJson(response_);
  }

  ///  The `ListWorkersWithQualificationType` operation returns all of the
  /// Workers that have been associated with a given Qualification type.
  ///
  /// [qualificationTypeId]: The ID of the Qualification type of the
  /// Qualifications to return.
  ///
  /// [status]:  The status of the Qualifications to return. Can be `Granted |
  /// Revoked`.
  ///
  /// [nextToken]: Pagination Token
  ///
  /// [maxResults]:  Limit the number of results returned.
  Future<ListWorkersWithQualificationTypeResponse>
      listWorkersWithQualificationType(String qualificationTypeId,
          {String status, String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListWorkersWithQualificationType', {
      'QualificationTypeId': qualificationTypeId,
      if (status != null) 'Status': status,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListWorkersWithQualificationTypeResponse.fromJson(response_);
  }

  ///  The `NotifyWorkers` operation sends an email to one or more Workers that
  /// you specify with the Worker ID. You can specify up to 100 Worker IDs to
  /// send the same message with a single call to the NotifyWorkers operation.
  /// The NotifyWorkers operation will send a notification email to a Worker
  /// only if you have previously approved or rejected work from the Worker.
  ///
  /// [subject]: The subject line of the email message to send. Can include up
  /// to 200 characters.
  ///
  /// [messageText]: The text of the email message to send. Can include up to
  /// 4,096 characters
  ///
  /// [workerIds]: A list of Worker IDs you wish to notify. You can notify upto
  /// 100 Workers at a time.
  Future<NotifyWorkersResponse> notifyWorkers(
      {@required String subject,
      @required String messageText,
      @required List<String> workerIds}) async {
    var response_ = await _client.send('NotifyWorkers', {
      'Subject': subject,
      'MessageText': messageText,
      'WorkerIds': workerIds,
    });
    return NotifyWorkersResponse.fromJson(response_);
  }

  ///  The `RejectAssignment` operation rejects the results of a completed
  /// assignment.
  ///
  ///  You can include an optional feedback message with the rejection, which
  /// the Worker can see in the Status section of the web site. When you include
  /// a feedback message with the rejection, it helps the Worker understand why
  /// the assignment was rejected, and can improve the quality of the results
  /// the Worker submits in the future.
  ///
  ///  Only the Requester who created the HIT can reject an assignment for the
  /// HIT.
  ///
  /// [assignmentId]:  The ID of the assignment. The assignment must correspond
  /// to a HIT created by the Requester.
  ///
  /// [requesterFeedback]:  A message for the Worker, which the Worker can see
  /// in the Status section of the web site.
  Future<RejectAssignmentResponse> rejectAssignment(
      {@required String assignmentId,
      @required String requesterFeedback}) async {
    var response_ = await _client.send('RejectAssignment', {
      'AssignmentId': assignmentId,
      'RequesterFeedback': requesterFeedback,
    });
    return RejectAssignmentResponse.fromJson(response_);
  }

  ///  The `RejectQualificationRequest` operation rejects a user's request for a
  /// Qualification.
  ///
  ///  You can provide a text message explaining why the request was rejected.
  /// The Worker who made the request can see this message.
  ///
  /// [qualificationRequestId]:  The ID of the Qualification request, as
  /// returned by the `ListQualificationRequests` operation.
  ///
  /// [reason]: A text message explaining why the request was rejected, to be
  /// shown to the Worker who made the request.
  Future<RejectQualificationRequestResponse> rejectQualificationRequest(
      String qualificationRequestId,
      {String reason}) async {
    var response_ = await _client.send('RejectQualificationRequest', {
      'QualificationRequestId': qualificationRequestId,
      if (reason != null) 'Reason': reason,
    });
    return RejectQualificationRequestResponse.fromJson(response_);
  }

  ///  The `SendBonus` operation issues a payment of money from your account to
  /// a Worker. This payment happens separately from the reward you pay to the
  /// Worker when you approve the Worker's assignment. The SendBonus operation
  /// requires the Worker's ID and the assignment ID as parameters to initiate
  /// payment of the bonus. You must include a message that explains the reason
  /// for the bonus payment, as the Worker may not be expecting the payment.
  /// Amazon Mechanical Turk collects a fee for bonus payments, similar to the
  /// HIT listing fee. This operation fails if your account does not have enough
  /// funds to pay for both the bonus and the fees.
  ///
  /// [workerId]: The ID of the Worker being paid the bonus.
  ///
  /// [bonusAmount]:  The Bonus amount is a US Dollar amount specified using a
  /// string (for example, "5" represents $5.00 USD and "101.42" represents
  /// $101.42 USD). Do not include currency symbols or currency codes.
  ///
  /// [assignmentId]: The ID of the assignment for which this bonus is paid.
  ///
  /// [reason]: A message that explains the reason for the bonus payment. The
  /// Worker receiving the bonus can see this message.
  ///
  /// [uniqueRequestToken]: A unique identifier for this request, which allows
  /// you to retry the call on error without granting multiple bonuses. This is
  /// useful in cases such as network timeouts where it is unclear whether or
  /// not the call succeeded on the server. If the bonus already exists in the
  /// system from a previous call using the same UniqueRequestToken, subsequent
  /// calls will return an error with a message containing the request ID.
  Future<SendBonusResponse> sendBonus(
      {@required String workerId,
      @required String bonusAmount,
      @required String assignmentId,
      @required String reason,
      String uniqueRequestToken}) async {
    var response_ = await _client.send('SendBonus', {
      'WorkerId': workerId,
      'BonusAmount': bonusAmount,
      'AssignmentId': assignmentId,
      'Reason': reason,
      if (uniqueRequestToken != null) 'UniqueRequestToken': uniqueRequestToken,
    });
    return SendBonusResponse.fromJson(response_);
  }

  ///  The `SendTestEventNotification` operation causes Amazon Mechanical Turk
  /// to send a notification message as if a HIT event occurred, according to
  /// the provided notification specification. This allows you to test
  /// notifications without setting up notifications for a real HIT type and
  /// trying to trigger them using the website. When you call this operation,
  /// the service attempts to send the test notification immediately.
  ///
  /// [notification]:  The notification specification to test. This value is
  /// identical to the value you would provide to the UpdateNotificationSettings
  /// operation when you establish the notification specification for a HIT
  /// type.
  ///
  /// [testEventType]:  The event to simulate to test the notification
  /// specification. This event is included in the test message even if the
  /// notification specification does not include the event type. The
  /// notification specification does not filter out the test event.
  Future<SendTestEventNotificationResponse> sendTestEventNotification(
      {@required NotificationSpecification notification,
      @required String testEventType}) async {
    var response_ = await _client.send('SendTestEventNotification', {
      'Notification': notification,
      'TestEventType': testEventType,
    });
    return SendTestEventNotificationResponse.fromJson(response_);
  }

  ///  The `UpdateExpirationForHIT` operation allows you update the expiration
  /// time of a HIT. If you update it to a time in the past, the HIT will be
  /// immediately expired.
  ///
  /// [hitId]:  The HIT to update.
  ///
  /// [expireAt]:  The date and time at which you want the HIT to expire
  Future<UpdateExpirationForHitResponse> updateExpirationForHit(
      {@required String hitId, @required DateTime expireAt}) async {
    var response_ = await _client.send('UpdateExpirationForHIT', {
      'HITId': hitId,
      'ExpireAt': expireAt,
    });
    return UpdateExpirationForHitResponse.fromJson(response_);
  }

  ///  The `UpdateHITReviewStatus` operation updates the status of a HIT. If the
  /// status is Reviewable, this operation can update the status to Reviewing,
  /// or it can revert a Reviewing HIT back to the Reviewable status.
  ///
  /// [hitId]:  The ID of the HIT to update.
  ///
  /// [revert]:  Specifies how to update the HIT status. Default is `False`.
  ///
  /// *    Setting this to false will only transition a HIT from `Reviewable` to
  /// `Reviewing`
  ///
  /// *    Setting this to true will only transition a HIT from `Reviewing` to
  /// `Reviewable`
  Future<UpdateHitReviewStatusResponse> updateHitReviewStatus(String hitId,
      {bool revert}) async {
    var response_ = await _client.send('UpdateHITReviewStatus', {
      'HITId': hitId,
      if (revert != null) 'Revert': revert,
    });
    return UpdateHitReviewStatusResponse.fromJson(response_);
  }

  ///  The `UpdateHITTypeOfHIT` operation allows you to change the HITType
  /// properties of a HIT. This operation disassociates the HIT from its old
  /// HITType properties and associates it with the new HITType properties. The
  /// HIT takes on the properties of the new HITType in place of the old ones.
  ///
  /// [hitId]: The HIT to update.
  ///
  /// [hitTypeId]: The ID of the new HIT type.
  Future<UpdateHitTypeOfHitResponse> updateHitTypeOfHit(
      {@required String hitId, @required String hitTypeId}) async {
    var response_ = await _client.send('UpdateHITTypeOfHIT', {
      'HITId': hitId,
      'HITTypeId': hitTypeId,
    });
    return UpdateHitTypeOfHitResponse.fromJson(response_);
  }

  ///  The `UpdateNotificationSettings` operation creates, updates, disables or
  /// re-enables notifications for a HIT type. If you call the
  /// UpdateNotificationSettings operation for a HIT type that already has a
  /// notification specification, the operation replaces the old specification
  /// with a new one. You can call the UpdateNotificationSettings operation to
  /// enable or disable notifications for the HIT type, without having to modify
  /// the notification specification itself by providing updates to the Active
  /// status without specifying a new notification specification. To change the
  /// Active status of a HIT type's notifications, the HIT type must already
  /// have a notification specification, or one must be provided in the same
  /// call to `UpdateNotificationSettings`.
  ///
  /// [hitTypeId]:  The ID of the HIT type whose notification specification is
  /// being updated.
  ///
  /// [notification]:  The notification specification for the HIT type.
  ///
  /// [active]:  Specifies whether notifications are sent for HITs of this HIT
  /// type, according to the notification specification. You must specify either
  /// the Notification parameter or the Active parameter for the call to
  /// UpdateNotificationSettings to succeed.
  Future<UpdateNotificationSettingsResponse> updateNotificationSettings(
      String hitTypeId,
      {NotificationSpecification notification,
      bool active}) async {
    var response_ = await _client.send('UpdateNotificationSettings', {
      'HITTypeId': hitTypeId,
      if (notification != null) 'Notification': notification,
      if (active != null) 'Active': active,
    });
    return UpdateNotificationSettingsResponse.fromJson(response_);
  }

  ///  The `UpdateQualificationType` operation modifies the attributes of an
  /// existing Qualification type, which is represented by a QualificationType
  /// data structure. Only the owner of a Qualification type can modify its
  /// attributes.
  ///
  ///  Most attributes of a Qualification type can be changed after the type has
  /// been created. However, the Name and Keywords fields cannot be modified.
  /// The RetryDelayInSeconds parameter can be modified or added to change the
  /// delay or to enable retries, but RetryDelayInSeconds cannot be used to
  /// disable retries.
  ///
  ///  You can use this operation to update the test for a Qualification type.
  /// The test is updated based on the values specified for the Test,
  /// TestDurationInSeconds and AnswerKey parameters. All three parameters
  /// specify the updated test. If you are updating the test for a type, you
  /// must specify the Test and TestDurationInSeconds parameters. The AnswerKey
  /// parameter is optional; omitting it specifies that the updated test does
  /// not have an answer key.
  ///
  ///  If you omit the Test parameter, the test for the Qualification type is
  /// unchanged. There is no way to remove a test from a Qualification type that
  /// has one. If the type already has a test, you cannot update it to be
  /// AutoGranted. If the Qualification type does not have a test and one is
  /// provided by an update, the type will henceforth have a test.
  ///
  ///  If you want to update the test duration or answer key for an existing
  /// test without changing the questions, you must specify a Test parameter
  /// with the original questions, along with the updated values.
  ///
  ///  If you provide an updated Test but no AnswerKey, the new test will not
  /// have an answer key. Requests for such Qualifications must be granted
  /// manually.
  ///
  ///  You can also update the AutoGranted and AutoGrantedValue attributes of
  /// the Qualification type.
  ///
  /// [qualificationTypeId]: The ID of the Qualification type to update.
  ///
  /// [description]: The new description of the Qualification type.
  ///
  /// [qualificationTypeStatus]: The new status of the Qualification type -
  /// Active | Inactive
  ///
  /// [test]: The questions for the Qualification test a Worker must answer
  /// correctly to obtain a Qualification of this type. If this parameter is
  /// specified, `TestDurationInSeconds` must also be specified.
  ///
  /// Constraints: Must not be longer than 65535 bytes. Must be a QuestionForm
  /// data structure. This parameter cannot be specified if AutoGranted is true.
  ///
  /// Constraints: None. If not specified, the Worker may request the
  /// Qualification without answering any questions.
  ///
  /// [answerKey]: The answers to the Qualification test specified in the Test
  /// parameter, in the form of an AnswerKey data structure.
  ///
  /// [testDurationInSeconds]: The number of seconds the Worker has to complete
  /// the Qualification test, starting from the time the Worker requests the
  /// Qualification.
  ///
  /// [retryDelayInSeconds]: The amount of time, in seconds, that Workers must
  /// wait after requesting a Qualification of the specified Qualification type
  /// before they can retry the Qualification request. It is not possible to
  /// disable retries for a Qualification type after it has been created with
  /// retries enabled. If you want to disable retries, you must dispose of the
  /// existing retry-enabled Qualification type using DisposeQualificationType
  /// and then create a new Qualification type with retries disabled using
  /// CreateQualificationType.
  ///
  /// [autoGranted]: Specifies whether requests for the Qualification type are
  /// granted immediately, without prompting the Worker with a Qualification
  /// test.
  ///
  /// Constraints: If the Test parameter is specified, this parameter cannot be
  /// true.
  ///
  /// [autoGrantedValue]: The Qualification value to use for automatically
  /// granted Qualifications. This parameter is used only if the AutoGranted
  /// parameter is true.
  Future<UpdateQualificationTypeResponse> updateQualificationType(
      String qualificationTypeId,
      {String description,
      String qualificationTypeStatus,
      String test,
      String answerKey,
      BigInt testDurationInSeconds,
      BigInt retryDelayInSeconds,
      bool autoGranted,
      int autoGrantedValue}) async {
    var response_ = await _client.send('UpdateQualificationType', {
      'QualificationTypeId': qualificationTypeId,
      if (description != null) 'Description': description,
      if (qualificationTypeStatus != null)
        'QualificationTypeStatus': qualificationTypeStatus,
      if (test != null) 'Test': test,
      if (answerKey != null) 'AnswerKey': answerKey,
      if (testDurationInSeconds != null)
        'TestDurationInSeconds': testDurationInSeconds,
      if (retryDelayInSeconds != null)
        'RetryDelayInSeconds': retryDelayInSeconds,
      if (autoGranted != null) 'AutoGranted': autoGranted,
      if (autoGrantedValue != null) 'AutoGrantedValue': autoGrantedValue,
    });
    return UpdateQualificationTypeResponse.fromJson(response_);
  }
}

class AcceptQualificationRequestResponse {
  AcceptQualificationRequestResponse();
  static AcceptQualificationRequestResponse fromJson(
          Map<String, dynamic> json) =>
      AcceptQualificationRequestResponse();
}

class ApproveAssignmentResponse {
  ApproveAssignmentResponse();
  static ApproveAssignmentResponse fromJson(Map<String, dynamic> json) =>
      ApproveAssignmentResponse();
}

///  The Assignment data structure represents a single assignment of a HIT to a
/// Worker. The assignment tracks the Worker's efforts to complete the HIT, and
/// contains the results for later retrieval.
class Assignment {
  ///  A unique identifier for the assignment.
  final String assignmentId;

  ///  The ID of the Worker who accepted the HIT.
  final String workerId;

  ///  The ID of the HIT.
  final String hitId;

  ///  The status of the assignment.
  final String assignmentStatus;

  ///  If results have been submitted, AutoApprovalTime is the date and time the
  /// results of the assignment results are considered Approved automatically if
  /// they have not already been explicitly approved or rejected by the
  /// Requester. This value is derived from the auto-approval delay specified by
  /// the Requester in the HIT. This value is omitted from the assignment if the
  /// Worker has not yet submitted results.
  final DateTime autoApprovalTime;

  ///  The date and time the Worker accepted the assignment.
  final DateTime acceptTime;

  ///  If the Worker has submitted results, SubmitTime is the date and time the
  /// assignment was submitted. This value is omitted from the assignment if the
  /// Worker has not yet submitted results.
  final DateTime submitTime;

  ///  If the Worker has submitted results and the Requester has approved the
  /// results, ApprovalTime is the date and time the Requester approved the
  /// results. This value is omitted from the assignment if the Requester has
  /// not yet approved the results.
  final DateTime approvalTime;

  ///  If the Worker has submitted results and the Requester has rejected the
  /// results, RejectionTime is the date and time the Requester rejected the
  /// results.
  final DateTime rejectionTime;

  ///  The date and time of the deadline for the assignment. This value is
  /// derived from the deadline specification for the HIT and the date and time
  /// the Worker accepted the HIT.
  final DateTime deadline;

  ///  The Worker's answers submitted for the HIT contained in a
  /// QuestionFormAnswers document, if the Worker provides an answer. If the
  /// Worker does not provide any answers, Answer may contain a
  /// QuestionFormAnswers document, or Answer may be empty.
  final String answer;

  ///  The feedback string included with the call to the ApproveAssignment
  /// operation or the RejectAssignment operation, if the Requester approved or
  /// rejected the assignment and specified feedback.
  final String requesterFeedback;

  Assignment({
    this.assignmentId,
    this.workerId,
    this.hitId,
    this.assignmentStatus,
    this.autoApprovalTime,
    this.acceptTime,
    this.submitTime,
    this.approvalTime,
    this.rejectionTime,
    this.deadline,
    this.answer,
    this.requesterFeedback,
  });
  static Assignment fromJson(Map<String, dynamic> json) => Assignment(
        assignmentId: json.containsKey('AssignmentId')
            ? json['AssignmentId'] as String
            : null,
        workerId:
            json.containsKey('WorkerId') ? json['WorkerId'] as String : null,
        hitId: json.containsKey('HITId') ? json['HITId'] as String : null,
        assignmentStatus: json.containsKey('AssignmentStatus')
            ? json['AssignmentStatus'] as String
            : null,
        autoApprovalTime: json.containsKey('AutoApprovalTime')
            ? DateTime.parse(json['AutoApprovalTime'])
            : null,
        acceptTime: json.containsKey('AcceptTime')
            ? DateTime.parse(json['AcceptTime'])
            : null,
        submitTime: json.containsKey('SubmitTime')
            ? DateTime.parse(json['SubmitTime'])
            : null,
        approvalTime: json.containsKey('ApprovalTime')
            ? DateTime.parse(json['ApprovalTime'])
            : null,
        rejectionTime: json.containsKey('RejectionTime')
            ? DateTime.parse(json['RejectionTime'])
            : null,
        deadline: json.containsKey('Deadline')
            ? DateTime.parse(json['Deadline'])
            : null,
        answer: json.containsKey('Answer') ? json['Answer'] as String : null,
        requesterFeedback: json.containsKey('RequesterFeedback')
            ? json['RequesterFeedback'] as String
            : null,
      );
}

class AssociateQualificationWithWorkerResponse {
  AssociateQualificationWithWorkerResponse();
  static AssociateQualificationWithWorkerResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateQualificationWithWorkerResponse();
}

/// An object representing a Bonus payment paid to a Worker.
class BonusPayment {
  /// The ID of the Worker to whom the bonus was paid.
  final String workerId;

  final String bonusAmount;

  /// The ID of the assignment associated with this bonus payment.
  final String assignmentId;

  /// The Reason text given when the bonus was granted, if any.
  final String reason;

  /// The date and time of when the bonus was granted.
  final DateTime grantTime;

  BonusPayment({
    this.workerId,
    this.bonusAmount,
    this.assignmentId,
    this.reason,
    this.grantTime,
  });
  static BonusPayment fromJson(Map<String, dynamic> json) => BonusPayment(
        workerId:
            json.containsKey('WorkerId') ? json['WorkerId'] as String : null,
        bonusAmount: json.containsKey('BonusAmount')
            ? json['BonusAmount'] as String
            : null,
        assignmentId: json.containsKey('AssignmentId')
            ? json['AssignmentId'] as String
            : null,
        reason: json.containsKey('Reason') ? json['Reason'] as String : null,
        grantTime: json.containsKey('GrantTime')
            ? DateTime.parse(json['GrantTime'])
            : null,
      );
}

class CreateAdditionalAssignmentsForHitResponse {
  CreateAdditionalAssignmentsForHitResponse();
  static CreateAdditionalAssignmentsForHitResponse fromJson(
          Map<String, dynamic> json) =>
      CreateAdditionalAssignmentsForHitResponse();
}

class CreateHitResponse {
  ///  Contains the newly created HIT data. For a description of the HIT data
  /// structure as it appears in responses, see the HIT Data Structure
  /// documentation.
  final Hit hit;

  CreateHitResponse({
    this.hit,
  });
  static CreateHitResponse fromJson(Map<String, dynamic> json) =>
      CreateHitResponse(
        hit: json.containsKey('HIT') ? Hit.fromJson(json['HIT']) : null,
      );
}

class CreateHitTypeResponse {
  ///  The ID of the newly registered HIT type.
  final String hitTypeId;

  CreateHitTypeResponse({
    this.hitTypeId,
  });
  static CreateHitTypeResponse fromJson(Map<String, dynamic> json) =>
      CreateHitTypeResponse(
        hitTypeId:
            json.containsKey('HITTypeId') ? json['HITTypeId'] as String : null,
      );
}

class CreateHitWithHitTypeResponse {
  ///  Contains the newly created HIT data. For a description of the HIT data
  /// structure as it appears in responses, see the HIT Data Structure
  /// documentation.
  final Hit hit;

  CreateHitWithHitTypeResponse({
    this.hit,
  });
  static CreateHitWithHitTypeResponse fromJson(Map<String, dynamic> json) =>
      CreateHitWithHitTypeResponse(
        hit: json.containsKey('HIT') ? Hit.fromJson(json['HIT']) : null,
      );
}

class CreateQualificationTypeResponse {
  /// The created Qualification type, returned as a QualificationType data
  /// structure.
  final QualificationType qualificationType;

  CreateQualificationTypeResponse({
    this.qualificationType,
  });
  static CreateQualificationTypeResponse fromJson(Map<String, dynamic> json) =>
      CreateQualificationTypeResponse(
        qualificationType: json.containsKey('QualificationType')
            ? QualificationType.fromJson(json['QualificationType'])
            : null,
      );
}

class CreateWorkerBlockResponse {
  CreateWorkerBlockResponse();
  static CreateWorkerBlockResponse fromJson(Map<String, dynamic> json) =>
      CreateWorkerBlockResponse();
}

class DeleteHitResponse {
  DeleteHitResponse();
  static DeleteHitResponse fromJson(Map<String, dynamic> json) =>
      DeleteHitResponse();
}

class DeleteQualificationTypeResponse {
  DeleteQualificationTypeResponse();
  static DeleteQualificationTypeResponse fromJson(Map<String, dynamic> json) =>
      DeleteQualificationTypeResponse();
}

class DeleteWorkerBlockResponse {
  DeleteWorkerBlockResponse();
  static DeleteWorkerBlockResponse fromJson(Map<String, dynamic> json) =>
      DeleteWorkerBlockResponse();
}

class DisassociateQualificationFromWorkerResponse {
  DisassociateQualificationFromWorkerResponse();
  static DisassociateQualificationFromWorkerResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateQualificationFromWorkerResponse();
}

class GetAccountBalanceResponse {
  final String availableBalance;

  final String onHoldBalance;

  GetAccountBalanceResponse({
    this.availableBalance,
    this.onHoldBalance,
  });
  static GetAccountBalanceResponse fromJson(Map<String, dynamic> json) =>
      GetAccountBalanceResponse(
        availableBalance: json.containsKey('AvailableBalance')
            ? json['AvailableBalance'] as String
            : null,
        onHoldBalance: json.containsKey('OnHoldBalance')
            ? json['OnHoldBalance'] as String
            : null,
      );
}

class GetAssignmentResponse {
  ///  The assignment. The response includes one Assignment element.
  final Assignment assignment;

  ///  The HIT associated with this assignment. The response includes one HIT
  /// element.
  final Hit hit;

  GetAssignmentResponse({
    this.assignment,
    this.hit,
  });
  static GetAssignmentResponse fromJson(Map<String, dynamic> json) =>
      GetAssignmentResponse(
        assignment: json.containsKey('Assignment')
            ? Assignment.fromJson(json['Assignment'])
            : null,
        hit: json.containsKey('HIT') ? Hit.fromJson(json['HIT']) : null,
      );
}

class GetFileUploadUrlResponse {
  ///  A temporary URL for the file that the Worker uploaded for the answer.
  final String fileUploadUrl;

  GetFileUploadUrlResponse({
    this.fileUploadUrl,
  });
  static GetFileUploadUrlResponse fromJson(Map<String, dynamic> json) =>
      GetFileUploadUrlResponse(
        fileUploadUrl: json.containsKey('FileUploadURL')
            ? json['FileUploadURL'] as String
            : null,
      );
}

class GetHitResponse {
  ///  Contains the requested HIT data.
  final Hit hit;

  GetHitResponse({
    this.hit,
  });
  static GetHitResponse fromJson(Map<String, dynamic> json) => GetHitResponse(
        hit: json.containsKey('HIT') ? Hit.fromJson(json['HIT']) : null,
      );
}

class GetQualificationScoreResponse {
  ///  The Qualification data structure of the Qualification assigned to a user,
  /// including the Qualification type and the value (score).
  final Qualification qualification;

  GetQualificationScoreResponse({
    this.qualification,
  });
  static GetQualificationScoreResponse fromJson(Map<String, dynamic> json) =>
      GetQualificationScoreResponse(
        qualification: json.containsKey('Qualification')
            ? Qualification.fromJson(json['Qualification'])
            : null,
      );
}

class GetQualificationTypeResponse {
  ///  The returned Qualification Type
  final QualificationType qualificationType;

  GetQualificationTypeResponse({
    this.qualificationType,
  });
  static GetQualificationTypeResponse fromJson(Map<String, dynamic> json) =>
      GetQualificationTypeResponse(
        qualificationType: json.containsKey('QualificationType')
            ? QualificationType.fromJson(json['QualificationType'])
            : null,
      );
}

///  The HIT data structure represents a single HIT, including all the
/// information necessary for a Worker to accept and complete the HIT.
class Hit {
  ///  A unique identifier for the HIT.
  final String hitId;

  /// The ID of the HIT type of this HIT
  final String hitTypeId;

  ///  The ID of the HIT Group of this HIT.
  final String hitGroupId;

  ///  The ID of the HIT Layout of this HIT.
  final String hitLayoutId;

  ///  The date and time the HIT was created.
  final DateTime creationTime;

  ///  The title of the HIT.
  final String title;

  ///  A general description of the HIT.
  final String description;

  ///  The data the Worker completing the HIT uses produce the results. This is
  /// either either a QuestionForm, HTMLQuestion or an ExternalQuestion data
  /// structure.
  final String question;

  ///  One or more words or phrases that describe the HIT, separated by commas.
  /// Search terms similar to the keywords of a HIT are more likely to have the
  /// HIT in the search results.
  final String keywords;

  /// The status of the HIT and its assignments. Valid Values are Assignable |
  /// Unassignable | Reviewable | Reviewing | Disposed.
  final String hitStatus;

  /// The number of times the HIT can be accepted and completed before the HIT
  /// becomes unavailable.
  final int maxAssignments;

  final String reward;

  /// The amount of time, in seconds, after the Worker submits an assignment for
  /// the HIT that the results are automatically approved by Amazon Mechanical
  /// Turk. This is the amount of time the Requester has to reject an assignment
  /// submitted by a Worker before the assignment is auto-approved and the
  /// Worker is paid.
  final BigInt autoApprovalDelayInSeconds;

  /// The date and time the HIT expires.
  final DateTime expiration;

  ///  The length of time, in seconds, that a Worker has to complete the HIT
  /// after accepting it.
  final BigInt assignmentDurationInSeconds;

  ///  An arbitrary data field the Requester who created the HIT can use. This
  /// field is visible only to the creator of the HIT.
  final String requesterAnnotation;

  ///  Conditions that a Worker's Qualifications must meet in order to accept
  /// the HIT. A HIT can have between zero and ten Qualification requirements.
  /// All requirements must be met in order for a Worker to accept the HIT.
  /// Additionally, other actions can be restricted using the `ActionsGuarded`
  /// field on each `QualificationRequirement` structure.
  final List<QualificationRequirement> qualificationRequirements;

  ///  Indicates the review status of the HIT. Valid Values are NotReviewed |
  /// MarkedForReview | ReviewedAppropriate | ReviewedInappropriate.
  final String hitReviewStatus;

  ///  The number of assignments for this HIT that are being previewed or have
  /// been accepted by Workers, but have not yet been submitted, returned, or
  /// abandoned.
  final int numberOfAssignmentsPending;

  ///  The number of assignments for this HIT that are available for Workers to
  /// accept.
  final int numberOfAssignmentsAvailable;

  ///  The number of assignments for this HIT that have been approved or
  /// rejected.
  final int numberOfAssignmentsCompleted;

  Hit({
    this.hitId,
    this.hitTypeId,
    this.hitGroupId,
    this.hitLayoutId,
    this.creationTime,
    this.title,
    this.description,
    this.question,
    this.keywords,
    this.hitStatus,
    this.maxAssignments,
    this.reward,
    this.autoApprovalDelayInSeconds,
    this.expiration,
    this.assignmentDurationInSeconds,
    this.requesterAnnotation,
    this.qualificationRequirements,
    this.hitReviewStatus,
    this.numberOfAssignmentsPending,
    this.numberOfAssignmentsAvailable,
    this.numberOfAssignmentsCompleted,
  });
  static Hit fromJson(Map<String, dynamic> json) => Hit(
        hitId: json.containsKey('HITId') ? json['HITId'] as String : null,
        hitTypeId:
            json.containsKey('HITTypeId') ? json['HITTypeId'] as String : null,
        hitGroupId: json.containsKey('HITGroupId')
            ? json['HITGroupId'] as String
            : null,
        hitLayoutId: json.containsKey('HITLayoutId')
            ? json['HITLayoutId'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        title: json.containsKey('Title') ? json['Title'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        question:
            json.containsKey('Question') ? json['Question'] as String : null,
        keywords:
            json.containsKey('Keywords') ? json['Keywords'] as String : null,
        hitStatus:
            json.containsKey('HITStatus') ? json['HITStatus'] as String : null,
        maxAssignments: json.containsKey('MaxAssignments')
            ? json['MaxAssignments'] as int
            : null,
        reward: json.containsKey('Reward') ? json['Reward'] as String : null,
        autoApprovalDelayInSeconds:
            json.containsKey('AutoApprovalDelayInSeconds')
                ? BigInt.from(json['AutoApprovalDelayInSeconds'])
                : null,
        expiration: json.containsKey('Expiration')
            ? DateTime.parse(json['Expiration'])
            : null,
        assignmentDurationInSeconds:
            json.containsKey('AssignmentDurationInSeconds')
                ? BigInt.from(json['AssignmentDurationInSeconds'])
                : null,
        requesterAnnotation: json.containsKey('RequesterAnnotation')
            ? json['RequesterAnnotation'] as String
            : null,
        qualificationRequirements: json.containsKey('QualificationRequirements')
            ? (json['QualificationRequirements'] as List)
                .map((e) => QualificationRequirement.fromJson(e))
                .toList()
            : null,
        hitReviewStatus: json.containsKey('HITReviewStatus')
            ? json['HITReviewStatus'] as String
            : null,
        numberOfAssignmentsPending:
            json.containsKey('NumberOfAssignmentsPending')
                ? json['NumberOfAssignmentsPending'] as int
                : null,
        numberOfAssignmentsAvailable:
            json.containsKey('NumberOfAssignmentsAvailable')
                ? json['NumberOfAssignmentsAvailable'] as int
                : null,
        numberOfAssignmentsCompleted:
            json.containsKey('NumberOfAssignmentsCompleted')
                ? json['NumberOfAssignmentsCompleted'] as int
                : null,
      );
}

///  The HITLayoutParameter data structure defines parameter values used with a
/// HITLayout. A HITLayout is a reusable Amazon Mechanical Turk project template
/// used to provide Human Intelligence Task (HIT) question data for CreateHIT.
class HitLayoutParameter {
  ///  The name of the parameter in the HITLayout.
  final String name;

  /// The value substituted for the parameter referenced in the HITLayout.
  final String value;

  HitLayoutParameter({
    @required this.name,
    @required this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListAssignmentsForHitResponse {
  final String nextToken;

  ///  The number of assignments on the page in the filtered results list,
  /// equivalent to the number of assignments returned by this call.
  final int numResults;

  ///  The collection of Assignment data structures returned by this call.
  final List<Assignment> assignments;

  ListAssignmentsForHitResponse({
    this.nextToken,
    this.numResults,
    this.assignments,
  });
  static ListAssignmentsForHitResponse fromJson(Map<String, dynamic> json) =>
      ListAssignmentsForHitResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        numResults:
            json.containsKey('NumResults') ? json['NumResults'] as int : null,
        assignments: json.containsKey('Assignments')
            ? (json['Assignments'] as List)
                .map((e) => Assignment.fromJson(e))
                .toList()
            : null,
      );
}

class ListBonusPaymentsResponse {
  /// The number of bonus payments on this page in the filtered results list,
  /// equivalent to the number of bonus payments being returned by this call.
  final int numResults;

  final String nextToken;

  /// A successful request to the ListBonusPayments operation returns a list of
  /// BonusPayment objects.
  final List<BonusPayment> bonusPayments;

  ListBonusPaymentsResponse({
    this.numResults,
    this.nextToken,
    this.bonusPayments,
  });
  static ListBonusPaymentsResponse fromJson(Map<String, dynamic> json) =>
      ListBonusPaymentsResponse(
        numResults:
            json.containsKey('NumResults') ? json['NumResults'] as int : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        bonusPayments: json.containsKey('BonusPayments')
            ? (json['BonusPayments'] as List)
                .map((e) => BonusPayment.fromJson(e))
                .toList()
            : null,
      );
}

class ListHITsForQualificationTypeResponse {
  final String nextToken;

  ///  The number of HITs on this page in the filtered results list, equivalent
  /// to the number of HITs being returned by this call.
  final int numResults;

  ///  The list of HIT elements returned by the query.
  final List<Hit> hiTs;

  ListHITsForQualificationTypeResponse({
    this.nextToken,
    this.numResults,
    this.hiTs,
  });
  static ListHITsForQualificationTypeResponse fromJson(
          Map<String, dynamic> json) =>
      ListHITsForQualificationTypeResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        numResults:
            json.containsKey('NumResults') ? json['NumResults'] as int : null,
        hiTs: json.containsKey('HITs')
            ? (json['HITs'] as List).map((e) => Hit.fromJson(e)).toList()
            : null,
      );
}

class ListHITsResponse {
  final String nextToken;

  /// The number of HITs on this page in the filtered results list, equivalent
  /// to the number of HITs being returned by this call.
  final int numResults;

  ///  The list of HIT elements returned by the query.
  final List<Hit> hiTs;

  ListHITsResponse({
    this.nextToken,
    this.numResults,
    this.hiTs,
  });
  static ListHITsResponse fromJson(Map<String, dynamic> json) =>
      ListHITsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        numResults:
            json.containsKey('NumResults') ? json['NumResults'] as int : null,
        hiTs: json.containsKey('HITs')
            ? (json['HITs'] as List).map((e) => Hit.fromJson(e)).toList()
            : null,
      );
}

class ListQualificationRequestsResponse {
  /// The number of Qualification requests on this page in the filtered results
  /// list, equivalent to the number of Qualification requests being returned by
  /// this call.
  final int numResults;

  final String nextToken;

  /// The Qualification request. The response includes one QualificationRequest
  /// element for each Qualification request returned by the query.
  final List<QualificationRequest> qualificationRequests;

  ListQualificationRequestsResponse({
    this.numResults,
    this.nextToken,
    this.qualificationRequests,
  });
  static ListQualificationRequestsResponse fromJson(
          Map<String, dynamic> json) =>
      ListQualificationRequestsResponse(
        numResults:
            json.containsKey('NumResults') ? json['NumResults'] as int : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        qualificationRequests: json.containsKey('QualificationRequests')
            ? (json['QualificationRequests'] as List)
                .map((e) => QualificationRequest.fromJson(e))
                .toList()
            : null,
      );
}

class ListQualificationTypesResponse {
  ///  The number of Qualification types on this page in the filtered results
  /// list, equivalent to the number of types this operation returns.
  final int numResults;

  final String nextToken;

  ///  The list of QualificationType elements returned by the query.
  final List<QualificationType> qualificationTypes;

  ListQualificationTypesResponse({
    this.numResults,
    this.nextToken,
    this.qualificationTypes,
  });
  static ListQualificationTypesResponse fromJson(Map<String, dynamic> json) =>
      ListQualificationTypesResponse(
        numResults:
            json.containsKey('NumResults') ? json['NumResults'] as int : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        qualificationTypes: json.containsKey('QualificationTypes')
            ? (json['QualificationTypes'] as List)
                .map((e) => QualificationType.fromJson(e))
                .toList()
            : null,
      );
}

class ListReviewPolicyResultsForHitResponse {
  /// The HITId of the HIT for which results have been returned.
  final String hitId;

  ///  The name of the Assignment-level Review Policy. This contains only the
  /// PolicyName element.
  final ReviewPolicy assignmentReviewPolicy;

  /// The name of the HIT-level Review Policy. This contains only the PolicyName
  /// element.
  final ReviewPolicy hitReviewPolicy;

  ///  Contains both ReviewResult and ReviewAction elements for an Assignment.
  final ReviewReport assignmentReviewReport;

  /// Contains both ReviewResult and ReviewAction elements for a particular HIT.
  final ReviewReport hitReviewReport;

  final String nextToken;

  ListReviewPolicyResultsForHitResponse({
    this.hitId,
    this.assignmentReviewPolicy,
    this.hitReviewPolicy,
    this.assignmentReviewReport,
    this.hitReviewReport,
    this.nextToken,
  });
  static ListReviewPolicyResultsForHitResponse fromJson(
          Map<String, dynamic> json) =>
      ListReviewPolicyResultsForHitResponse(
        hitId: json.containsKey('HITId') ? json['HITId'] as String : null,
        assignmentReviewPolicy: json.containsKey('AssignmentReviewPolicy')
            ? ReviewPolicy.fromJson(json['AssignmentReviewPolicy'])
            : null,
        hitReviewPolicy: json.containsKey('HITReviewPolicy')
            ? ReviewPolicy.fromJson(json['HITReviewPolicy'])
            : null,
        assignmentReviewReport: json.containsKey('AssignmentReviewReport')
            ? ReviewReport.fromJson(json['AssignmentReviewReport'])
            : null,
        hitReviewReport: json.containsKey('HITReviewReport')
            ? ReviewReport.fromJson(json['HITReviewReport'])
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListReviewableHITsResponse {
  final String nextToken;

  ///  The number of HITs on this page in the filtered results list, equivalent
  /// to the number of HITs being returned by this call.
  final int numResults;

  ///  The list of HIT elements returned by the query.
  final List<Hit> hiTs;

  ListReviewableHITsResponse({
    this.nextToken,
    this.numResults,
    this.hiTs,
  });
  static ListReviewableHITsResponse fromJson(Map<String, dynamic> json) =>
      ListReviewableHITsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        numResults:
            json.containsKey('NumResults') ? json['NumResults'] as int : null,
        hiTs: json.containsKey('HITs')
            ? (json['HITs'] as List).map((e) => Hit.fromJson(e)).toList()
            : null,
      );
}

class ListWorkerBlocksResponse {
  final String nextToken;

  ///  The number of assignments on the page in the filtered results list,
  /// equivalent to the number of assignments returned by this call.
  final int numResults;

  ///  The list of WorkerBlocks, containing the collection of Worker IDs and
  /// reasons for blocking.
  final List<WorkerBlock> workerBlocks;

  ListWorkerBlocksResponse({
    this.nextToken,
    this.numResults,
    this.workerBlocks,
  });
  static ListWorkerBlocksResponse fromJson(Map<String, dynamic> json) =>
      ListWorkerBlocksResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        numResults:
            json.containsKey('NumResults') ? json['NumResults'] as int : null,
        workerBlocks: json.containsKey('WorkerBlocks')
            ? (json['WorkerBlocks'] as List)
                .map((e) => WorkerBlock.fromJson(e))
                .toList()
            : null,
      );
}

class ListWorkersWithQualificationTypeResponse {
  final String nextToken;

  ///  The number of Qualifications on this page in the filtered results list,
  /// equivalent to the number of Qualifications being returned by this call.
  final int numResults;

  ///  The list of Qualification elements returned by this call.
  final List<Qualification> qualifications;

  ListWorkersWithQualificationTypeResponse({
    this.nextToken,
    this.numResults,
    this.qualifications,
  });
  static ListWorkersWithQualificationTypeResponse fromJson(
          Map<String, dynamic> json) =>
      ListWorkersWithQualificationTypeResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        numResults:
            json.containsKey('NumResults') ? json['NumResults'] as int : null,
        qualifications: json.containsKey('Qualifications')
            ? (json['Qualifications'] as List)
                .map((e) => Qualification.fromJson(e))
                .toList()
            : null,
      );
}

/// The Locale data structure represents a geographical region or location.
class Locale {
  ///  The country of the locale. Must be a valid ISO 3166 country code. For
  /// example, the code US refers to the United States of America.
  final String country;

  /// The state or subdivision of the locale. A valid ISO 3166-2 subdivision
  /// code. For example, the code WA refers to the state of Washington.
  final String subdivision;

  Locale({
    @required this.country,
    this.subdivision,
  });
  static Locale fromJson(Map<String, dynamic> json) => Locale(
        country: json['Country'] as String,
        subdivision: json.containsKey('Subdivision')
            ? json['Subdivision'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The NotificationSpecification data structure describes a HIT event
/// notification for a HIT type.
class NotificationSpecification {
  ///  The target for notification messages. The Destination’s format is
  /// determined by the specified Transport:
  ///
  /// *   When Transport is Email, the Destination is your email address.
  ///
  /// *   When Transport is SQS, the Destination is your queue URL.
  ///
  /// *   When Transport is SNS, the Destination is the ARN of your topic.
  final String destination;

  ///  The method Amazon Mechanical Turk uses to send the notification. Valid
  /// Values: Email | SQS | SNS.
  final String transport;

  /// The version of the Notification API to use. Valid value is 2006-05-05.
  final String version;

  ///  The list of events that should cause notifications to be sent. Valid
  /// Values: AssignmentAccepted | AssignmentAbandoned | AssignmentReturned |
  /// AssignmentSubmitted | AssignmentRejected | AssignmentApproved | HITCreated
  /// | HITExtended | HITDisposed | HITReviewable | HITExpired | Ping. The Ping
  /// event is only valid for the SendTestEventNotification operation.
  final List<String> eventTypes;

  NotificationSpecification({
    @required this.destination,
    @required this.transport,
    @required this.version,
    @required this.eventTypes,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  When MTurk encounters an issue with notifying the Workers you specified, it
/// returns back this object with failure details.
class NotifyWorkersFailureStatus {
  ///  Encoded value for the failure type.
  final String notifyWorkersFailureCode;

  ///  A message detailing the reason the Worker could not be notified.
  final String notifyWorkersFailureMessage;

  ///  The ID of the Worker.
  final String workerId;

  NotifyWorkersFailureStatus({
    this.notifyWorkersFailureCode,
    this.notifyWorkersFailureMessage,
    this.workerId,
  });
  static NotifyWorkersFailureStatus fromJson(Map<String, dynamic> json) =>
      NotifyWorkersFailureStatus(
        notifyWorkersFailureCode: json.containsKey('NotifyWorkersFailureCode')
            ? json['NotifyWorkersFailureCode'] as String
            : null,
        notifyWorkersFailureMessage:
            json.containsKey('NotifyWorkersFailureMessage')
                ? json['NotifyWorkersFailureMessage'] as String
                : null,
        workerId:
            json.containsKey('WorkerId') ? json['WorkerId'] as String : null,
      );
}

class NotifyWorkersResponse {
  ///  When MTurk sends notifications to the list of Workers, it returns back
  /// any failures it encounters in this list of NotifyWorkersFailureStatus
  /// objects.
  final List<NotifyWorkersFailureStatus> notifyWorkersFailureStatuses;

  NotifyWorkersResponse({
    this.notifyWorkersFailureStatuses,
  });
  static NotifyWorkersResponse fromJson(Map<String, dynamic> json) =>
      NotifyWorkersResponse(
        notifyWorkersFailureStatuses:
            json.containsKey('NotifyWorkersFailureStatuses')
                ? (json['NotifyWorkersFailureStatuses'] as List)
                    .map((e) => NotifyWorkersFailureStatus.fromJson(e))
                    .toList()
                : null,
      );
}

///  This data structure is the data type for the AnswerKey parameter of the
/// ScoreMyKnownAnswers/2011-09-01 Review Policy.
class ParameterMapEntry {
  ///  The QuestionID from the HIT that is used to identify which question
  /// requires Mechanical Turk to score as part of the
  /// ScoreMyKnownAnswers/2011-09-01 Review Policy.
  final String key;

  ///  The list of answers to the question specified in the MapEntry Key
  /// element. The Worker must match all values in order for the answer to be
  /// scored correctly.
  final List<String> values;

  ParameterMapEntry({
    this.key,
    this.values,
  });
  static ParameterMapEntry fromJson(Map<String, dynamic> json) =>
      ParameterMapEntry(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        values: json.containsKey('Values')
            ? (json['Values'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  Name of the parameter from the Review policy.
class PolicyParameter {
  ///  Name of the parameter from the list of Review Polices.
  final String key;

  ///  The list of values of the Parameter
  final List<String> values;

  ///  List of ParameterMapEntry objects.
  final List<ParameterMapEntry> mapEntries;

  PolicyParameter({
    this.key,
    this.values,
    this.mapEntries,
  });
  static PolicyParameter fromJson(Map<String, dynamic> json) => PolicyParameter(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        values: json.containsKey('Values')
            ? (json['Values'] as List).map((e) => e as String).toList()
            : null,
        mapEntries: json.containsKey('MapEntries')
            ? (json['MapEntries'] as List)
                .map((e) => ParameterMapEntry.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The Qualification data structure represents a Qualification assigned to a
/// user, including the Qualification type and the value (score).
class Qualification {
  ///  The ID of the Qualification type for the Qualification.
  final String qualificationTypeId;

  ///  The ID of the Worker who possesses the Qualification.
  final String workerId;

  ///  The date and time the Qualification was granted to the Worker. If the
  /// Worker's Qualification was revoked, and then re-granted based on a new
  /// Qualification request, GrantTime is the date and time of the last call to
  /// the AcceptQualificationRequest operation.
  final DateTime grantTime;

  ///  The value (score) of the Qualification, if the Qualification has an
  /// integer value.
  final int integerValue;

  final Locale localeValue;

  ///  The status of the Qualification. Valid values are Granted | Revoked.
  final String status;

  Qualification({
    this.qualificationTypeId,
    this.workerId,
    this.grantTime,
    this.integerValue,
    this.localeValue,
    this.status,
  });
  static Qualification fromJson(Map<String, dynamic> json) => Qualification(
        qualificationTypeId: json.containsKey('QualificationTypeId')
            ? json['QualificationTypeId'] as String
            : null,
        workerId:
            json.containsKey('WorkerId') ? json['WorkerId'] as String : null,
        grantTime: json.containsKey('GrantTime')
            ? DateTime.parse(json['GrantTime'])
            : null,
        integerValue: json.containsKey('IntegerValue')
            ? json['IntegerValue'] as int
            : null,
        localeValue: json.containsKey('LocaleValue')
            ? Locale.fromJson(json['LocaleValue'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

///  The QualificationRequest data structure represents a request a Worker has
/// made for a Qualification.
class QualificationRequest {
  /// The ID of the Qualification request, a unique identifier generated when
  /// the request was submitted.
  final String qualificationRequestId;

  ///  The ID of the Qualification type the Worker is requesting, as returned by
  /// the CreateQualificationType operation.
  final String qualificationTypeId;

  ///  The ID of the Worker requesting the Qualification.
  final String workerId;

  ///  The contents of the Qualification test that was presented to the Worker,
  /// if the type has a test and the Worker has submitted answers. This value is
  /// identical to the QuestionForm associated with the Qualification type at
  /// the time the Worker requests the Qualification.
  final String test;

  ///  The Worker's answers for the Qualification type's test contained in a
  /// QuestionFormAnswers document, if the type has a test and the Worker has
  /// submitted answers. If the Worker does not provide any answers, Answer may
  /// be empty.
  final String answer;

  /// The date and time the Qualification request had a status of Submitted.
  /// This is either the time the Worker submitted answers for a Qualification
  /// test, or the time the Worker requested the Qualification if the
  /// Qualification type does not have a test.
  final DateTime submitTime;

  QualificationRequest({
    this.qualificationRequestId,
    this.qualificationTypeId,
    this.workerId,
    this.test,
    this.answer,
    this.submitTime,
  });
  static QualificationRequest fromJson(Map<String, dynamic> json) =>
      QualificationRequest(
        qualificationRequestId: json.containsKey('QualificationRequestId')
            ? json['QualificationRequestId'] as String
            : null,
        qualificationTypeId: json.containsKey('QualificationTypeId')
            ? json['QualificationTypeId'] as String
            : null,
        workerId:
            json.containsKey('WorkerId') ? json['WorkerId'] as String : null,
        test: json.containsKey('Test') ? json['Test'] as String : null,
        answer: json.containsKey('Answer') ? json['Answer'] as String : null,
        submitTime: json.containsKey('SubmitTime')
            ? DateTime.parse(json['SubmitTime'])
            : null,
      );
}

///  The QualificationRequirement data structure describes a Qualification that
/// a Worker must have before the Worker is allowed to accept a HIT. A
/// requirement may optionally state that a Worker must have the Qualification
/// in order to preview the HIT, or see the HIT in search results.
class QualificationRequirement {
  ///  The ID of the Qualification type for the requirement.
  final String qualificationTypeId;

  /// The kind of comparison to make against a Qualification's value. You can
  /// compare a Qualification's value to an IntegerValue to see if it is
  /// LessThan, LessThanOrEqualTo, GreaterThan, GreaterThanOrEqualTo, EqualTo,
  /// or NotEqualTo the IntegerValue. You can compare it to a LocaleValue to see
  /// if it is EqualTo, or NotEqualTo the LocaleValue. You can check to see if
  /// the value is In or NotIn a set of IntegerValue or LocaleValue values.
  /// Lastly, a Qualification requirement can also test if a Qualification
  /// Exists or DoesNotExist in the user's profile, regardless of its value.
  final String comparator;

  ///  The integer value to compare against the Qualification's value.
  /// IntegerValue must not be present if Comparator is Exists or DoesNotExist.
  /// IntegerValue can only be used if the Qualification type has an integer
  /// value; it cannot be used with the Worker_Locale QualificationType ID. When
  /// performing a set comparison by using the In or the NotIn comparator, you
  /// can use up to 15 IntegerValue elements in a QualificationRequirement data
  /// structure.
  final List<int> integerValues;

  ///  The locale value to compare against the Qualification's value. The local
  /// value must be a valid ISO 3166 country code or supports ISO 3166-2
  /// subdivisions. LocaleValue can only be used with a Worker_Locale
  /// QualificationType ID. LocaleValue can only be used with the EqualTo,
  /// NotEqualTo, In, and NotIn comparators. You must only use a single
  /// LocaleValue element when using the EqualTo or NotEqualTo comparators. When
  /// performing a set comparison by using the In or the NotIn comparator, you
  /// can use up to 30 LocaleValue elements in a QualificationRequirement data
  /// structure.
  final List<Locale> localeValues;

  ///  DEPRECATED: Use the `ActionsGuarded` field instead. If RequiredToPreview
  /// is true, the question data for the HIT will not be shown when a Worker
  /// whose Qualifications do not meet this requirement tries to preview the
  /// HIT. That is, a Worker's Qualifications must meet all of the requirements
  /// for which RequiredToPreview is true in order to preview the HIT. If a
  /// Worker meets all of the requirements where RequiredToPreview is true (or
  /// if there are no such requirements), but does not meet all of the
  /// requirements for the HIT, the Worker will be allowed to preview the HIT's
  /// question data, but will not be allowed to accept and complete the HIT. The
  /// default is false. This should not be used in combination with the
  /// `ActionsGuarded` field.
  final bool requiredToPreview;

  ///  Setting this attribute prevents Workers whose Qualifications do not meet
  /// this QualificationRequirement from taking the specified action. Valid
  /// arguments include "Accept" (Worker cannot accept the HIT, but can preview
  /// the HIT and see it in their search results), "PreviewAndAccept" (Worker
  /// cannot accept or preview the HIT, but can see the HIT in their search
  /// results), and "DiscoverPreviewAndAccept" (Worker cannot accept, preview,
  /// or see the HIT in their search results). It's possible for you to create a
  /// HIT with multiple QualificationRequirements (which can have different
  /// values for the ActionGuarded attribute). In this case, the Worker is only
  /// permitted to perform an action when they have met all
  /// QualificationRequirements guarding the action. The actions in the order of
  /// least restrictive to most restrictive are Discover, Preview and Accept.
  /// For example, if a Worker meets all QualificationRequirements that are set
  /// to DiscoverPreviewAndAccept, but do not meet all requirements that are set
  /// with PreviewAndAccept, then the Worker will be able to Discover, i.e. see
  /// the HIT in their search result, but will not be able to Preview or Accept
  /// the HIT. ActionsGuarded should not be used in combination with the
  /// `RequiredToPreview` field.
  final String actionsGuarded;

  QualificationRequirement({
    @required this.qualificationTypeId,
    @required this.comparator,
    this.integerValues,
    this.localeValues,
    this.requiredToPreview,
    this.actionsGuarded,
  });
  static QualificationRequirement fromJson(Map<String, dynamic> json) =>
      QualificationRequirement(
        qualificationTypeId: json['QualificationTypeId'] as String,
        comparator: json['Comparator'] as String,
        integerValues: json.containsKey('IntegerValues')
            ? (json['IntegerValues'] as List).map((e) => e as int).toList()
            : null,
        localeValues: json.containsKey('LocaleValues')
            ? (json['LocaleValues'] as List)
                .map((e) => Locale.fromJson(e))
                .toList()
            : null,
        requiredToPreview: json.containsKey('RequiredToPreview')
            ? json['RequiredToPreview'] as bool
            : null,
        actionsGuarded: json.containsKey('ActionsGuarded')
            ? json['ActionsGuarded'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  The QualificationType data structure represents a Qualification type, a
/// description of a property of a Worker that must match the requirements of a
/// HIT for the Worker to be able to accept the HIT. The type also describes how
/// a Worker can obtain a Qualification of that type, such as through a
/// Qualification test.
class QualificationType {
  ///  A unique identifier for the Qualification type. A Qualification type is
  /// given a Qualification type ID when you call the CreateQualificationType
  /// operation.
  final String qualificationTypeId;

  ///  The date and time the Qualification type was created.
  final DateTime creationTime;

  ///  The name of the Qualification type. The type name is used to identify the
  /// type, and to find the type using a Qualification type search.
  final String name;

  ///  A long description for the Qualification type.
  final String description;

  ///  One or more words or phrases that describe theQualification type,
  /// separated by commas. The Keywords make the type easier to find using a
  /// search.
  final String keywords;

  ///  The status of the Qualification type. A Qualification type's status
  /// determines if users can apply to receive a Qualification of this type, and
  /// if HITs can be created with requirements based on this type. Valid values
  /// are Active | Inactive.
  final String qualificationTypeStatus;

  ///  The questions for a Qualification test associated with this Qualification
  /// type that a user can take to obtain a Qualification of this type. This
  /// parameter must be specified if AnswerKey is present. A Qualification type
  /// cannot have both a specified Test parameter and an AutoGranted value of
  /// true.
  final String test;

  ///  The amount of time, in seconds, given to a Worker to complete the
  /// Qualification test, beginning from the time the Worker requests the
  /// Qualification.
  final BigInt testDurationInSeconds;

  /// The answers to the Qualification test specified in the Test parameter.
  final String answerKey;

  ///  The amount of time, in seconds, Workers must wait after taking the
  /// Qualification test before they can take it again. Workers can take a
  /// Qualification test multiple times if they were not granted the
  /// Qualification from a previous attempt, or if the test offers a gradient
  /// score and they want a better score. If not specified, retries are disabled
  /// and Workers can request a Qualification only once.
  final BigInt retryDelayInSeconds;

  ///  Specifies whether the Qualification type is one that a user can request
  /// through the Amazon Mechanical Turk web site, such as by taking a
  /// Qualification test. This value is False for Qualifications assigned
  /// automatically by the system. Valid values are True | False.
  final bool isRequestable;

  /// Specifies that requests for the Qualification type are granted
  /// immediately, without prompting the Worker with a Qualification test. Valid
  /// values are True | False.
  final bool autoGranted;

  ///  The Qualification integer value to use for automatically granted
  /// Qualifications, if AutoGranted is true. This is 1 by default.
  final int autoGrantedValue;

  QualificationType({
    this.qualificationTypeId,
    this.creationTime,
    this.name,
    this.description,
    this.keywords,
    this.qualificationTypeStatus,
    this.test,
    this.testDurationInSeconds,
    this.answerKey,
    this.retryDelayInSeconds,
    this.isRequestable,
    this.autoGranted,
    this.autoGrantedValue,
  });
  static QualificationType fromJson(Map<String, dynamic> json) =>
      QualificationType(
        qualificationTypeId: json.containsKey('QualificationTypeId')
            ? json['QualificationTypeId'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        keywords:
            json.containsKey('Keywords') ? json['Keywords'] as String : null,
        qualificationTypeStatus: json.containsKey('QualificationTypeStatus')
            ? json['QualificationTypeStatus'] as String
            : null,
        test: json.containsKey('Test') ? json['Test'] as String : null,
        testDurationInSeconds: json.containsKey('TestDurationInSeconds')
            ? BigInt.from(json['TestDurationInSeconds'])
            : null,
        answerKey:
            json.containsKey('AnswerKey') ? json['AnswerKey'] as String : null,
        retryDelayInSeconds: json.containsKey('RetryDelayInSeconds')
            ? BigInt.from(json['RetryDelayInSeconds'])
            : null,
        isRequestable: json.containsKey('IsRequestable')
            ? json['IsRequestable'] as bool
            : null,
        autoGranted: json.containsKey('AutoGranted')
            ? json['AutoGranted'] as bool
            : null,
        autoGrantedValue: json.containsKey('AutoGrantedValue')
            ? json['AutoGrantedValue'] as int
            : null,
      );
}

class RejectAssignmentResponse {
  RejectAssignmentResponse();
  static RejectAssignmentResponse fromJson(Map<String, dynamic> json) =>
      RejectAssignmentResponse();
}

class RejectQualificationRequestResponse {
  RejectQualificationRequestResponse();
  static RejectQualificationRequestResponse fromJson(
          Map<String, dynamic> json) =>
      RejectQualificationRequestResponse();
}

///  Both the AssignmentReviewReport and the HITReviewReport elements contains
/// the ReviewActionDetail data structure. This structure is returned multiple
/// times for each action specified in the Review Policy.
class ReviewActionDetail {
  /// The unique identifier for the action.
  final String actionId;

  ///  The nature of the action itself. The Review Policy is responsible for
  /// examining the HIT and Assignments, emitting results, and deciding which
  /// other actions will be necessary.
  final String actionName;

  ///  The specific HITId or AssignmentID targeted by the action.
  final String targetId;

  ///  The type of object in TargetId.
  final String targetType;

  ///  The current disposition of the action: INTENDED, SUCCEEDED, FAILED, or
  /// CANCELLED.
  final String status;

  ///  The date when the action was completed.
  final DateTime completeTime;

  ///  A description of the outcome of the review.
  final String result;

  ///  Present only when the Results have a FAILED Status.
  final String errorCode;

  ReviewActionDetail({
    this.actionId,
    this.actionName,
    this.targetId,
    this.targetType,
    this.status,
    this.completeTime,
    this.result,
    this.errorCode,
  });
  static ReviewActionDetail fromJson(Map<String, dynamic> json) =>
      ReviewActionDetail(
        actionId:
            json.containsKey('ActionId') ? json['ActionId'] as String : null,
        actionName: json.containsKey('ActionName')
            ? json['ActionName'] as String
            : null,
        targetId:
            json.containsKey('TargetId') ? json['TargetId'] as String : null,
        targetType: json.containsKey('TargetType')
            ? json['TargetType'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        completeTime: json.containsKey('CompleteTime')
            ? DateTime.parse(json['CompleteTime'])
            : null,
        result: json.containsKey('Result') ? json['Result'] as String : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
      );
}

///  HIT Review Policy data structures represent HIT review policies, which you
/// specify when you create a HIT.
class ReviewPolicy {
  ///  Name of a Review Policy: SimplePlurality/2011-09-01 or
  /// ScoreMyKnownAnswers/2011-09-01
  final String policyName;

  /// Name of the parameter from the Review policy.
  final List<PolicyParameter> parameters;

  ReviewPolicy({
    @required this.policyName,
    this.parameters,
  });
  static ReviewPolicy fromJson(Map<String, dynamic> json) => ReviewPolicy(
        policyName: json['PolicyName'] as String,
        parameters: json.containsKey('Parameters')
            ? (json['Parameters'] as List)
                .map((e) => PolicyParameter.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  Contains both ReviewResult and ReviewAction elements for a particular HIT.
class ReviewReport {
  ///  A list of ReviewResults objects for each action specified in the Review
  /// Policy.
  final List<ReviewResultDetail> reviewResults;

  ///  A list of ReviewAction objects for each action specified in the Review
  /// Policy.
  final List<ReviewActionDetail> reviewActions;

  ReviewReport({
    this.reviewResults,
    this.reviewActions,
  });
  static ReviewReport fromJson(Map<String, dynamic> json) => ReviewReport(
        reviewResults: json.containsKey('ReviewResults')
            ? (json['ReviewResults'] as List)
                .map((e) => ReviewResultDetail.fromJson(e))
                .toList()
            : null,
        reviewActions: json.containsKey('ReviewActions')
            ? (json['ReviewActions'] as List)
                .map((e) => ReviewActionDetail.fromJson(e))
                .toList()
            : null,
      );
}

///  This data structure is returned multiple times for each result specified in
/// the Review Policy.
class ReviewResultDetail {
  ///  A unique identifier of the Review action result.
  final String actionId;

  /// The HITID or AssignmentId about which this result was taken. Note that
  /// HIT-level Review Policies will often emit results about both the HIT
  /// itself and its Assignments, while Assignment-level review policies
  /// generally only emit results about the Assignment itself.
  final String subjectId;

  ///  The type of the object from the SubjectId field.
  final String subjectType;

  ///  Specifies the QuestionId the result is describing. Depending on whether
  /// the TargetType is a HIT or Assignment this results could specify multiple
  /// values. If TargetType is HIT and QuestionId is absent, then the result
  /// describes results of the HIT, including the HIT agreement score. If
  /// ObjectType is Assignment and QuestionId is absent, then the result
  /// describes the Worker's performance on the HIT.
  final String questionId;

  ///  Key identifies the particular piece of reviewed information.
  final String key;

  ///  The values of Key provided by the review policies you have selected.
  final String value;

  ReviewResultDetail({
    this.actionId,
    this.subjectId,
    this.subjectType,
    this.questionId,
    this.key,
    this.value,
  });
  static ReviewResultDetail fromJson(Map<String, dynamic> json) =>
      ReviewResultDetail(
        actionId:
            json.containsKey('ActionId') ? json['ActionId'] as String : null,
        subjectId:
            json.containsKey('SubjectId') ? json['SubjectId'] as String : null,
        subjectType: json.containsKey('SubjectType')
            ? json['SubjectType'] as String
            : null,
        questionId: json.containsKey('QuestionId')
            ? json['QuestionId'] as String
            : null,
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
}

class SendBonusResponse {
  SendBonusResponse();
  static SendBonusResponse fromJson(Map<String, dynamic> json) =>
      SendBonusResponse();
}

class SendTestEventNotificationResponse {
  SendTestEventNotificationResponse();
  static SendTestEventNotificationResponse fromJson(
          Map<String, dynamic> json) =>
      SendTestEventNotificationResponse();
}

class UpdateExpirationForHitResponse {
  UpdateExpirationForHitResponse();
  static UpdateExpirationForHitResponse fromJson(Map<String, dynamic> json) =>
      UpdateExpirationForHitResponse();
}

class UpdateHitReviewStatusResponse {
  UpdateHitReviewStatusResponse();
  static UpdateHitReviewStatusResponse fromJson(Map<String, dynamic> json) =>
      UpdateHitReviewStatusResponse();
}

class UpdateHitTypeOfHitResponse {
  UpdateHitTypeOfHitResponse();
  static UpdateHitTypeOfHitResponse fromJson(Map<String, dynamic> json) =>
      UpdateHitTypeOfHitResponse();
}

class UpdateNotificationSettingsResponse {
  UpdateNotificationSettingsResponse();
  static UpdateNotificationSettingsResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateNotificationSettingsResponse();
}

class UpdateQualificationTypeResponse {
  ///  Contains a QualificationType data structure.
  final QualificationType qualificationType;

  UpdateQualificationTypeResponse({
    this.qualificationType,
  });
  static UpdateQualificationTypeResponse fromJson(Map<String, dynamic> json) =>
      UpdateQualificationTypeResponse(
        qualificationType: json.containsKey('QualificationType')
            ? QualificationType.fromJson(json['QualificationType'])
            : null,
      );
}

///  The WorkerBlock data structure represents a Worker who has been blocked. It
/// has two elements: the WorkerId and the Reason for the block.
class WorkerBlock {
  ///  The ID of the Worker who accepted the HIT.
  final String workerId;

  ///  A message explaining the reason the Worker was blocked.
  final String reason;

  WorkerBlock({
    this.workerId,
    this.reason,
  });
  static WorkerBlock fromJson(Map<String, dynamic> json) => WorkerBlock(
        workerId:
            json.containsKey('WorkerId') ? json['WorkerId'] as String : null,
        reason: json.containsKey('Reason') ? json['Reason'] as String : null,
      );
}
