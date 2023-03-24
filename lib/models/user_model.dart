class UserModelCompany {
  String? name;
  String? catchPhrase;
  String? bs;

  UserModelCompany({
    this.name,
    this.catchPhrase,
    this.bs,
  });
  UserModelCompany.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    catchPhrase = json['catchPhrase']?.toString();
    bs = json['bs']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}

class UserModelAddressGeo {
  String? lat;
  String? lng;

  UserModelAddressGeo({
    this.lat,
    this.lng,
  });
  UserModelAddressGeo.fromJson(Map<String, dynamic> json) {
    lat = json['lat']?.toString();
    lng = json['lng']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class UserModelAddress {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  UserModelAddressGeo? geo;

  UserModelAddress({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });
  UserModelAddress.fromJson(Map<String, dynamic> json) {
    street = json['street']?.toString();
    suite = json['suite']?.toString();
    city = json['city']?.toString();
    zipcode = json['zipcode']?.toString();
    geo = (json['geo'] != null)
        ? UserModelAddressGeo.fromJson(json['geo'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    data['zipcode'] = zipcode;
    if (geo != null) {
      data['geo'] = geo!.toJson();
    }
    return data;
  }
}

class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  UserModelAddress? address;
  String? phone;
  String? website;
  UserModelCompany? company;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    username = json['username']?.toString();
    email = json['email']?.toString();
    address = (json['address'] != null)
        ? UserModelAddress.fromJson(json['address'])
        : null;
    phone = json['phone']?.toString();
    website = json['website']?.toString();
    company = (json['company'] != null)
        ? UserModelCompany.fromJson(json['company'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['phone'] = phone;
    data['website'] = website;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}
