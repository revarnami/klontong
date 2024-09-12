import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:klontong/core/errors/APIException.dart';
import 'package:klontong/core/utils/constants_app.dart';
import 'package:klontong/src/product/data/data_sources/product_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late http.Client client;
  late ProductRDSImplementation productRDSImplementation;

  setUp(() {
    client = MockClient();
    productRDSImplementation = ProductRDSImplementation(client);
    registerFallbackValue(Uri());
  });

  //arrange for all
  final response = http.Response('success', 200);
  final errorResponse = http.Response('Failed', 404);

  group('addProduct', () {
    test('Should complete successfully when status code is 200', () async {
      when(() => client.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => response);
      final methodCall = productRDSImplementation.addProduct;
      expect(
        methodCall(
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
        ),
        completes,
      );
      verify(
        () => client.post(
          Uri.parse('$baseUrl$productEndPoint'),
          body: jsonEncode({
            'categoryId': 0,
            'categoryName': 'categoryName',
            'sku': 'sku',
            'name': 'name',
            'description': 'description',
            'weight': 0,
            'width': 0,
            'length': 0,
            'height': 0,
            'image': 'image',
            'price': 0,
          }),
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });

    test('Should throw [APIException] when status code is not 200', () async {
      when(() => client.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => errorResponse);
      final methodCall = productRDSImplementation.addProduct;
      expect(
        () async => methodCall(
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
        ),
        throwsA(const APIException(message: 'Failed', statusCode: '404')),
      );
      verify(
        () => client.post(
          Uri.parse('$baseUrl$productEndPoint'),
          body: jsonEncode({
            'categoryId': 0,
            'categoryName': 'categoryName',
            'sku': 'sku',
            'name': 'name',
            'description': 'description',
            'weight': 0,
            'width': 0,
            'length': 0,
            'height': 0,
            'image': 'image',
            'price': 0,
          }),
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });
  });
}
