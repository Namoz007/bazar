import 'package:bazar/data/models/product_model.dart';
import 'package:bazar/domain/entities/product.dart';
import 'package:bazar/presentation/screens/home_screen/products_bloc/products_bloc.dart';
import 'package:bazar/presentation/screens/home_screen/products_bloc/products_bloc_evetn.dart';
import 'package:bazar/presentation/screens/main_page/bloc/mainpage_bloc.dart';
import 'package:bazar/presentation/screens/main_page/bloc/mainpage_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDetail extends StatefulWidget {
  const SearchDetail({super.key});

  @override
  State<SearchDetail> createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<MainPageBloc, MainPageBlocState>(
            builder: (context, state) {
              if (state is LoadedScreenIndexMainPageBlocState) {
                return TextFormField(
                  onTap: () {
                    if (state.index == 0) {
                      context.read<MainPageBloc>().selectScreen(1);
                    }
                  },
                  onChanged: (value) {
                    print("bu value");

                    //
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "Search Product",
                  ),
                );
              }
              return Container();
            },
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            // context.read<ProductsBloc>().add(CreateNewProductProductsBlocEvent(
            //     type: productCategoryTypes.all,
            //     product: ProductModel(
            // id: "",
            // name: "Nike sneaker",
            // description: "The best sneaker in the world",
            // color: "FFFFFF",
            // price: 50,
            // imageUrl: [
            //   'https://cdn.sanity.io/images/c1chvb1i/production/214ac000881684a7ce4d29619cab809b1b0510ea-1100x735.jpg'
            // ],
            // quantity: 150,
            // category: productCategoryTypes.sneaker,
            // reviews: [])));
          },
          child: const Icon(
            Icons.notifications,
            size: 24,
          ),
        )
      ],
    );
  }
}
