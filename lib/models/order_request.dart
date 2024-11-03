import 'dart:convert';

OrderRequest orderRequestFromJson(String str) =>
    OrderRequest.fromJson(json.decode(str));

String orderRequestToJson(OrderRequest data) => json.encode(data.toJson());

class OrderRequest {
  final String userId;
  final List<OrderItem> orderItems;
  final double orderTotal;
  final String deliveryFee;
  final double grandTotal;
  final String deliveryAddress;
  final String restaurantAddress;
  final String restaurantId;
  final List<double> restaurantDescription;
  final List<double> recipientDescription;

  OrderRequest({
    required this.userId,
    required this.orderItems,
    required this.orderTotal,
    required this.deliveryFee,
    required this.grandTotal,
    required this.deliveryAddress,
    required this.restaurantAddress,
    required this.restaurantId,
    required this.restaurantDescription,
    required this.recipientDescription,
  });

  factory OrderRequest.fromJson(Map<String, dynamic> json) => OrderRequest(
        userId: json['userId'],
        orderItems: List<OrderItem>.from(
            json['orderItems'].map((x) => OrderItem.fromJson(x))),
        orderTotal: json['orderTotal']?.toDouble(),
        deliveryFee: json['deliveryFee'],
        grandTotal: json['grandTotal']?.toDouble(),
        deliveryAddress: json['deliveryAddress'],
        restaurantAddress: json['restaurantAddress'],
        restaurantId: json['restaurantId'],
        restaurantDescription: List<double>.from(
            json['restaurantDescription'].map((x) => x?.toDouble())),
        recipientDescription: List<double>.from(
            json['recipientDescription'].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'orderItems': List<dynamic>.from(orderItems.map((x) => x.toJson())),
        'orderTotal': orderTotal,
        'deliveryFee': deliveryFee,
        'grandTotal': grandTotal,
        'deliveryAddress': deliveryAddress,
        'restaurantAddress': restaurantAddress,
        'restaurantId': restaurantId,
        'restaurantDescription':
            List<dynamic>.from(restaurantDescription.map((x) => x)),
        'recipientDescription':
            List<dynamic>.from(recipientDescription.map((x) => x)),
      };
}

class OrderItem {
  final String foodId;
  final int quantity;
  final double price;
  final List<String> additives;
  final String instructions;

  OrderItem({
    required this.foodId,
    required this.quantity,
    required this.price,
    required this.additives,
    required this.instructions,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        foodId: json['foodId'],
        quantity: json['quantity'],
        price: json['price']?.toDouble(),
        additives: List<String>.from(json['additives'].map((x) => x)),
        instructions: json['instructions'],
      );

  Map<String, dynamic> toJson() => {
        'foodId': foodId,
        'quantity': quantity,
        'price': price,
        'additives': List<dynamic>.from(additives.map((x) => x)),
        'instructions': instructions,
      };
}
