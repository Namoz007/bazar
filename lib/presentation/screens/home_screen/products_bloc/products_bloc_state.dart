import 'package:bazar/data/models/product_model.dart';
import 'package:bazar/presentation/screens/home_screen/products_bloc/products_bloc.dart';

sealed class ProductsBlocState{}

final class InitialProductsBlocState extends ProductsBlocState{}

final class LoadingProductsBlocState extends ProductsBlocState{
  productCategoryTypes type;

  LoadingProductsBlocState({required this.type,});
}

final class LoadedAllProductsBlocState extends ProductsBlocState{
  productCategoryTypes type;
  List<ProductModel> products;

  LoadedAllProductsBlocState({required this.type,required this.products});
}

final class ErrorProductsBlocState extends ProductsBlocState{
  String message;

  ErrorProductsBlocState({required this.message,});
}