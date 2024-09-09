import 'package:bazar/data/models/cart_model.dart';
import 'package:bazar/domain/entities/order.dart';
import 'package:bazar/presentation/screens/cart_screen/bloc/cart_bloc/order_bloc.dart';

class OrderModel extends Order {
  OrderModel({
    required super.userId,
    required super.id,
    required super.carts,
    required super.price,
    required super.dateTime,
    required super.action,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    Map<String,orderActions> actions = {
      "ordering": orderActions.ordering,
      "accepted": orderActions.accepted,
      "delivering": orderActions.delivering,
      "delivered": orderActions.delivered,
    };
    return OrderModel(
      userId: json['userId'],
      id: json['id'],
      carts: [
        for (int i = 0; i < json['carts'].length; i++)
          CartModel.fromJson(json['carts'][i])
      ],
      price: double.parse(json['price'].toString()),
      dateTime: DateTime.parse(json['dateTime'].toString()),
      action: actions[json['action']]!,
    );
  }

  Map<String,dynamic> toJson() {
    return {
      "userId": userId,
      "id": id,
      "carts": [for(int i = 0;i < carts.length;i++) carts[i].toJson()],
      "price": price,
      "dateTime": dateTime.toString(),
      "action": action.name,
    };
  }
}
