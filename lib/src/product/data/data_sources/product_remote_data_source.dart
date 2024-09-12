import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:klontong/core/errors/APIException.dart';
import 'package:klontong/core/utils/constants_app.dart';
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
  ProductRDSImplementation(this.client);

  final http.Client client;

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
  }) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl$productEndPoint'),
        body: jsonEncode({
          'categoryId': categoryId,
          'categoryName': categoryName,
          'sku': sku,
          'name': name,
          'description': description,
          'weight': weight,
          'width': width,
          'length': length,
          'height': height,
          'image': image,
          'price': price,
        }),
      );
      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode.toString(),
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: '4444');
    }
  }

  @override
  Future<List<ProductModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
