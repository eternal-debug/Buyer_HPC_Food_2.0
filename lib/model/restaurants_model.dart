import 'dart:convert';

List<RestaurantsModel> restaurantsModelFromJson(String str) =>
    List<RestaurantsModel>.from(
        json.decode(str).map((x) => RestaurantsModel.fromJson(x)));

String restaurantsModelToJson(List<RestaurantsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantsModel {
  final String id;
  final String title;
  final String time;
  final String imageUrl;
  final List<dynamic> foods;
  final bool pickUp;
  final bool delivery;
  final String owner;
  final bool isAvailable;
  final String logoUrl;
  final double rating;
  final String ratingCount;
  final String verification;
  final String verificationMessage;
  final Description description;

  RestaurantsModel({
    required this.id,
    required this.title,
    required this.time,
    required this.imageUrl,
    required this.foods,
    required this.pickUp,
    required this.delivery,
    required this.owner,
    required this.isAvailable,
    required this.logoUrl,
    required this.rating,
    required this.ratingCount,
    required this.verification,
    required this.verificationMessage,
    required this.description,
  });

  factory RestaurantsModel.fromJson(Map<String, dynamic> json) =>
      RestaurantsModel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        foods: List<dynamic>.from(json["food"].map((x) => x)),
        pickUp: json["pickUp"],
        delivery: json["delivery"],
        owner: json["owner"],
        isAvailable: json["isAvailable"],
        logoUrl: json["logoUrl"],
        rating: (json["rating"] as num).toDouble(),
        ratingCount: json["ratingCount"],
        verification: json["verification"],
        verificationMessage: json["verificationMessage"],
        description: Description.fromJson(json["description"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time,
        "imageUrl": imageUrl,
        "food": List<dynamic>.from(foods.map((x) => x)),
        "pickUp": pickUp,
        "delivery": delivery,
        "owner": owner,
        "isAvailable": isAvailable,
        "logoUrl": logoUrl,
        "rating": rating,
        "ratingCount": ratingCount,
        "verification": verification,
        "verificationMessage": verificationMessage,
        "description": description.toJson(),
      };
}

class Description {
  final String id;
  final double latitude;
  final double longitude;
  final String address;
  final String title;
  final double latitudeDelta;
  final double longitudeDelta;

  Description({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.title,
    required this.latitudeDelta,
    required this.longitudeDelta,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        id: json["id"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        address: json["address"],
        title: json["title"],
        latitudeDelta: json["latitudeDelta"]?.toDouble(),
        longitudeDelta: json["longitudeDelta"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "title": title,
        "latitudeDelta": latitudeDelta,
        "longitudeDelta": longitudeDelta,
      };
}
