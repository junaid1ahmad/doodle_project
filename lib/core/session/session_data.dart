class SessionData {
  Data? data;



  static final SessionData _sessionData = SessionData._internal();

  SessionData._internal();

  factory SessionData() => _sessionData;

  SessionData.fromJson(Map<String, dynamic> json) {
    _sessionData.data = Data.fromJson(json['data'] as Map<String, dynamic>);

  }

  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),

    // 'parentUserId': parentUserId,
    // 'childUserData': childUserData?.toJson(),
    // 'parentUserData': parentUserData?.toJson(),
    // 'childUserData': childUserData?.toJson(),
  };
}
class Data {
  Data({
    required this.userId,
    required this.userType,
    required this.userTypes,
    required this.member,
    // required this.member1,
    required this.token,
    required this.permissions,
    required this.cart,
    required this.userpermission,
    required this.cartNegotiation,
    required this.ISLACALLOWED,
    required this.successStatus,
  });
  late String userId;
  late List<dynamic> userTypes;
  late String successStatus;
  // late Member member1;
  late Member member;
  late String token;
  late List<String> permissions;
  late String corporate;
  late String cart;
  late List<dynamic> userpermission;
  late String userPlan;
  late String cartNegotiation;
  late String ISLACALLOWED;
  late String userType;
  // LacPopup
  // disbursementPopUp
  // display_user_type
  // register

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id']?.toString() ?? '';
    userType = json['user_type']?.toString() ?? '';
    userTypes = json['user_types'] ?? [];
    // member1 = Member.fromJson(json['member1'] ?? {});
    member = Member.fromJson(json['member'] ?? {});
    token = json['token']?.toString() ?? '';
    permissions = List.castFrom<dynamic, String>(json['permissions'] ?? []);
    corporate = json['corporate']?.toString() ?? '';
    cart = json['cart']?.toString() ?? '';
    userpermission = List.castFrom<dynamic, dynamic>(json['userpermission'] ?? []);
    userPlan = json['user_plan']?.toString() ?? '';
    cartNegotiation = json['cartNegotiation']?.toString() ?? '';
    ISLACALLOWED = json['IS_LAC_ALLOWED']?.toString() ?? '';
    successStatus = json['success_status']?.toString() ?? '';
  }

  // Data.fromChildUserData(ChildLogin childData,Member parentMember) {
  //   member = parentMember;
  //   // userId = childData.member?.id?.toString() ?? '';
  //   userType = childData.userType ?? '';
  //   member1 = childData.member; // Create an empty Member object if null
  //   token = childData.token ?? '';
  //   permissions = childData.permissions ?? [];
  //   corporate = childData.corporate?.toString() ?? '';
  //   cart = childData.cart?.toString() ?? '';
  //   userpermission = childData.userpermission ?? [];
  //   userPlan = childData.userPlan?.toString() ?? '';
  //   cartNegotiation = childData.cartNegotiation?.toString() ?? '';
  //   ISLACALLOWED = childData.isLacAllowed?.toString() ?? '';
  // }

  Map<String, dynamic> toJson() {
    print('Data.toJson');
    return {
      // 'userId': userId,
      'userType': userType,
      // 'userTypes': userTypes,
      'member': member.toJson(),
      // 'member1': member1.toJson(),
      'token': token,
      'permissions': permissions,
      'corporate': corporate,
      'cart': cart,
      'userpermission': userpermission,
      'userPlan': userPlan,
      'cartNegotiation': cartNegotiation,
      'ISLACALLOWED': ISLACALLOWED,
      // 'successStatus': successStatus,
    };
  }
}

class Member {
  Member({
    required this.id,
    required this.aryaId,
    required this.phoneNumber,
    required this.addressId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.parentId,
    required this.emailCc1,
    required this.emailCc2,
    required this.emailCc3,
    required this.emailCc4,
    required this.username,
    required this.profileMultimediaId,
    required this.coverMultimediaId,
    required this.phoneNumber2,
    required this.dob,
    required this.gender,
    required this.gstinNumber,
    required this.panNumber,
    required this.aadharNumber,
    required this.voterId,
    required this.numberOfWarehouse,
    required this.yearOfEstablishment,
    required this.entityName,
    required this.entityType,
    required this.bookwithoutpayment,
    required this.bankName,
    required this.branchName,
    required this.branchCode,
    required this.bankAccount,
    required this.ifscCode,
    required this.comparisonParameters,
    required this.emailVerified,
    required this.smsVerified,
    required this.service,
    required this.status,
    required this.gstBillingState,
    required this.communicationAddress,
    required this.areaManager,
    required this.kyc,
    required this.buySellLimit,
    required this.lastActive,
    required this.documentType,
    required this.gstFile,
    required this.panFile,
    required this.adharNoVoterNoFileOne,
    required this.adharNoVoterNoFileTwo,
    required this.preferredUserTypes,
    required this.userType,
    required this.panImageId,
    required this.aadharFrontImageId,
    required this.aadharBackImageId,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.createdName,
    required this.createdMobile,
    required this.resgisterType,
    required this.rmName,
    required this.rmId,
    required this.childVerifyDoc,
    required this.lastSessid,
    required this.shUserId,
    required this.shSellerAlias,
    required this.shSellerTitle,
    required this.cookie,
    required this.ltp,
    required this.stp,
    required this.buyer,
    required this.seller,
    required this.whatsappOptin,
    required this.tat,
    required this.roiFrom,
    required this.roiTo,
    required this.approved,
    required this.lang,
    required this.tan,
    required this.tanVerified,
    required this.panVerified,
    required this.gstVerified,
    required this.isCatalogHideDetails,
    required this.rollover,
    required this.isWHPremium,
    required this.tdsRateWH,
    required this.isADPremium,
    required this.tdsRateAD,
    required this.bankRequiredDocs,
    required this.isCatalogSellerWithoutKyc,
    required this.fromTrade,
    required this.roles,
  });
  late String id;
  late String aryaId;
  late String phoneNumber;
  late String addressId;
  late String firstName;
  late String lastName;
  late String email;
  late String parentId;
  late String emailCc1;
  late String emailCc2;
  late String emailCc3;
  late String emailCc4;
  late String username;
  late String profileMultimediaId;
  late String coverMultimediaId;
  late String phoneNumber2;
  late String dob;
  late String gender;
  late String gstinNumber;
  late String panNumber;
  late String aadharNumber;
  late String voterId;
  late String numberOfWarehouse;
  late String yearOfEstablishment;
  late String entityName;
  late String entityType;
  late String bookwithoutpayment;
  late String bankName;
  late String branchName;
  late String branchCode;
  late String bankAccount;
  late String ifscCode;
  late String comparisonParameters;
  late String emailVerified;
  late String smsVerified;
  late String service;
  late String status;
  late String gstBillingState;
  late String communicationAddress;
  late String areaManager;
  late String kyc;
  late String buySellLimit;
  late String lastActive;
  late String documentType;
  late String gstFile;
  late String panFile;
  late String adharNoVoterNoFileOne;
  late String adharNoVoterNoFileTwo;
  late String preferredUserTypes;
  late String userType;
  late String panImageId;
  late String aadharFrontImageId;
  late String aadharBackImageId;
  late String createdBy;
  late String updatedBy;
  late String createdAt;
  late String updatedAt;
  late String createdName;
  late String createdMobile;
  late String resgisterType;
  late String rmName;
  late String rmId;
  late String childVerifyDoc;
  late String lastSessid;
  late String shUserId;
  late String shSellerAlias;
  late String shSellerTitle;
  late String cookie;
  late String ltp;
  late String stp;
  late String buyer;
  late String seller;
  late String whatsappOptin;
  late String tat;
  late String roiFrom;
  late String roiTo;
  late String approved;
  late String lang;
  late String tan;
  late String tanVerified;
  late String panVerified;
  late String gstVerified;
  late String isCatalogHideDetails;
  late String rollover;
  late String isWHPremium;
  late String tdsRateWH;
  late String isADPremium;
  late String tdsRateAD;
  late String bankRequiredDocs;
  late String isCatalogSellerWithoutKyc;
  late String fromTrade;
  late List<Roles> roles;

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString() ?? '';
    aryaId = json['arya_id']?.toString() ?? '';
    phoneNumber = json['phone_number']?.toString() ?? '';
    phoneNumber2 = json['phone_number2']?.toString() ?? '';
    addressId = json['address_id']?.toString() ?? '';
    firstName = json['first_name']?.toString() ?? '';
    lastName = json['last_name']?.toString() ?? '';
    email = json['email']?.toString() ?? '';
    parentId = json['parent_id']?.toString() ?? '';
    emailCc1 = json['email_cc1']?.toString() ?? '';
    emailCc2 = json['email_cc2']?.toString() ?? '';
    emailCc3 = json['email_cc3']?.toString() ?? '';
    emailCc4 = json['email_cc4']?.toString() ?? '';
    username = json['username']?.toString() ?? '';
    profileMultimediaId = json['proflie_multimedia_id']?.toString() ?? '';
    cookie = json['cookie']?.toString() ?? '';
    coverMultimediaId = json['cover_multimedia_id']?.toString() ?? '';
    lang = json['lang']?.toString() ?? '';
    dob = json['dob']?.toString() ?? '';
    gender = json['gender']?.toString() ?? '';
    gstinNumber = json['gstin_number']?.toString() ?? '';
    panNumber = json['pan_number']?.toString() ?? '';
    aadharNumber = json['aadhar_number']?.toString() ?? '';
    voterId = json['voter_id']?.toString() ?? '';
    numberOfWarehouse = json['number_of_warehouse']?.toString() ?? '';
    yearOfEstablishment = json['year_of_establishment']?.toString() ?? '';
    entityName = json['entity_name']?.toString() ?? '';
    entityType = json['entity_type']?.toString() ?? '';
    bookwithoutpayment = json['bookwithoutpayment']?.toString() ?? '';
    bankName = json['bank_name']?.toString() ?? '';
    branchName = json['branch_name']?.toString() ?? '';
    branchCode = json['branch_code']?.toString() ?? '';
    bankAccount = json['bank_account']?.toString() ?? '';
    ifscCode = json['ifsc_code']?.toString() ?? '';
    comparisonParameters = json['comparison_parameters']?.toString() ?? '';
    emailVerified = json['email_verified']?.toString() ?? '';
    smsVerified = json['sms_verified']?.toString() ?? '';
    service = json['service']?.toString() ?? '';
    status = json['status']?.toString() ?? '';
    gstBillingState = json['gst_billing_state']?.toString() ?? '';
    communicationAddress = json['communication_address']?.toString() ?? '';
    areaManager = json['area_manager']?.toString() ?? '';
    kyc = json['kyc']?.toString() ?? '';
    buySellLimit = json['buy_sell_limit']?.toString() ?? '';
    lastActive = json['last_active']?.toString() ?? '';
    documentType = json['document_type']?.toString() ?? '';
    gstFile = json['gst_file']?.toString() ?? '';
    panFile = json['pan_file']?.toString() ?? '';
    adharNoVoterNoFileOne =
        json['adhar_no_voter_no_file_one']?.toString() ?? '';
    adharNoVoterNoFileTwo =
        json['adhar_no_voter_no_file_two']?.toString() ?? '';
    preferredUserTypes = json['preferred_user_type']?.toString() ?? '';
    userType = json['user_type']?.toString() ?? '';
    panImageId = json['pan_image_id']?.toString() ?? '';
    aadharFrontImageId = json['aadhar_front_image_id']?.toString() ?? '';
    aadharBackImageId = json['aadhar_back_image_id']?.toString() ?? '';
    createdBy = json['created_by']?.toString() ?? '';
    updatedBy = json['updated_by']?.toString() ?? '';
    createdAt = json['created_at']?.toString() ?? '';
    updatedAt = json['updated_at']?.toString() ?? '';
    createdName = json['created_name']?.toString() ?? '';
    createdMobile = json['created_mobile']?.toString() ?? '';
    resgisterType = json['resgister_type']?.toString() ?? '';
    rmName = json['rm_name']?.toString() ?? '';
    rmId = json['rm_id']?.toString() ?? '';
    childVerifyDoc = json['child_verify_doc']?.toString() ?? '';
    lastSessid = json['last_sessid']?.toString() ?? '';
    shUserId = json['sh_user_id']?.toString() ?? '';
    ltp = json['ltp']?.toString() ?? '';
    stp = json['stp']?.toString() ?? '';
    buyer = json['buyer']?.toString() ?? '';
    seller = json['seller']?.toString() ?? '';
    whatsappOptin = json['whatsapp_optin']?.toString() ?? '';
    tat = json['tat']?.toString() ?? '';
    roiFrom = json['roi_from']?.toString() ?? '';
    roiTo = json['roi_to']?.toString() ?? '';
    approved = json['approved']?.toString() ?? '';
    tan = json['tan']?.toString() ?? '';
    tanVerified = json['tan_verified']?.toString() ?? '';
    panVerified = json['pan_verified']?.toString() ?? '';
    gstVerified = json['gst_verified']?.toString() ?? '';
    isCatalogHideDetails = json['is_catalog_hide_details']?.toString() ?? '';
    shSellerAlias = json['sh_seller_alias']?.toString() ?? '';
    shSellerTitle = json['sh_seller_title']?.toString() ?? '';
    isCatalogSellerWithoutKyc =
        json['is_catalog_seller_without_kyc']?.toString() ?? '';
    fromTrade = json['from_trade']?.toString() ?? '';
    roles =
        List.from(json['roles'] ?? []).map((e) => Roles.fromJson(e)).toList();
    isWHPremium = json['is_w_h_premium']?.toString() ?? '';
    tdsRateWH = json['tds_rate_w_h']?.toString() ?? '';
    isADPremium = json['is_a_d_premium']?.toString() ?? '';
    tdsRateAD = json['tds_rate_a_d']?.toString() ?? '';
    bankRequiredDocs = json['bank_required_docs']?.toString() ?? '';

    id = json['id']?.toString() ?? '';
    aryaId = json['arya_id']?.toString() ?? '';
    phoneNumber = json['phone_number']?.toString() ?? '';
    addressId = json['address_id']?.toString() ?? '';
    firstName = json['first_name']?.toString() ?? '';
    lastName = json['last_name']?.toString() ?? '';
    rollover = json['rollover']?.toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    final member = <String, dynamic>{};
    member['id'] = id;
    member['arya_id'] = aryaId;
    member['phone_number'] = phoneNumber;
    member['address_id'] = addressId;
    member['first_name'] = firstName;
    member['last_name'] = lastName;
    member['email'] = email;
    member['parent_id'] = parentId;
    member['email_cc1'] = emailCc1;
    member['email_cc2'] = emailCc2;
    member['email_cc3'] = emailCc3;
    member['email_cc4'] = emailCc4;
    member['username'] = username;
    member['profile_multimedia_id'] = profileMultimediaId;
    member['cover_multimedia_id'] = coverMultimediaId;
    member['phone_number2'] = phoneNumber2;
    member['dob'] = dob;
    member['gender'] = gender;
    member['gstin_number'] = gstinNumber;
    member['pan_number'] = panNumber;
    member['aadhar_number'] = aadharNumber;
    member['voter_id'] = voterId;
    member['number_of_warehouse'] = numberOfWarehouse;
    member['year_of_establishment'] = yearOfEstablishment;
    member['entity_name'] = entityName;
    member['entity_type'] = entityType;
    member['bookwithoutpayment'] = bookwithoutpayment;
    member['bank_name'] = bankName;
    member['branch_name'] = branchName;
    member['branch_code'] = branchCode;
    member['bank_account'] = bankAccount;
    member['ifsc_code'] = ifscCode;
    member['comparison_parameters'] = comparisonParameters;
    member['email_verified'] = emailVerified;
    member['sms_verified'] = smsVerified;
    member['service'] = service;
    member['status'] = status;
    member['gst_billing_state'] = gstBillingState;
    member['communication_address'] = communicationAddress;
    member['area_manager'] = areaManager;
    member['kyc'] = kyc;
    member['buy_sell_limit'] = buySellLimit;
    member['last_active'] = lastActive;
    member['documentType'] = documentType;
    member['gst_file'] = gstFile;
    member['pan_file'] = panFile;
    member['adhar_no_voter_no_file_one'] = adharNoVoterNoFileOne;
    member['adhar_no_voter_no_file_two'] = adharNoVoterNoFileTwo;
    member['preferred_user_types'] = preferredUserTypes;
    member['user_type'] = userType;
    member['pan_image_id'] = panImageId;
    member['aadhar_front_image_id'] = aadharFrontImageId;
    member['aadhar_back_image_id'] = aadharBackImageId;
    member['created_by'] = createdBy;
    member['updated_by'] = updatedBy;
    member['created_at'] = createdAt;
    member['updated_at'] = updatedAt;
    member['created_name'] = createdName;
    member['created_mobile'] = createdMobile;
    member['resgister_type'] = resgisterType;
    member['rm_name'] = rmName;
    member['rm_id'] = rmId;
    member['child_verify_doc'] = childVerifyDoc;
    member['last_sessid'] = lastSessid;
    member['sh_user_id'] = shUserId;
    member['sh_seller_alias'] = shSellerAlias;
    member['sh_seller_title'] = shSellerTitle;
    member['cookie'] = cookie;
    member['ltp'] = ltp;
    member['stp'] = stp;
    member['buyer'] = buyer;
    member['seller'] = seller;
    member['whatsapp_optin'] = whatsappOptin;
    member['tat'] = tat;
    member['roi_from'] = roiFrom;
    member['roi_to'] = roiTo;
    member['approved'] = approved;
    member['lang'] = lang;
    member['tan'] = tan;
    member['tan_verified'] = tanVerified;
    member['pan_verified'] = panVerified;
    member['gst_verified'] = gstVerified;
    member['is_catalog_hide_details'] = isCatalogHideDetails;
    member['rollover'] = rollover;
    member['isWHPremium'] = isWHPremium;
    member['tdsRateWH'] = tdsRateWH;
    member['isADPremium'] = isADPremium;
    member['tdsRateAD'] = tdsRateAD;
    member['bank_required_docs'] = bankRequiredDocs;
    member['is_catalog_seller_without_kyc'] = isCatalogSellerWithoutKyc;
    member['from_trade'] = fromTrade;
    member['roles'] = roles.map((e) => e.toJson()).toList();
    return member;
  }
}

class Roles {
  Roles({
    required this.id,
    required this.name,
    required this.guardName,
    required this.userGroup,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });
  late String id;
  late String name;
  late String guardName;
  late String userGroup;
  late String createdAt;
  late String updatedAt;
  late Pivot pivot;

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString() ?? '';
    name = json['name']?.toString() ?? '';
    guardName = json['guard_name']?.toString() ?? '';
    userGroup = json['user_group']?.toString() ?? '';
    createdAt = json['created_at']?.toString() ?? '';
    updatedAt = json['updated_at']?.toString() ?? '';
    pivot = Pivot.fromJson(json['pivot'] ?? {});
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['guard_name'] = guardName;
    data['user_group'] = userGroup;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['pivot'] = pivot.toJson();
    return data;
  }
}

class Pivot {
  Pivot({
    required this.modelId,
    required this.roleId,
    required this.modelType,
  });
  late String modelId;
  late String roleId;
  late String modelType;

  Pivot.fromJson(Map<String, dynamic> json) {
    modelId = json['model_id']?.toString() ?? '';
    roleId = json['role_id']?.toString() ?? '';
    modelType = json['model_type']?.toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['model_id'] = modelId;
    data['role_id'] = roleId;
    data['model_type'] = modelType;
    return data;
  }
}
