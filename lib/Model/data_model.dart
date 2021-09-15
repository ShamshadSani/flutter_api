

class DataModel {
  DataModel({
    this.id,
    this.obdbId,
    this.name,
    this.breweryType,
    this.street,
    this.address2,
    this.address3,
    this.city,
    this.state,
    this.countyProvince,
    this.postalCode,
    this.country,
    this.longitude,
    this.latitude,
    this.phone,
    this.websiteUrl,
    this.updatedAt,
    this.createdAt,
  });

  int? id;
  String? obdbId;
  String? name;
  String? breweryType;
  String? street;
  dynamic address2;
  dynamic address3;
  String? city;
  String? state;
  dynamic countyProvince;
  String? postalCode;
  String? country;
  String? longitude;
  String? latitude;
  String? phone;
  String? websiteUrl;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    id: json["id"],
    obdbId: json["obdb_id"],
    name: json["name"],
    breweryType: json["brewery_type"],
    street: json["street"] == null ? null : json["street"],
    address2: json["address_2"],
    address3: json["address_3"],
    city: json["city"],
    state: json["state"],
    countyProvince: json["county_province"],
    postalCode: json["postal_code"],
    country: json["country"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    phone: json["phone"] == null ? null : json["phone"],
    websiteUrl: json["website_url"] == null ? null : json["website_url"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
  );
}

