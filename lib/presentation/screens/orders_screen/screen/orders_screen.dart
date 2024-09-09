import 'package:bazar/main.dart';
import 'package:bazar/presentation/screens/cart_screen/bloc/cart_bloc/order_bloc.dart';
import 'package:bazar/presentation/screens/cart_screen/bloc/cart_bloc/order_bloc_event.dart';
import 'package:bazar/presentation/screens/cart_screen/bloc/cart_bloc/order_bloc_state.dart';
import 'package:bazar/presentation/widgets/order_screen_widgets/loading_state_orders.dart';
import 'package:bazar/presentation/widgets/order_screen_widgets/show_orders_for_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(GetAllMyOrderBlocEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: BlocBuilder<OrderBloc, OrderBlocState>(
          builder: (context, state) {
            if (state is LoadingOrderBlocState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return const LoadingStateOrders();
                },
              );
            }

            if (state is LoadedAllCardsOrderBlocState) {
              return state.orders.isEmpty ? const Center(child: Text("Orders not available!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),),) : ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  return ShowOrdersForMenu(orderModel: state.orders[index],);
                },
              );
            }

            return const SizedBox();
          },
        ),
        onRefresh: () async {
          context
              .read<OrderBloc>()
              .add(GetAllMyOrdersFromDataBaseOrderBlocEvent());
        },
      ),
    );
  }
}
