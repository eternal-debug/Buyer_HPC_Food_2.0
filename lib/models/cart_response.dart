import 'dart:convert';

List<CartResponse> cartResponseFromJson(String str) => List<CartResponse>.from(
    json.decode(str).map((x) => CartResponse.fromJson(x)));

String cartResponseToJson(List<CartResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartResponse {
  final String id;
  final ProductId productId;
  final List<String> additives;
  final int totalPrice;
  final int quantity;
  final String? instructions;

  CartResponse({
    required this.id,
    required this.productId,
    required this.additives,
    required this.totalPrice,
    required this.quantity,
    this.instructions,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        id: json['_id'],
        productId: ProductId.fromJson(json['productId']),
        additives: List<String>.from(json['additives'].map((x) => x)),
        totalPrice: json['totalPrice'],
        quantity: json['quantity'],
        instructions: json['instructions'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'productId': productId.toJson(),
        'additives': List<dynamic>.from(additives.map((x) => x)),
        'totalPrice': totalPrice,
        'quantity': quantity,
        'instructions': instructions,
      };
}

class ProductId {
  final String id;
  final String title;
  final String restaurant;
  final double rating;
  final String ratingCount;
  final String imageUrl;

  ProductId({
    required this.id,
    required this.title,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.imageUrl,
  });

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json['_id'],
        title: json['title'],
        restaurant: json['restaurant'],
        rating: json['rating']?.toDouble(),
        ratingCount: json['ratingCount'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'restaurant': restaurant,
        'rating': rating,
        'ratingCount': ratingCount,
        'imageUrl': imageUrl,
      };
}
