// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

List<LocationModel> locationModelFromJson(String str) => List<LocationModel>.from(json.decode(str).map((x) => LocationModel.fromJson(x)));

String locationModelToJson(List<LocationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationModel {
  LocationModel({
    this.id,
    this.name,
    this.content,
    this.slug,
    this.imageId,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.status,
    this.lft,
    this.rgt,
    this.parentId,
    this.createUser,
    this.updateUser,
    this.deletedAt,
    this.originId,
    this.lang,
    this.createdAt,
    this.updatedAt,
    this.bannerImageId,
    this.tripIdeas,
    this.centerAdminId,
    this.phoneNumber,
    this.city,
    this.country,
    this.webSite,
    this.zipCode,
    this.email,
    this.houseNumber,
    this.streetName,
  });

  int? id;
  String? name;
  String? content;
  String? slug;
  int? imageId;
  String? mapLat;
  String? mapLng;
  int? mapZoom;
  String? status;
  int? lft;
  int? rgt;
  dynamic parentId;
  int? createUser;
  dynamic updateUser;
  DateTime? deletedAt;
  dynamic originId;
  dynamic lang;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? bannerImageId;
  String? tripIdeas;
  dynamic centerAdminId;
  dynamic phoneNumber;
  dynamic city;
  dynamic country;
  dynamic webSite;
  dynamic zipCode;
  dynamic email;
  dynamic houseNumber;
  dynamic streetName;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    id: json["id"],
    name: json["name"],
    content: json["content"] == null ? null : json["content"],
    slug: json["slug"],
    imageId: json["image_id"],
    mapLat: json["map_lat"],
    mapLng: json["map_lng"],
    mapZoom: json["map_zoom"],
    status: json["status"],
    lft: json["_lft"],
    rgt: json["_rgt"],
    parentId: json["parent_id"],
    createUser: json["create_user"],
    updateUser: json["update_user"],
    deletedAt: DateTime.parse(json["deleted_at"]),
    originId: json["origin_id"],
    lang: json["lang"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    bannerImageId: json["banner_image_id"] == null ? null : json["banner_image_id"],
    tripIdeas: json["trip_ideas"] == null ? null : json["trip_ideas"],
    centerAdminId: json["center_admin_id"],
    phoneNumber: json["phone_number"],
    city: json["city"],
    country: json["country"],
    webSite: json["web_site"],
    zipCode: json["zip_code"],
    email: json["email"],
    houseNumber: json["house_number"],
    streetName: json["street_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "content": content == null ? null : content,
    "slug": slug,
    "image_id": imageId,
    "map_lat": mapLat,
    "map_lng": mapLng,
    "map_zoom": mapZoom,
    "status": status,
    "_lft": lft,
    "_rgt": rgt,
    "parent_id": parentId,
    "create_user": createUser,
    "update_user": updateUser,
    "deleted_at": deletedAt!.toIso8601String(),
    "origin_id": originId,
    "lang": lang,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "banner_image_id": bannerImageId == null ? null : bannerImageId,
    "trip_ideas": tripIdeas == null ? null : tripIdeas,
    "center_admin_id": centerAdminId,
    "phone_number": phoneNumber,
    "city": city,
    "country": country,
    "web_site": webSite,
    "zip_code": zipCode,
    "email": email,
    "house_number": houseNumber,
    "street_name": streetName,
  };
}
