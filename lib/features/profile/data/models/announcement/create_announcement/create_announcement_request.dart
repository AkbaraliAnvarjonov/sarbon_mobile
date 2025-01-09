class CreateAndUpdateAnnouncementRequest {
  CreateAndUpdateAnnouncementRequest({
    this.data,
  });

  CreateAndUpdateAnnouncementRequest.fromJson(Map json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.name,
    this.vehicleTypeId,
    this.price,
    this.description,
    this.contact,
    this.currencyId,
    this.photo,
    this.status,
    this.usersId,
    this.madeDate,
    this.addressId,
    this.saleId,
    this.guid,
    this.cityId,
  });

  Data.fromJson(Map json) {
    name = json['name'];
    vehicleTypeId = json['vehicle_type_id'];
    price = json['price'];
    description = json['description'];
    contact = json['contact'];
    currencyId = json['currency_id'];
    photo = json['photo'];
    status = json['status'] != null ? json['status'].cast<String>() : [];
    usersId = json['users_id'];
    madeDate = json['made_date'];
    addressId = json['address_id'];
    saleId = json['sale_id'];
    guid = json['guid'];
    cityId = json['city_id'];
  }

  String? name;
  String? vehicleTypeId;
  num? price;
  String? description;
  String? contact;
  String? currencyId;
  String? photo;
  List<String>? status;
  String? usersId;
  String? madeDate;
  String? addressId;
  String? saleId;
  String? guid;
  String? cityId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['vehicle_type_id'] = vehicleTypeId;
    map['price'] = price;
    map['description'] = description;
    map['contact'] = contact;
    map['currency_id'] = currencyId;
    map['photo'] = photo;
    map['status'] = status;
    map['users_id'] = usersId;
    map['made_date'] = madeDate;
    map['address_id'] = addressId;
    map['sale_id'] = saleId;
    if (guid != null) map['guid'] = guid;
    if (cityId != null) map['city_id'] = cityId;
    return map;
  }
}
