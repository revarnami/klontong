import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klontong/src/product/domain/repositories/product_repository.dart';
import 'package:klontong/src/product/domain/use_cases/add_product.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_product_repository.dart';

void main() {
  late ProductRepository productRepository;
  late AddProduct addProductUseCase;

  setUp(() {
    productRepository = MockProductRepository();
    addProductUseCase = AddProduct(productRepository);
  });

  const params = AddProductParams.empty();

  test('Should call [ProductRepository] and return null', () async {
    //Arrange
    when(
      () => productRepository.addProduct(
        categoryId: any(named: 'categoryId'),
        categoryName: any(named: 'categoryName'),
        sku: any(named: 'sku'),
        name: any(named: 'name'),
        description: any(named: 'description'),
        weight: any(named: 'weight'),
        width: any(named: 'width'),
        length: any(named: 'length'),
        height: any(named: 'height'),
        image: any(named: 'image'),
        price: any(named: 'price'),
      ),
    ).thenAnswer((_) async => const Right(null));
    //Act
    final result = await addProductUseCase.call(params);
    //Assert
    expect(result, equals(const Right<dynamic, void>(null)));
    verify(
      () => productRepository.addProduct(
        categoryId: params.categoryId,
        categoryName: params.categoryName,
        sku: params.sku,
        name: params.name,
        description: params.description,
        weight: params.weight,
        width: params.width,
        length: params.length,
        height: params.height,
        image: params.image,
        price: params.price,
      ),
    ).called(1);
    verifyNoMoreInteractions(productRepository);
  });
}
