import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klontong/core/errors/failure.dart';
import 'package:klontong/src/product/domain/entities/product.dart';
import 'package:klontong/src/product/domain/use_cases/add_product.dart';
import 'package:klontong/src/product/domain/use_cases/get_products.dart';
import 'package:klontong/src/product/presentation/notifier/product_notifier.dart';
import 'package:mocktail/mocktail.dart';

class MockAddProduct extends Mock implements AddProduct {}

class MockGetProducts extends Mock implements GetProducts {}

void main() {
  late AddProduct addProductUseCase;
  late GetProducts getProductsUseCase;
  late ProductNotifier productNotifier;
  late AddProductParams addProductParams;

  setUp(() {
    addProductUseCase = MockAddProduct();
    getProductsUseCase = MockGetProducts();
    productNotifier = ProductNotifier(
      addProduct: addProductUseCase,
      getProducts: getProductsUseCase,
    );

    addProductParams = const AddProductParams(
      categoryId: 0,
      categoryName: 'categoryName',
      sku: 'sku',
      name: 'name',
      description: 'description',
      weight: 0,
      width: 0,
      length: 0,
      height: 0,
      image: 'image',
      price: 0,
    );
  });

  //Arrange for All
  const failure = APIFailure(
    message: 'Unknown error',
    statusCode: '4444',
  );

  const listProduct = [Product.empty()];

  group('addingProduct', () {
    test(
      'Should call [stateLoading], [stateLoaded], [stateAddingComplete] '
      'when success',
      () async {
        //Arrange
        when(() => addProductUseCase(addProductParams))
            .thenAnswer((_) async => const Right(null));
        //Act
        final result = productNotifier.addingProduct(
          addProductParams.sku,
          addProductParams.name,
          addProductParams.description,
          addProductParams.weight,
          addProductParams.width,
          addProductParams.length,
          addProductParams.height,
          addProductParams.image,
          addProductParams.price,
        );
        //Assert
        expect(productNotifier.stateLoad, equals(ProductNotifier.stateLoading));
        await result;
        expect(productNotifier.stateLoad, equals(ProductNotifier.stateLoaded));
        expect(
          productNotifier.stateAddProduct,
          equals(ProductNotifier.stateAddingComplete),
        );
      },
    );

    test(
      'Should call [stateLoading], [stateLoaded], [errorMessage] '
      'when failed',
      () async {
        //Arrange
        when(() => addProductUseCase(addProductParams))
            .thenAnswer((_) async => const Left(failure));
        //Act
        final result = productNotifier.addingProduct(
          addProductParams.sku,
          addProductParams.name,
          addProductParams.description,
          addProductParams.weight,
          addProductParams.width,
          addProductParams.length,
          addProductParams.height,
          addProductParams.image,
          addProductParams.price,
        );
        //Assert
        expect(productNotifier.stateLoad, equals(ProductNotifier.stateLoading));
        await result;
        expect(productNotifier.stateLoad, equals(ProductNotifier.stateLoaded));
        expect(
          productNotifier.errorMessage,
          equals(failure.errorMessage),
        );
      },
    );
  });

  group('getProducts', () {
    test(
      'Should call [stateLoading], [stateLoaded], and return [List<Product] '
      'when success',
      () async {
        //Arrange
        when(() => getProductsUseCase())
            .thenAnswer((_) async => const Right(listProduct));
        //Act
        final result = productNotifier.gettingProducts();
        //Assert
        expect(productNotifier.stateLoad, equals(ProductNotifier.stateLoading));
        await result;
        expect(productNotifier.stateLoad, equals(ProductNotifier.stateLoaded));
        expect(
          productNotifier.products,
          equals(listProduct),
        );
      },
    );

    test(
      'Should call [stateLoading], [stateLoaded], and return [errorMessage] '
      'when failed',
      () async {
        //Arrange
        when(() => getProductsUseCase())
            .thenAnswer((_) async => const Left(failure));
        //Act
        final result = productNotifier.gettingProducts();
        //Assert
        expect(productNotifier.stateLoad, equals(ProductNotifier.stateLoading));
        await result;
        expect(productNotifier.stateLoad, equals(ProductNotifier.stateLoaded));
        expect(
          productNotifier.errorMessage,
          equals(failure.errorMessage),
        );
      },
    );
  });
}
