import 'package:dartz/dartz.dart';
import 'package:klontong/core/errors/APIException.dart';
import 'package:klontong/core/errors/failure.dart';
import 'package:klontong/core/utils/typedef.dart';
import 'package:klontong/src/product/data/data_sources/product_remote_data_source.dart';
import 'package:klontong/src/product/domain/entities/product.dart';
import 'package:klontong/src/product/domain/repositories/product_repository.dart';

class ProductRepositoryImplementation implements ProductRepository {
  ProductRepositoryImplementation(this.productRemoteDataSource);

  final ProductRemoteDataSource productRemoteDataSource;

  @override
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
  }) async {
    try {
      final result = await productRemoteDataSource.addProduct(
        categoryId: categoryId,
        categoryName: categoryName,
        sku: sku,
        name: name,
        description: description,
        weight: weight,
        width: width,
        length: length,
        height: height,
        image: image,
        price: price,
      );
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromAPIException(e));
    }
  }

  @override
  ResultFuture<Product> getProduct() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<Product>> getProducts() async {
    try {
      final result = await productRemoteDataSource.getProducts();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromAPIException(e));
    }
  }
}
