import 'dart:convert';

List<FoodsModel> foodsModelFromJson(String str) =>
    List<FoodsModel>.from(json.decode(str).map((x) => FoodsModel.fromJson(x)));

String foodsModelToJson(List<FoodsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodsModel {
  final String id;
  final String title;
  final List<String> foodTags;
  final List<String> foodType;
  final bool isAvailable;
  final String restaurant;
  final double rating;
  final String ratingCount;
  final String description;
  final int price;
  final List<Additive> additives;
  final String imageUrl;
  final String category;
  final String time;

  FoodsModel({
    required this.id,
    required this.title,
    required this.foodTags,
    required this.foodType,
    required this.isAvailable,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.price,
    required this.additives,
    required this.imageUrl,
    required this.category,
    required this.time,
  });

  factory FoodsModel.fromJson(Map<String, dynamic> json) => FoodsModel(
        id: json['_id'],
        title: json['title'],
        foodTags: List<String>.from(json['foodTags'].map((x) => x)),
        foodType: List<String>.from(json['foodType'].map((x) => x)),
        isAvailable: json['isAvailable'],
        restaurant: json['restaurant'],
        rating: json['rating']?.toDouble(),
        ratingCount: json['ratingCount'],
        description: json['description'],
        price: json['price'],
        additives: List<Additive>.from(
            json['additives'].map((x) => Additive.fromJson(x))),
        imageUrl: json['imageUrl'],
        category: json['category'],
        time: json['time'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'foodTags': List<dynamic>.from(foodTags.map((x) => x)),
        'foodType': List<dynamic>.from(foodType.map((x) => x)),
        'isAvailable': isAvailable,
        'restaurant': restaurant,
        'rating': rating,
        'ratingCount': ratingCount,
        'description': description,
        'price': price,
        'additives': List<dynamic>.from(additives.map((x) => x.toJson())),
        'imageUrl': imageUrl,
        'category': category,
        'time': time,
      };
}

class Additive {
  final int id;
  final String title;
  final int price;

  Additive({
    required this.id,
    required this.title,
    required this.price,
  });

  factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        id: json['id'],
        title: json['title'],
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
      };
}
