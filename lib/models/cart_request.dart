import 'dart:convert';

CartRequest cartRequestFromJson(String str) =>
    CartRequest.fromJson(json.decode(str));

String cartRequestToJson(CartRequest data) => json.encode(data.toJson());

class CartRequest {
  final String productId;
  final int totalPrice;
  final List<String> additives;
  final int quantity;
  final String? instructions;

  CartRequest({
    required this.productId,
    required this.totalPrice,
    required this.additives,
    required this.quantity,
    this.instructions,
  });

  factory CartRequest.fromJson(Map<String, dynamic> json) => CartRequest(
        productId: json["productId"],
        totalPrice: json["totalPrice"],
        additives: List<String>.from(json["additives"].map((x) => x)),
        quantity: json["quantity"],
        instructions: json["instructions"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "totalPrice": totalPrice,
        "additives": List<dynamic>.from(additives.map((x) => x)),
        "quantity": quantity,
        "instructions": instructions,
      };
}
