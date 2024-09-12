import 'package:klontong/src/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<void> addProduct({
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

  Future<List<ProductModel>> getProducts();
}

class ProductRDSImplementation implements ProductRemoteDataSource {
  @override
  Future<void> addProduct({
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
  }) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
