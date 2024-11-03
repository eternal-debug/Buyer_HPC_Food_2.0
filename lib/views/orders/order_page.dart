// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:hpc_food/common/app_style.dart';
// import 'package:hpc_food/common/background_container.dart';
// import 'package:hpc_food/common/custom_button.dart';
// import 'package:hpc_food/common/reusable_text.dart';
// import 'package:hpc_food/constants/constants.dart';
// import 'package:hpc_food/controllers/orders_controller.dart';
// import 'package:hpc_food/models/addresses_response.dart';
// import 'package:hpc_food/models/distane_time.dart';
// import 'package:hpc_food/models/foods_model.dart';
// import 'package:hpc_food/models/order_model.dart';
// import 'package:hpc_food/models/order_request.dart';
// import 'package:hpc_food/models/restaurants_model.dart';
// import 'package:hpc_food/services/distance.dart';
// import 'package:hpc_food/views/orders/payment.dart';
// import 'package:hpc_food/views/orders/widgets/order_tile.dart';
// import 'package:hpc_food/views/restaurant/widget/row_text.dart';

// class OrderPage extends StatelessWidget {
//   const OrderPage(
//       {super.key,
//       this.restaurant,
//       required this.food,
//       required this.item,
//       this.address});
//   final RestaurantsModel? restaurant;
//   final FoodsModel food;
//   final OrderItem item;
//   final AddressResponse? address;

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(OrdersController());
//     DistanceTime data = Distance().calculateDistanceTimePrice(
//         restaurant!.description.latitude,
//         restaurant!.description.longitude,
//         address!.latitude,
//         address!.longitude,
//         10,
//         2);

//     double totalPrice = item.price + data.price;

//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Obx(() => controller.paymentUrl.contains('https')
//         ? const PaymentWebView()
//         : Scaffold(
//             backgroundColor: cPrimary,
//             appBar: AppBar(
//               backgroundColor: cPrimary,
//               title: ReusableText(
//                   text: 'Complete Ordering',
//                   style: appStyle(13, cLightWhite, FontWeight.w600)),
//             ),
//             body: BackgroundContainer(
//               color: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     OrderTile(food: food),
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 10.w, vertical: 10.h),
//                       width: width,
//                       height: height / 3.7,
//                       decoration: BoxDecoration(
//                           color: cOffWhite,
//                           borderRadius: BorderRadius.circular(12.r)),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 ReusableText(
//                                     text: restaurant!.title,
//                                     style:
//                                         appStyle(20, cGray, FontWeight.bold)),
//                                 CircleAvatar(
//                                   radius: 18.r,
//                                   backgroundColor: cPrimary,
//                                   backgroundImage:
//                                       NetworkImage(restaurant!.logoUrl),
//                                 ),
//                               ]),
//                           SizedBox(
//                             height: 5.h,
//                           ),
//                           RowText(
//                               first: 'Business Hours',
//                               second: restaurant!.time),
//                           SizedBox(
//                             height: 5.h,
//                           ),
//                           RowText(
//                               first: 'Distance from Restaurant',
//                               second: '${data.distance.toStringAsFixed(2)} km'),
//                           SizedBox(
//                             height: 5.h,
//                           ),
//                           RowText(
//                               first: 'Price from Restaurant',
//                               second: '\$ ${data.price.toStringAsFixed(2)}'),
//                           SizedBox(
//                             height: 5.h,
//                           ),
//                           SizedBox(
//                             height: 5.h,
//                           ),
//                           RowText(
//                               first: 'Order Total',
//                               second: '\$ ${item.price.toString()}'),
//                           SizedBox(
//                             height: 5.h,
//                           ),
//                           RowText(
//                               first: 'Grand Total',
//                               second: '\$ ${totalPrice.toStringAsFixed(2)}'),
//                           SizedBox(
//                             height: 10.h,
//                           ),
//                           ReusableText(
//                               text: 'Additives',
//                               style: appStyle(20, cGray, FontWeight.bold)),
//                           SizedBox(
//                             height: 5.h,
//                           ),
//                           SizedBox(
//                             width: width,
//                             height: 15.h,
//                             child: ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: item.additives.length,
//                                 itemBuilder: (context, i) {
//                                   String additive = item.additives[i];
//                                   return Container(
//                                     margin: EdgeInsets.only(right: 5.w),
//                                     decoration: BoxDecoration(
//                                       color: cSecondaryLight,
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(9.r),
//                                       ),
//                                     ),
//                                     child: Center(
//                                       child: Padding(
//                                         padding: EdgeInsets.all(2.h),
//                                         child: ReusableText(
//                                             text: additive,
//                                             style: appStyle(
//                                                 8, cGray, FontWeight.w400)),
//                                       ),
//                                     ),
//                                   );
//                                 }),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                     CustomButton(
//                       text: 'Proceed to Payment',
//                       btnHeight: 45,
//                       onTap: () {
//                         OrderRequest order = OrderRequest(
//                             userId: address!.userId,
//                             orderItems: [item],
//                             orderTotal: item.price,
//                             deliveryFee: data.price.toStringAsFixed(2),
//                             grandTotal: totalPrice,
//                             deliveryAddress: address!.id,
//                             restaurantAddress: restaurant!.description.address,
//                             restaurantId: restaurant!.id,
//                             restaurantDescription: [
//                               restaurant!.description.latitude,
//                               restaurant!.description.longitude
//                             ],
//                             recipientDescription: [
//                               address!.latitude,
//                               address!.longitude
//                             ]);

//                         String orderData = orderRequestToJson(order);

//                         controller.createOrder(orderData, order);
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ));
//   }
// }
