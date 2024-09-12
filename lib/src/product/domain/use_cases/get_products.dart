import 'package:klontong/core/use_case/use_case.dart';
import 'package:klontong/core/utils/typedef.dart';
import 'package:klontong/src/product/domain/entities/product.dart';
import 'package:klontong/src/product/domain/repositories/product_repository.dart';

class GetProducts extends UseCaseWithoutParams<List<Product>> {
  GetProducts(this.productRepository);

  final ProductRepository productRepository;

  @override
  ResultFuture<List<Product>> call() {
    return productRepository.getProducts();
  }
}
