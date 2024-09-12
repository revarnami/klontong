import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klontong/core/errors/APIException.dart';
import 'package:klontong/core/errors/failure.dart';
import 'package:klontong/src/product/data/data_sources/product_remote_data_source.dart';
import 'package:klontong/src/product/data/models/product_model.dart';
import 'package:klontong/src/product/data/repositories/product_repository_implementation.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRemoteDataSource extends Mock
    implements ProductRemoteDataSource {}

void main() {
  late ProductRemoteDataSource productRemoteDataSource;
  late ProductRepositoryImplementation productRepositoryImplementation;

  setUp(() {
    productRemoteDataSource = MockProductRemoteDataSource();
    productRepositoryImplementation =
        ProductRepositoryImplementation(productRemoteDataSource);
  });

  const categoryId = 0;
  const categoryName = 'whatever.categoryName';
  const sku = 'whatever.sku';
  const name = 'whatever.name';
  const description = 'whatever.description';
  const weight = 0;
  const width = 0;
  const length = 0;
  const height = 0;
  const image = 'whatever.height';
  const price = 0;

  //Arrange for all group
  const mException = APIException(
    message: 'Unknown error',
    statusCode: '500',
  );

  group('addProduct', () {
    test('Should call [ProductRemoteDataSource.addProduct] and return Success',
        () async {
      //Arrange
      when(
        () => productRemoteDataSource.addProduct(
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
      ).thenAnswer((_) async => Future.value());
      //Act
      final result = await productRepositoryImplementation.addProduct(
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
      //Assert
      expect(result, equals(const Right<dynamic, void>(null)));
      verify(
        () => productRemoteDataSource.addProduct(
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
        ),
      ).called(1);
      verifyNoMoreInteractions(productRemoteDataSource);
    });

    test(
        'Should call [ProductRemoteDataSource.addProduct] and return [Failure]',
        () async {
      //Arrange
      when(
        () => productRemoteDataSource.addProduct(
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
      ).thenThrow(mException);
      //Act
      final result = await productRepositoryImplementation.addProduct(
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
      //Assert
      expect(
        result,
        equals(
          Left<APIFailure, dynamic>(
            APIFailure.fromAPIException(mException),
          ),
        ),
      );
      verify(
        () => productRemoteDataSource.addProduct(
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
        ),
      ).called(1);
      verifyNoMoreInteractions(productRemoteDataSource);
    });
  });

  const listProducts = [ProductModel.empty()];

  group('getProducts', () {
    test('Should call [ProductRemoteDataSource.getProducts] and return Success',
        () async {
      //Arrange
      when(() => productRemoteDataSource.getProducts())
          .thenAnswer((_) async => listProducts);
      //Act
      final result = await productRepositoryImplementation.getProducts();
      //Assert
      expect(
        result,
        equals(const Right<dynamic, List<ProductModel>>(listProducts)),
      );
      verify(
        () => productRemoteDataSource.getProducts(),
      ).called(1);
      verifyNoMoreInteractions(productRemoteDataSource);
    });

    test(
        'Should call [ProductRemoteDataSource.getProducts] and return [Failure]',
        () async {
      //Arrange
      when(() => productRemoteDataSource.getProducts()).thenThrow(mException);
      //Act
      final result = await productRepositoryImplementation.getProducts();
      //Assert
      expect(
        result,
        equals(
          Left<APIFailure, dynamic>(
            APIFailure.fromAPIException(mException),
          ),
        ),
      );
      verify(
        () => productRemoteDataSource.getProducts(),
      ).called(1);
      verifyNoMoreInteractions(productRemoteDataSource);
    });
  });
}
