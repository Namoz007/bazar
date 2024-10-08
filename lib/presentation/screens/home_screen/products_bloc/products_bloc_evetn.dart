import 'package:bazar/data/models/product_model.dart';
import 'package:bazar/data/models/review_model.dart';
import 'package:bazar/presentation/screens/home_screen/products_bloc/products_bloc.dart';

sealed class ProductsBlocEvent {}

final class GetAllProductsBlocEvent extends ProductsBlocEvent {
  productCategoryTypes type;

  GetAllProductsBlocEvent({
    required this.type,
  });
}

final class GetAllProductsFromDataSourcesProductsBlocEvent
    extends ProductsBlocEvent {
  productCategoryTypes type;

  GetAllProductsFromDataSourcesProductsBlocEvent({
    required this.type,
  });
}

final class CreateNewProductProductsBlocEvent extends ProductsBlocEvent {
  productCategoryTypes type;
  ProductModel product;

  CreateNewProductProductsBlocEvent(
      {required this.type, required this.product});
}

final class WriteReviewForProductsBlocEvent extends ProductsBlocEvent {
  ReviewModel review;
  productCategoryTypes type;

  WriteReviewForProductsBlocEvent({
    required this.review,
    required this.type,
  });
}

final class SearchProductsBlocEvent extends ProductsBlocEvent {
  String search;

  SearchProductsBlocEvent({
    required this.search,
  });
}
