import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klontong/src/product/domain/entities/product.dart';
import 'package:klontong/src/product/domain/repositories/product_repository.dart';
import 'package:klontong/src/product/domain/use_cases/get_products.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_product_repository.dart';

void main() {
  late ProductRepository productRepository;
  late GetProducts getProductsUseCase;

  setUp(() {
    productRepository = MockProductRepository();
    getProductsUseCase = GetProducts(productRepository);
  });

  const listProduct = [Product.empty()];

  test('Should call [ProductRepository] and return list [Product]', () async {
    //Arrange
    when(() => productRepository.getProducts())
        .thenAnswer((_) async => const Right(listProduct));
    //Act
    final result = await getProductsUseCase();
    //Assert
    expect(result, equals(const Right<dynamic, List<Product>>(listProduct)));
    verify(() => productRepository.getProducts()).called(1);
    verifyNoMoreInteractions(productRepository);
  });
}
