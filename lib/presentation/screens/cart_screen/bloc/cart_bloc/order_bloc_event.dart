import 'package:bazar/data/models/product_model.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

sealed class OrderBlocEvent{}

final class GetAllMyOrderBlocEvent extends OrderBlocEvent{}

final class GetAllMyCardsOrderBlocEvent extends OrderBlocEvent{}

final class GetAllMyOrdersFromDataBaseOrderBlocEvent extends OrderBlocEvent{}


final class AddProductToCartOrderBlocEvent extends OrderBlocEvent{
  ProductModel model;

  AddProductToCartOrderBlocEvent({required this.model,});
}

final class RemoveProductFromCartOrderBlocEvent extends OrderBlocEvent{
  ProductModel model;

  RemoveProductFromCartOrderBlocEvent({required this.model,});
}

final class OrderingProductsOrderBlocEvent extends OrderBlocEvent{
  Point address;

  OrderingProductsOrderBlocEvent({required this.address});
}