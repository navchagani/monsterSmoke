class CreateCustomerModel {
  final List<CustomerStoreAddressList>? customerStoreAddressList;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? company;
  final String? dbaName;
  final String? primaryBusinessName;
  final String? taxId;
  const CreateCustomerModel(
      {this.customerStoreAddressList,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.company,
      this.dbaName,
      this.primaryBusinessName,
      this.taxId});
  CreateCustomerModel copyWith(
      {List<CustomerStoreAddressList>? customerStoreAddressList,
      String? firstName,
      String? lastName,
      String? email,
      String? phone,
      String? company,
      String? dbaName,
      String? primaryBusinessName,
      String? taxId}) {
    return CreateCustomerModel(
        customerStoreAddressList:
            customerStoreAddressList ?? this.customerStoreAddressList,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        company: company ?? this.company,
        dbaName: dbaName ?? this.dbaName,
        primaryBusinessName: primaryBusinessName ?? this.primaryBusinessName,
        taxId: taxId ?? this.taxId);
  }

  Map<String, Object?> toJson() {
    return {
      'customerStoreAddressList': customerStoreAddressList
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList(),
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'company': company,
      'dbaName': dbaName,
      'primaryBusinessName': primaryBusinessName,
      'taxId': taxId
    };
  }

  static CreateCustomerModel fromJson(Map<String, Object?> json) {
    return CreateCustomerModel(
        customerStoreAddressList: json['customerStoreAddressList'] == null
            ? null
            : (json['customerStoreAddressList'] as List)
                .map<CustomerStoreAddressList>((data) =>
                    CustomerStoreAddressList.fromJson(
                        data as Map<String, Object?>))
                .toList(),
        firstName:
            json['firstName'] == null ? null : json['firstName'] as String,
        lastName: json['lastName'] == null ? null : json['lastName'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        phone: json['phone'] == null ? null : json['phone'] as String,
        company: json['company'] == null ? null : json['company'] as String,
        dbaName: json['dbaName'] == null ? null : json['dbaName'] as String,
        primaryBusinessName: json['primaryBusinessName'] == null
            ? null
            : json['primaryBusinessName'] as String,
        taxId: json['taxId'] == null ? null : json['taxId'] as String);
  }

  @override
  String toString() {
    return '''CreateCustomerModel(
                customerStoreAddressList:${customerStoreAddressList.toString()},
firstName:$firstName,
lastName:$lastName,
email:$email,
phone:$phone,
company:$company,
dbaName:$dbaName,
primaryBusinessName:$primaryBusinessName,
taxId:$taxId
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CreateCustomerModel &&
        other.runtimeType == runtimeType &&
        other.customerStoreAddressList == customerStoreAddressList &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.phone == phone &&
        other.company == company &&
        other.dbaName == dbaName &&
        other.primaryBusinessName == primaryBusinessName &&
        other.taxId == taxId;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, customerStoreAddressList, firstName,
        lastName, email, phone, company, dbaName, primaryBusinessName, taxId);
  }
}

class CustomerStoreAddressList {
  final String? address1;
  final String? city;
  final int? countryId;
  final int? stateId;
  final String? zip;
  const CustomerStoreAddressList(
      {this.address1, this.city, this.countryId, this.stateId, this.zip});
  CustomerStoreAddressList copyWith(
      {String? address1,
      String? city,
      int? countryId,
      int? stateId,
      String? zip}) {
    return CustomerStoreAddressList(
        address1: address1 ?? this.address1,
        city: city ?? this.city,
        countryId: countryId ?? this.countryId,
        stateId: stateId ?? this.stateId,
        zip: zip ?? this.zip);
  }

  Map<String, Object?> toJson() {
    return {
      'address1': address1,
      'city': city,
      'countryId': countryId,
      'stateId': stateId,
      'zip': zip
    };
  }

  static CustomerStoreAddressList fromJson(Map<String, Object?> json) {
    return CustomerStoreAddressList(
        address1: json['address1'] == null ? null : json['address1'] as String,
        city: json['city'] == null ? null : json['city'] as String,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        stateId: json['stateId'] == null ? null : json['stateId'] as int,
        zip: json['zip'] == null ? null : json['zip'] as String);
  }

  @override
  String toString() {
    return '''CustomerStoreAddressList(
                address1:$address1,
city:$city,
countryId:$countryId,
stateId:$stateId,
zip:$zip
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerStoreAddressList &&
        other.runtimeType == runtimeType &&
        other.address1 == address1 &&
        other.city == city &&
        other.countryId == countryId &&
        other.stateId == stateId &&
        other.zip == zip;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, address1, city, countryId, stateId, zip);
  }
}
