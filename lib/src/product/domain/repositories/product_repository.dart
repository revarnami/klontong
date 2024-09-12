import 'package:klontong/core/utils/typedef.dart';
import 'package:klontong/src/product/domain/entities/product.dart';

abstract class ProductRepository {
  ResultVoid addProduct({
    required int categoryId,
    required String categoryName,
    required String sku,
    required String name,
    required String description,
    required int weight,
    required int width,
    required int length,
    required int height,
    required String image,
    required int price,
  });

  ResultFuture<List<Product>> getProducts();

  ResultFuture<Product> getProduct();
}
