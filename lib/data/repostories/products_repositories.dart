import 'package:bazar/core/utils/helpers/dependency_helpers.dart';
import 'package:bazar/data/datasources/products_sources.dart';
import 'package:bazar/data/models/product_model.dart';
import 'package:bazar/data/models/review_model.dart';

class ProductsRepositories{
  final ProductsSources _sources = getIt<ProductsSources>();

  Future<List<ProductModel>> getAllProducts() async{
    return await _sources.getAllProducts();
  }

  Future<void> createNewProduct(ProductModel product) async{
    await _sources.createNewProduct(product);
  }

  Future<ReviewModel> writeReview(ReviewModel review) async{
    return await _sources.writeReview(review);
  }
}