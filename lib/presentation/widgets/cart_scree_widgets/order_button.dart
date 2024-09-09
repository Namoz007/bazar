import 'package:bazar/main.dart';
import 'package:bazar/presentation/screens/cart_screen/bloc/cart_bloc/order_bloc.dart';
import 'package:bazar/presentation/screens/cart_screen/bloc/cart_bloc/order_bloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OrderButton extends StatefulWidget {
  double price;
  OrderButton({super.key,required this.price,});

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.read<OrderBloc>().add(OrderingProductsOrderBlocEvent());
      },
      child: Container(
        width: double.infinity,
        height: 57,
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 30,),
        decoration: BoxDecoration(
          color: const Color(0xFF40BFFF),
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: Text("\$${widget.price}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white,),),
      ),
    );
  }
}
