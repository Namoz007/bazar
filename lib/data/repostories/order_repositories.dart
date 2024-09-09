import 'package:bazar/core/utils/helpers/dependency_helpers.dart';
import 'package:bazar/data/datasources/order_sources.dart';
import 'package:bazar/data/models/order_model.dart';

class OrderRepositories{
  final OrderSources _sources = getIt<OrderSources>();

  Future<void> order(OrderModel model) async{
    await _sources.order(model);
  }

  Future<List<OrderModel>> getMyOrderModel() async{
    return await _sources.getMyOrders();
  }
}