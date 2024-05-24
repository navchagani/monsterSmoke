class CustomerModel {
  int? id;
  String? createdBy;
  String? insertedTimestamp;
  String? updatedBy;
  String? updatedTimestamp;
  String? parentCustomerId;
  String? idStr;
  String? name;
  String? firstName;
  String? lastName;
  String? company;
  int? storeId;
  String? customerStoreName;
  String? email;
  String? email1;
  String? email2;
  String? phone;
  String? phone1;
  String? phone2;
  String? storePhone;
  String? imageUrl;
  String? gender;
  int? tier;
  String? tierStr;
  String? authUserLoginId;
  String? adminId;
  int? paymentTermsId;
  String? paymentTermsName;
  String? notes;
  String? notes2;
  double? storeCredit;
  double? loyaltyPoints;
  double? dueAmount;
  String? dueAmountStr;
  double? excessAmount;
  bool? active;
  bool? verified;
  bool? viewSpecificCategory;
  bool? viewSpecificProduct;
  String? websiteReference;
  String? primaryBusiness;
  String? websiteUrl;
  String? facebookLink;
  String? instagramLink;
  String? referBySalesRep;
  String? referBySalesRepName;
  int? primarySalesRepresentativeId;
  String? secondarySalesRepresentativeId;
  String? salesRepresentativeName;
  String? salesRepresentativePhone;
  String? salesRepresentativeEmail;
  String? tobaccoId;
  String? taxId;
  bool? taxable;
  String? feinNumber;
  String? tobaccoLicenseExpirationDate;
  String? tobaccoLicenseExpirationDateString;
  String? vaporTaxId;
  String? vaporTaxExpirationDate;
  String? referByCustomerId;
  bool? communicateViaPhone;
  bool? communicateViaText;
  String? password;
  String? username;
  String? paymentMethodNonce;
  String? billingAddress;
  String? shippingAddress;
  List<CustomerStoreAddressList>? customerStoreAddressList;
  String? quickbooksCustomerId;
  String? customerGroupId;
  String? customerGroupName;
  String? dbaName;
  String? voidCheckNumber;
  String? drivingLicenseNumber;
  String? customerTypeId;
  String? customerTypeName;
  String? preferredLanguage;
  String? achVerified;
  String? parentCustomerFirstName;
  String? parentCustomerLastName;
  String? parentCustomerCompany;
  String? address1;
  String? address2;
  String? city;
  String? county;
  int? stateId;
  String? state;
  String? zip;
  String? billingAddress1;
  String? billingAddress2;
  String? billingCity;
  String? billingCounty;
  int? billingStateId;
  String? billingState;
  String? billingZip;
  String? primaryBusinessName;
  String? creditLimit;
  int? signUpStoreId;
  bool? sendDuePaymentReminder;
  String? customerDocumentList;
  String? customerPaymentModePreferenceDtoList;
  CustomerModel(
      {this.id,
      this.createdBy,
      this.insertedTimestamp,
      this.updatedBy,
      this.updatedTimestamp,
      this.parentCustomerId,
      this.idStr,
      this.name,
      this.firstName,
      this.lastName,
      this.company,
      this.storeId,
      this.customerStoreName,
      this.email,
      this.email1,
      this.email2,
      this.phone,
      this.phone1,
      this.phone2,
      this.storePhone,
      this.imageUrl,
      this.gender,
      this.tier,
      this.tierStr,
      this.authUserLoginId,
      this.adminId,
      this.paymentTermsId,
      this.paymentTermsName,
      this.notes,
      this.notes2,
      this.storeCredit,
      this.loyaltyPoints,
      this.dueAmount,
      this.dueAmountStr,
      this.excessAmount,
      this.active,
      this.verified,
      this.viewSpecificCategory,
      this.viewSpecificProduct,
      this.websiteReference,
      this.primaryBusiness,
      this.websiteUrl,
      this.facebookLink,
      this.instagramLink,
      this.referBySalesRep,
      this.referBySalesRepName,
      this.primarySalesRepresentativeId,
      this.secondarySalesRepresentativeId,
      this.salesRepresentativeName,
      this.salesRepresentativePhone,
      this.salesRepresentativeEmail,
      this.tobaccoId,
      this.taxId,
      this.taxable,
      this.feinNumber,
      this.tobaccoLicenseExpirationDate,
      this.tobaccoLicenseExpirationDateString,
      this.vaporTaxId,
      this.vaporTaxExpirationDate,
      this.referByCustomerId,
      this.communicateViaPhone,
      this.communicateViaText,
      this.password,
      this.username,
      this.paymentMethodNonce,
      this.billingAddress,
      this.shippingAddress,
      this.customerStoreAddressList,
      this.quickbooksCustomerId,
      this.customerGroupId,
      this.customerGroupName,
      this.dbaName,
      this.voidCheckNumber,
      this.drivingLicenseNumber,
      this.customerTypeId,
      this.customerTypeName,
      this.preferredLanguage,
      this.achVerified,
      this.parentCustomerFirstName,
      this.parentCustomerLastName,
      this.parentCustomerCompany,
      this.address1,
      this.address2,
      this.city,
      this.county,
      this.stateId,
      this.state,
      this.zip,
      this.billingAddress1,
      this.billingAddress2,
      this.billingCity,
      this.billingCounty,
      this.billingStateId,
      this.billingState,
      this.billingZip,
      this.primaryBusinessName,
      this.creditLimit,
      this.signUpStoreId,
      this.sendDuePaymentReminder,
      this.customerDocumentList,
      this.customerPaymentModePreferenceDtoList});
  CustomerModel copyWith(
      {int? id,
      String? createdBy,
      String? insertedTimestamp,
      String? updatedBy,
      String? updatedTimestamp,
      String? parentCustomerId,
      String? idStr,
      String? name,
      String? firstName,
      String? lastName,
      String? company,
      int? storeId,
      String? customerStoreName,
      String? email,
      String? email1,
      String? email2,
      String? phone,
      String? phone1,
      String? phone2,
      String? storePhone,
      String? imageUrl,
      String? gender,
      int? tier,
      String? tierStr,
      String? authUserLoginId,
      String? adminId,
      int? paymentTermsId,
      String? paymentTermsName,
      String? notes,
      String? notes2,
      double? storeCredit,
      double? loyaltyPoints,
      double? dueAmount,
      String? dueAmountStr,
      double? excessAmount,
      bool? active,
      bool? verified,
      bool? viewSpecificCategory,
      bool? viewSpecificProduct,
      String? websiteReference,
      String? primaryBusiness,
      String? websiteUrl,
      String? facebookLink,
      String? instagramLink,
      String? referBySalesRep,
      String? referBySalesRepName,
      int? primarySalesRepresentativeId,
      String? secondarySalesRepresentativeId,
      String? salesRepresentativeName,
      String? salesRepresentativePhone,
      String? salesRepresentativeEmail,
      String? tobaccoId,
      String? taxId,
      bool? taxable,
      String? feinNumber,
      String? tobaccoLicenseExpirationDate,
      String? tobaccoLicenseExpirationDateString,
      String? vaporTaxId,
      String? vaporTaxExpirationDate,
      String? referByCustomerId,
      bool? communicateViaPhone,
      bool? communicateViaText,
      String? password,
      String? username,
      String? paymentMethodNonce,
      String? billingAddress,
      String? shippingAddress,
      List<CustomerStoreAddressList>? customerStoreAddressList,
      String? quickbooksCustomerId,
      String? customerGroupId,
      String? customerGroupName,
      String? dbaName,
      String? voidCheckNumber,
      String? drivingLicenseNumber,
      String? customerTypeId,
      String? customerTypeName,
      String? preferredLanguage,
      String? achVerified,
      String? parentCustomerFirstName,
      String? parentCustomerLastName,
      String? parentCustomerCompany,
      String? address1,
      String? address2,
      String? city,
      String? county,
      int? stateId,
      String? state,
      String? zip,
      String? billingAddress1,
      String? billingAddress2,
      String? billingCity,
      String? billingCounty,
      int? billingStateId,
      String? billingState,
      String? billingZip,
      String? primaryBusinessName,
      String? creditLimit,
      int? signUpStoreId,
      bool? sendDuePaymentReminder,
      String? customerDocumentList,
      String? customerPaymentModePreferenceDtoList}) {
    return CustomerModel(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        insertedTimestamp: insertedTimestamp ?? this.insertedTimestamp,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedTimestamp: updatedTimestamp ?? this.updatedTimestamp,
        parentCustomerId: parentCustomerId ?? this.parentCustomerId,
        idStr: idStr ?? this.idStr,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        company: company ?? this.company,
        storeId: storeId ?? this.storeId,
        customerStoreName: customerStoreName ?? this.customerStoreName,
        email: email ?? this.email,
        email1: email1 ?? this.email1,
        email2: email2 ?? this.email2,
        phone: phone ?? this.phone,
        phone1: phone1 ?? this.phone1,
        phone2: phone2 ?? this.phone2,
        storePhone: storePhone ?? this.storePhone,
        imageUrl: imageUrl ?? this.imageUrl,
        gender: gender ?? this.gender,
        tier: tier ?? this.tier,
        tierStr: tierStr ?? this.tierStr,
        authUserLoginId: authUserLoginId ?? this.authUserLoginId,
        adminId: adminId ?? this.adminId,
        paymentTermsId: paymentTermsId ?? this.paymentTermsId,
        paymentTermsName: paymentTermsName ?? this.paymentTermsName,
        notes: notes ?? this.notes,
        notes2: notes2 ?? this.notes2,
        storeCredit: storeCredit ?? this.storeCredit,
        loyaltyPoints: loyaltyPoints ?? this.loyaltyPoints,
        dueAmount: dueAmount ?? this.dueAmount,
        dueAmountStr: dueAmountStr ?? this.dueAmountStr,
        excessAmount: excessAmount ?? this.excessAmount,
        active: active ?? this.active,
        verified: verified ?? this.verified,
        viewSpecificCategory: viewSpecificCategory ?? this.viewSpecificCategory,
        viewSpecificProduct: viewSpecificProduct ?? this.viewSpecificProduct,
        websiteReference: websiteReference ?? this.websiteReference,
        primaryBusiness: primaryBusiness ?? this.primaryBusiness,
        websiteUrl: websiteUrl ?? this.websiteUrl,
        facebookLink: facebookLink ?? this.facebookLink,
        instagramLink: instagramLink ?? this.instagramLink,
        referBySalesRep: referBySalesRep ?? this.referBySalesRep,
        referBySalesRepName: referBySalesRepName ?? this.referBySalesRepName,
        primarySalesRepresentativeId:
            primarySalesRepresentativeId ?? this.primarySalesRepresentativeId,
        secondarySalesRepresentativeId: secondarySalesRepresentativeId ??
            this.secondarySalesRepresentativeId,
        salesRepresentativeName:
            salesRepresentativeName ?? this.salesRepresentativeName,
        salesRepresentativePhone:
            salesRepresentativePhone ?? this.salesRepresentativePhone,
        salesRepresentativeEmail:
            salesRepresentativeEmail ?? this.salesRepresentativeEmail,
        tobaccoId: tobaccoId ?? this.tobaccoId,
        taxId: taxId ?? this.taxId,
        taxable: taxable ?? this.taxable,
        feinNumber: feinNumber ?? this.feinNumber,
        tobaccoLicenseExpirationDate:
            tobaccoLicenseExpirationDate ?? this.tobaccoLicenseExpirationDate,
        tobaccoLicenseExpirationDateString:
            tobaccoLicenseExpirationDateString ??
                this.tobaccoLicenseExpirationDateString,
        vaporTaxId: vaporTaxId ?? this.vaporTaxId,
        vaporTaxExpirationDate:
            vaporTaxExpirationDate ?? this.vaporTaxExpirationDate,
        referByCustomerId: referByCustomerId ?? this.referByCustomerId,
        communicateViaPhone: communicateViaPhone ?? this.communicateViaPhone,
        communicateViaText: communicateViaText ?? this.communicateViaText,
        password: password ?? this.password,
        username: username ?? this.username,
        paymentMethodNonce: paymentMethodNonce ?? this.paymentMethodNonce,
        billingAddress: billingAddress ?? this.billingAddress,
        shippingAddress: shippingAddress ?? this.shippingAddress,
        customerStoreAddressList:
            customerStoreAddressList ?? this.customerStoreAddressList,
        quickbooksCustomerId: quickbooksCustomerId ?? this.quickbooksCustomerId,
        customerGroupId: customerGroupId ?? this.customerGroupId,
        customerGroupName: customerGroupName ?? this.customerGroupName,
        dbaName: dbaName ?? this.dbaName,
        voidCheckNumber: voidCheckNumber ?? this.voidCheckNumber,
        drivingLicenseNumber: drivingLicenseNumber ?? this.drivingLicenseNumber,
        customerTypeId: customerTypeId ?? this.customerTypeId,
        customerTypeName: customerTypeName ?? this.customerTypeName,
        preferredLanguage: preferredLanguage ?? this.preferredLanguage,
        achVerified: achVerified ?? this.achVerified,
        parentCustomerFirstName:
            parentCustomerFirstName ?? this.parentCustomerFirstName,
        parentCustomerLastName:
            parentCustomerLastName ?? this.parentCustomerLastName,
        parentCustomerCompany:
            parentCustomerCompany ?? this.parentCustomerCompany,
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        city: city ?? this.city,
        county: county ?? this.county,
        stateId: stateId ?? this.stateId,
        state: state ?? this.state,
        zip: zip ?? this.zip,
        billingAddress1: billingAddress1 ?? this.billingAddress1,
        billingAddress2: billingAddress2 ?? this.billingAddress2,
        billingCity: billingCity ?? this.billingCity,
        billingCounty: billingCounty ?? this.billingCounty,
        billingStateId: billingStateId ?? this.billingStateId,
        billingState: billingState ?? this.billingState,
        billingZip: billingZip ?? this.billingZip,
        primaryBusinessName: primaryBusinessName ?? this.primaryBusinessName,
        creditLimit: creditLimit ?? this.creditLimit,
        signUpStoreId: signUpStoreId ?? this.signUpStoreId,
        sendDuePaymentReminder:
            sendDuePaymentReminder ?? this.sendDuePaymentReminder,
        customerDocumentList: customerDocumentList ?? this.customerDocumentList,
        customerPaymentModePreferenceDtoList:
            customerPaymentModePreferenceDtoList ??
                this.customerPaymentModePreferenceDtoList);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'createdBy': createdBy,
      'insertedTimestamp': insertedTimestamp,
      'updatedBy': updatedBy,
      'updatedTimestamp': updatedTimestamp,
      'parentCustomerId': parentCustomerId,
      'idStr': idStr,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'company': company,
      'storeId': storeId,
      'customerStoreName': customerStoreName,
      'email': email,
      'email1': email1,
      'email2': email2,
      'phone': phone,
      'phone1': phone1,
      'phone2': phone2,
      'storePhone': storePhone,
      'imageUrl': imageUrl,
      'gender': gender,
      'tier': tier,
      'tierStr': tierStr,
      'authUserLoginId': authUserLoginId,
      'adminId': adminId,
      'paymentTermsId': paymentTermsId,
      'paymentTermsName': paymentTermsName,
      'notes': notes,
      'notes2': notes2,
      'storeCredit': storeCredit,
      'loyaltyPoints': loyaltyPoints,
      'dueAmount': dueAmount,
      'dueAmountStr': dueAmountStr,
      'excessAmount': excessAmount,
      'active': active,
      'verified': verified,
      'viewSpecificCategory': viewSpecificCategory,
      'viewSpecificProduct': viewSpecificProduct,
      'websiteReference': websiteReference,
      'primaryBusiness': primaryBusiness,
      'websiteUrl': websiteUrl,
      'facebookLink': facebookLink,
      'instagramLink': instagramLink,
      'referBySalesRep': referBySalesRep,
      'referBySalesRepName': referBySalesRepName,
      'primarySalesRepresentativeId': primarySalesRepresentativeId,
      'secondarySalesRepresentativeId': secondarySalesRepresentativeId,
      'salesRepresentativeName': salesRepresentativeName,
      'salesRepresentativePhone': salesRepresentativePhone,
      'salesRepresentativeEmail': salesRepresentativeEmail,
      'tobaccoId': tobaccoId,
      'taxId': taxId,
      'taxable': taxable,
      'feinNumber': feinNumber,
      'tobaccoLicenseExpirationDate': tobaccoLicenseExpirationDate,
      'tobaccoLicenseExpirationDateString': tobaccoLicenseExpirationDateString,
      'vaporTaxId': vaporTaxId,
      'vaporTaxExpirationDate': vaporTaxExpirationDate,
      'referByCustomerId': referByCustomerId,
      'communicateViaPhone': communicateViaPhone,
      'communicateViaText': communicateViaText,
      'password': password,
      'username': username,
      'paymentMethodNonce': paymentMethodNonce,
      'billingAddress': billingAddress,
      'shippingAddress': shippingAddress,
      'customerStoreAddressList': customerStoreAddressList
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList(),
      'quickbooksCustomerId': quickbooksCustomerId,
      'customerGroupId': customerGroupId,
      'customerGroupName': customerGroupName,
      'dbaName': dbaName,
      'voidCheckNumber': voidCheckNumber,
      'drivingLicenseNumber': drivingLicenseNumber,
      'customerTypeId': customerTypeId,
      'customerTypeName': customerTypeName,
      'preferredLanguage': preferredLanguage,
      'achVerified': achVerified,
      'parentCustomerFirstName': parentCustomerFirstName,
      'parentCustomerLastName': parentCustomerLastName,
      'parentCustomerCompany': parentCustomerCompany,
      'address1': address1,
      'address2': address2,
      'city': city,
      'county': county,
      'stateId': stateId,
      'state': state,
      'zip': zip,
      'billingAddress1': billingAddress1,
      'billingAddress2': billingAddress2,
      'billingCity': billingCity,
      'billingCounty': billingCounty,
      'billingStateId': billingStateId,
      'billingState': billingState,
      'billingZip': billingZip,
      'primaryBusinessName': primaryBusinessName,
      'creditLimit': creditLimit,
      'signUpStoreId': signUpStoreId,
      'sendDuePaymentReminder': sendDuePaymentReminder,
      'customerDocumentList': customerDocumentList,
      'customerPaymentModePreferenceDtoList':
          customerPaymentModePreferenceDtoList
    };
  }

  static CustomerModel fromJson(Map<String, Object?> json) {
    return CustomerModel(
        id: json['id'] == null ? null : json['id'] as int,
        createdBy: json['createdBy'] as String?,
        insertedTimestamp: json['insertedTimestamp'] as String?,
        updatedBy: json['updatedBy'] as String?,
        updatedTimestamp: json['updatedTimestamp'] as String?,
        parentCustomerId: json['parentCustomerId'] as String?,
        idStr: json['idStr'] as String?,
        name: json['name'] == null ? null : json['name'] as String,
        firstName:
            json['firstName'] == null ? null : json['firstName'] as String,
        lastName: json['lastName'] == null ? null : json['lastName'] as String,
        company: json['company'] == null ? null : json['company'] as String,
        storeId: json['storeId'] == null ? null : json['storeId'] as int,
        customerStoreName: json['customerStoreName'] as String?,
        email: json['email'] == null ? null : json['email'] as String,
        email1: json['email1'] as String?,
        email2: json['email2'] as String?,
        phone: json['phone'] == null ? null : json['phone'] as String,
        phone1: json['phone1'] as String?,
        phone2: json['phone2'] as String?,
        storePhone: json['storePhone'] as String?,
        imageUrl: json['imageUrl'] as String?,
        gender: json['gender'] as String?,
        tier: json['tier'] == null ? null : json['tier'] as int,
        tierStr: json['tierStr'] as String?,
        authUserLoginId: json['authUserLoginId'] as String?,
        adminId: json['adminId'] as String?,
        paymentTermsId: json['paymentTermsId'] as int?,
        paymentTermsName: json['paymentTermsName'] as String?,
        notes: json['notes'] as String?,
        notes2: json['notes2'] as String?,
        storeCredit:
            json['storeCredit'] == null ? null : json['storeCredit'] as double,
        loyaltyPoints: json['loyaltyPoints'] == null
            ? null
            : json['loyaltyPoints'] as double,
        dueAmount:
            json['dueAmount'] == null ? null : json['dueAmount'] as double,
        dueAmountStr: json['dueAmountStr'] as String?,
        excessAmount: json['excessAmount'] == null
            ? null
            : json['excessAmount'] as double,
        active: json['active'] == null ? null : json['active'] as bool,
        verified: json['verified'] == null ? null : json['verified'] as bool,
        viewSpecificCategory: json['viewSpecificCategory'] == null
            ? null
            : json['viewSpecificCategory'] as bool,
        viewSpecificProduct: json['viewSpecificProduct'] == null
            ? null
            : json['viewSpecificProduct'] as bool,
        websiteReference: json['websiteReference'] as String?,
        primaryBusiness: json['primaryBusiness'] as String?,
        websiteUrl: json['websiteUrl'] as String?,
        facebookLink: json['facebookLink'] as String?,
        instagramLink: json['instagramLink'] as String?,
        referBySalesRep: json['referBySalesRep'] as String?,
        referBySalesRepName: json['referBySalesRepName'] as String?,
        primarySalesRepresentativeId:
            json['primarySalesRepresentativeId'] as int?,
        secondarySalesRepresentativeId:
            json['secondarySalesRepresentativeId'] as String?,
        salesRepresentativeName: json['salesRepresentativeName'] as String?,
        salesRepresentativePhone: json['salesRepresentativePhone'] as String?,
        salesRepresentativeEmail: json['salesRepresentativeEmail'] as String?,
        tobaccoId: json['tobaccoId'] as String?,
        taxId: json['taxId'] as String?,
        taxable: json['taxable'] == null ? null : json['taxable'] as bool,
        feinNumber: json['feinNumber'] as String?,
        tobaccoLicenseExpirationDate:
            json['tobaccoLicenseExpirationDate'] as String?,
        tobaccoLicenseExpirationDateString:
            json['tobaccoLicenseExpirationDateString'] as String?,
        vaporTaxId: json['vaporTaxId'] as String?,
        vaporTaxExpirationDate: json['vaporTaxExpirationDate'] as String?,
        referByCustomerId: json['referByCustomerId'] as String?,
        communicateViaPhone: json['communicateViaPhone'] == null
            ? null
            : json['communicateViaPhone'] as bool,
        communicateViaText: json['communicateViaText'] == null
            ? null
            : json['communicateViaText'] as bool,
        password: json['password'] as String?,
        username: json['username'] as String?,
        paymentMethodNonce: json['paymentMethodNonce'] as String?,
        billingAddress: json['billingAddress'] as String?,
        shippingAddress: json['shippingAddress'] as String?,
        customerStoreAddressList: (json['customerStoreAddressList'] as List)
            .map<CustomerStoreAddressList>((data) =>
                CustomerStoreAddressList.fromJson(data as Map<String, dynamic>))
            .toList(),
        quickbooksCustomerId: json['quickbooksCustomerId'] as String?,
        customerGroupId: json['customerGroupId'] as String?,
        customerGroupName: json['customerGroupName'] as String?,
        dbaName: json['dbaName'] as String?,
        voidCheckNumber: json['voidCheckNumber'] as String?,
        drivingLicenseNumber: json['drivingLicenseNumber'] as String?,
        customerTypeId: json['customerTypeId'] as String?,
        customerTypeName: json['customerTypeName'] as String?,
        preferredLanguage: json['preferredLanguage'] as String?,
        achVerified: json['achVerified'] as String?,
        parentCustomerFirstName: json['parentCustomerFirstName'] as String?,
        parentCustomerLastName: json['parentCustomerLastName'] as String?,
        parentCustomerCompany: json['parentCustomerCompany'] as String?,
        address1: json['address1'] as String?,
        address2: json['address2'] as String?,
        city: json['city'] as String?,
        county: json['county'] as String?,
        stateId: json['stateId'] == null ? null : json['stateId'] as int,
        state: json['state'] as String?,
        zip: json['zip'] as String?,
        billingAddress1: json['billingAddress1'] as String?,
        billingAddress2: json['billingAddress2'] as String?,
        billingCity: json['billingCity'] as String?,
        billingCounty: json['billingCounty'] as String?,
        billingStateId: json['billingStateId'] == null
            ? null
            : json['billingStateId'] as int,
        billingState: json['billingState'] as String?,
        billingZip: json['billingZip'] as String?,
        primaryBusinessName: json['primaryBusinessName'] as String?,
        creditLimit: json['creditLimit'] as String?,
        signUpStoreId: json['signUpStoreId'] as int?,
        sendDuePaymentReminder: json['sendDuePaymentReminder'] == null
            ? null
            : json['sendDuePaymentReminder'] as bool,
        customerDocumentList: json['customerDocumentList'] as String?,
        customerPaymentModePreferenceDtoList:
            json['customerPaymentModePreferenceDtoList'] as String?);
  }

  @override
  String toString() {
    return '''CustomerModel(
                id:$id,
createdBy:$createdBy,
insertedTimestamp:$insertedTimestamp,
updatedBy:$updatedBy,
updatedTimestamp:$updatedTimestamp,
parentCustomerId:$parentCustomerId,
idStr:$idStr,
name:$name,
firstName:$firstName,
lastName:$lastName,
company:$company,
storeId:$storeId,
customerStoreName:$customerStoreName,
email:$email,
email1:$email1,
email2:$email2,
phone:$phone,
phone1:$phone1,
phone2:$phone2,
storePhone:$storePhone,
imageUrl:$imageUrl,
gender:$gender,
tier:$tier,
tierStr:$tierStr,
authUserLoginId:$authUserLoginId,
adminId:$adminId,
paymentTermsId:$paymentTermsId,
paymentTermsName:$paymentTermsName,
notes:$notes,
notes2:$notes2,
storeCredit:$storeCredit,
loyaltyPoints:$loyaltyPoints,
dueAmount:$dueAmount,
dueAmountStr:$dueAmountStr,
excessAmount:$excessAmount,
active:$active,
verified:$verified,
viewSpecificCategory:$viewSpecificCategory,
viewSpecificProduct:$viewSpecificProduct,
websiteReference:$websiteReference,
primaryBusiness:$primaryBusiness,
websiteUrl:$websiteUrl,
facebookLink:$facebookLink,
instagramLink:$instagramLink,
referBySalesRep:$referBySalesRep,
referBySalesRepName:$referBySalesRepName,
primarySalesRepresentativeId:$primarySalesRepresentativeId,
secondarySalesRepresentativeId:$secondarySalesRepresentativeId,
salesRepresentativeName:$salesRepresentativeName,
salesRepresentativePhone:$salesRepresentativePhone,
salesRepresentativeEmail:$salesRepresentativeEmail,
tobaccoId:$tobaccoId,
taxId:$taxId,
taxable:$taxable,
feinNumber:$feinNumber,
tobaccoLicenseExpirationDate:$tobaccoLicenseExpirationDate,
tobaccoLicenseExpirationDateString:$tobaccoLicenseExpirationDateString,
vaporTaxId:$vaporTaxId,
vaporTaxExpirationDate:$vaporTaxExpirationDate,
referByCustomerId:$referByCustomerId,
communicateViaPhone:$communicateViaPhone,
communicateViaText:$communicateViaText,
password:$password,
username:$username,
paymentMethodNonce:$paymentMethodNonce,
billingAddress:$billingAddress,
shippingAddress:$shippingAddress,
customerStoreAddressList:${customerStoreAddressList.toString()},
quickbooksCustomerId:$quickbooksCustomerId,
customerGroupId:$customerGroupId,
customerGroupName:$customerGroupName,
dbaName:$dbaName,
voidCheckNumber:$voidCheckNumber,
drivingLicenseNumber:$drivingLicenseNumber,
customerTypeId:$customerTypeId,
customerTypeName:$customerTypeName,
preferredLanguage:$preferredLanguage,
achVerified:$achVerified,
parentCustomerFirstName:$parentCustomerFirstName,
parentCustomerLastName:$parentCustomerLastName,
parentCustomerCompany:$parentCustomerCompany,
address1:$address1,
address2:$address2,
city:$city,
county:$county,
stateId:$stateId,
state:$state,
zip:$zip,
billingAddress1:$billingAddress1,
billingAddress2:$billingAddress2,
billingCity:$billingCity,
billingCounty:$billingCounty,
billingStateId:$billingStateId,
billingState:$billingState,
billingZip:$billingZip,
primaryBusinessName:$primaryBusinessName,
creditLimit:$creditLimit,
signUpStoreId:$signUpStoreId,
sendDuePaymentReminder:$sendDuePaymentReminder,
customerDocumentList:$customerDocumentList,
customerPaymentModePreferenceDtoList:$customerPaymentModePreferenceDtoList
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.createdBy == createdBy &&
        other.insertedTimestamp == insertedTimestamp &&
        other.updatedBy == updatedBy &&
        other.updatedTimestamp == updatedTimestamp &&
        other.parentCustomerId == parentCustomerId &&
        other.idStr == idStr &&
        other.name == name &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.company == company &&
        other.storeId == storeId &&
        other.customerStoreName == customerStoreName &&
        other.email == email &&
        other.email1 == email1 &&
        other.email2 == email2 &&
        other.phone == phone &&
        other.phone1 == phone1 &&
        other.phone2 == phone2 &&
        other.storePhone == storePhone &&
        other.imageUrl == imageUrl &&
        other.gender == gender &&
        other.tier == tier &&
        other.tierStr == tierStr &&
        other.authUserLoginId == authUserLoginId &&
        other.adminId == adminId &&
        other.paymentTermsId == paymentTermsId &&
        other.paymentTermsName == paymentTermsName &&
        other.notes == notes &&
        other.notes2 == notes2 &&
        other.storeCredit == storeCredit &&
        other.loyaltyPoints == loyaltyPoints &&
        other.dueAmount == dueAmount &&
        other.dueAmountStr == dueAmountStr &&
        other.excessAmount == excessAmount &&
        other.active == active &&
        other.verified == verified &&
        other.viewSpecificCategory == viewSpecificCategory &&
        other.viewSpecificProduct == viewSpecificProduct &&
        other.websiteReference == websiteReference &&
        other.primaryBusiness == primaryBusiness &&
        other.websiteUrl == websiteUrl &&
        other.facebookLink == facebookLink &&
        other.instagramLink == instagramLink &&
        other.referBySalesRep == referBySalesRep &&
        other.referBySalesRepName == referBySalesRepName &&
        other.primarySalesRepresentativeId == primarySalesRepresentativeId &&
        other.secondarySalesRepresentativeId ==
            secondarySalesRepresentativeId &&
        other.salesRepresentativeName == salesRepresentativeName &&
        other.salesRepresentativePhone == salesRepresentativePhone &&
        other.salesRepresentativeEmail == salesRepresentativeEmail &&
        other.tobaccoId == tobaccoId &&
        other.taxId == taxId &&
        other.taxable == taxable &&
        other.feinNumber == feinNumber &&
        other.tobaccoLicenseExpirationDate == tobaccoLicenseExpirationDate &&
        other.tobaccoLicenseExpirationDateString ==
            tobaccoLicenseExpirationDateString &&
        other.vaporTaxId == vaporTaxId &&
        other.vaporTaxExpirationDate == vaporTaxExpirationDate &&
        other.referByCustomerId == referByCustomerId &&
        other.communicateViaPhone == communicateViaPhone &&
        other.communicateViaText == communicateViaText &&
        other.password == password &&
        other.username == username &&
        other.paymentMethodNonce == paymentMethodNonce &&
        other.billingAddress == billingAddress &&
        other.shippingAddress == shippingAddress &&
        other.customerStoreAddressList == customerStoreAddressList &&
        other.quickbooksCustomerId == quickbooksCustomerId &&
        other.customerGroupId == customerGroupId &&
        other.customerGroupName == customerGroupName &&
        other.dbaName == dbaName &&
        other.voidCheckNumber == voidCheckNumber &&
        other.drivingLicenseNumber == drivingLicenseNumber &&
        other.customerTypeId == customerTypeId &&
        other.customerTypeName == customerTypeName &&
        other.preferredLanguage == preferredLanguage &&
        other.achVerified == achVerified &&
        other.parentCustomerFirstName == parentCustomerFirstName &&
        other.parentCustomerLastName == parentCustomerLastName &&
        other.parentCustomerCompany == parentCustomerCompany &&
        other.address1 == address1 &&
        other.address2 == address2 &&
        other.city == city &&
        other.county == county &&
        other.stateId == stateId &&
        other.state == state &&
        other.zip == zip &&
        other.billingAddress1 == billingAddress1 &&
        other.billingAddress2 == billingAddress2 &&
        other.billingCity == billingCity &&
        other.billingCounty == billingCounty &&
        other.billingStateId == billingStateId &&
        other.billingState == billingState &&
        other.billingZip == billingZip &&
        other.primaryBusinessName == primaryBusinessName &&
        other.creditLimit == creditLimit &&
        other.signUpStoreId == signUpStoreId &&
        other.sendDuePaymentReminder == sendDuePaymentReminder &&
        other.customerDocumentList == customerDocumentList &&
        other.customerPaymentModePreferenceDtoList ==
            customerPaymentModePreferenceDtoList;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        createdBy,
        insertedTimestamp,
        updatedBy,
        updatedTimestamp,
        parentCustomerId,
        idStr,
        name,
        firstName,
        lastName,
        company,
        storeId,
        customerStoreName,
        email,
        email1,
        email2,
        phone,
        phone1,
        phone2);
  }
}

class CustomerStoreAddressList {
  int? id;
  int? customerId;
  String? address1;
  String? address2;
  String? city;
  String? county;
  int? stateId;
  String? state;
  int? countryId;
  String? country;
  String? zip;
  String? phone;
  bool? defaultBillingAddress;
  bool? defaultShippingAddress;
  bool? active;

  CustomerStoreAddressList(
      {this.id,
      this.customerId,
      this.address1,
      this.address2,
      this.city,
      this.county,
      this.stateId,
      this.state,
      this.countryId,
      this.country,
      this.zip,
      this.phone,
      this.defaultBillingAddress,
      this.defaultShippingAddress,
      this.active});
  CustomerStoreAddressList copyWith(
      {int? id,
      int? customerId,
      String? address1,
      String? address2,
      String? city,
      String? county,
      int? stateId,
      String? state,
      int? countryId,
      String? country,
      String? zip,
      String? phone,
      bool? defaultBillingAddress,
      bool? defaultShippingAddress,
      bool? active}) {
    return CustomerStoreAddressList(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        city: city ?? this.city,
        county: county ?? this.county,
        stateId: stateId ?? this.stateId,
        state: state ?? this.state,
        countryId: countryId ?? this.countryId,
        country: country ?? this.country,
        zip: zip ?? this.zip,
        phone: phone ?? this.phone,
        defaultBillingAddress:
            defaultBillingAddress ?? this.defaultBillingAddress,
        defaultShippingAddress:
            defaultShippingAddress ?? this.defaultShippingAddress,
        active: active ?? this.active);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'address1': address1,
      'address2': address2,
      'city': city,
      'county': county,
      'stateId': stateId,
      'state': state,
      'countryId': countryId,
      'country': country,
      'zip': zip,
      'phone': phone,
      'defaultBillingAddress': defaultBillingAddress,
      'defaultShippingAddress': defaultShippingAddress,
      'active': active
    };
  }

  static CustomerStoreAddressList fromJson(Map<String, Object?> json) {
    return CustomerStoreAddressList(
        id: json['id'] == null ? null : json['id'] as int,
        customerId:
            json['customerId'] == null ? null : json['customerId'] as int,
        address1: json['address1'] == null ? null : json['address1'] as String,
        address2: json['address2'] as String?,
        city: json['city'] == null ? null : json['city'] as String,
        county: json['county'] as String?,
        stateId: json['stateId'] == null ? null : json['stateId'] as int,
        state: json['state'] == null ? null : json['state'] as String,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        country: json['country'] == null ? null : json['country'] as String,
        zip: json['zip'] == null ? null : json['zip'] as String,
        phone: json['phone'] as String?,
        defaultBillingAddress: json['defaultBillingAddress'] == null
            ? null
            : json['defaultBillingAddress'] as bool,
        defaultShippingAddress: json['defaultShippingAddress'] == null
            ? null
            : json['defaultShippingAddress'] as bool,
        active: json['active'] == null ? null : json['active'] as bool);
  }

  @override
  String toString() {
    return '''CustomerStoreAddressList(
                id:$id,
customerId:$customerId,
address1:$address1,
address2:$address2,
city:$city,
county:$county,
stateId:$stateId,
state:$state,
countryId:$countryId,
country:$country,
zip:$zip,
phone:$phone,
defaultBillingAddress:$defaultBillingAddress,
defaultShippingAddress:$defaultShippingAddress,
active:$active
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerStoreAddressList &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.customerId == customerId &&
        other.address1 == address1 &&
        other.address2 == address2 &&
        other.city == city &&
        other.county == county &&
        other.stateId == stateId &&
        other.state == state &&
        other.countryId == countryId &&
        other.country == country &&
        other.zip == zip &&
        other.phone == phone &&
        other.defaultBillingAddress == defaultBillingAddress &&
        other.defaultShippingAddress == defaultShippingAddress &&
        other.active == active;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        customerId,
        address1,
        address2,
        city,
        county,
        stateId,
        state,
        countryId,
        country,
        zip,
        phone,
        defaultBillingAddress,
        defaultShippingAddress,
        active);
  }
}
