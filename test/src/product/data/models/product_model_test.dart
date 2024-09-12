import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:klontong/core/utils/typedef.dart';
import 'package:klontong/src/product/data/models/product_model.dart';
import 'package:klontong/src/product/domain/entities/product.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  //arrange
  const mModel = ProductModel.empty();
  final json = fixture('product.json');

  test('Should be a subclass of [Product] entity', () {
    //Assert
    expect(mModel, isA<Product>());
  });

  group('fromJson', () {
    test('Should return a [ProductModel] with right data', () {
      //Act
      final result = ProductModel.fromJson(json);
      //Assert
      expect(result, equals(mModel));
    });
  });

  group('toJson', () {
    test('Should return a [Json] with right data', () {
      //Act
      final result = mModel.toJson();
      final mJson = jsonEncode({
        'id': '1',
        'categoryId': 14,
        'categoryName': '_empty.categoryName',
        'sku': '_empty.sku',
        'name': '_empty.name',
        'description': '_empty.description',
        'weight': 0,
        'width': 0,
        'length': 0,
        'height': 0,
        'image': '_empty.image',
        'price': 0,
      });
      //Assert
      expect(result, mJson);
    });
  });
}
