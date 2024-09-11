import 'package:klontong/core/utils/typedef.dart';
import 'package:klontong/src/product/domain/entities/product.dart';

abstract class ProductRepository {
  ResultVoid addProduct(
    String categoryId,
    String categoryName,
    String sku,
    String name,
    String description,
    String weight,
    String width,
    String length,
    String height,
    String image,
  );

  ResultFuture<List<Product>> getProducts();

  ResultFuture<Product> getProduct();
}
