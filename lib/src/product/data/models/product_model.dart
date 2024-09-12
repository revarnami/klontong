import 'dart:convert';

import 'package:klontong/core/utils/typedef.dart';
import 'package:klontong/src/product/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.categoryId,
    required super.categoryName,
    required super.sku,
    required super.name,
    required super.description,
    required super.weight,
    required super.width,
    required super.length,
    required super.height,
    required super.image,
    required super.price,
  });

  const ProductModel.empty() : super.empty();

  ProductModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          categoryId: map['categoryId'] as int,
          categoryName: map['categoryName'] as String,
          sku: map['sku'] as String,
          name: map['name'] as String,
          description: map['description'] as String,
          weight: map['weight'] as int,
          width: map['width'] as int,
          length: map['length'] as int,
          height: map['height'] as int,
          image: map['image'] as String,
          price: map['price'] as int,
        );

  factory ProductModel.fromJson(String json) =>
      ProductModel.fromMap(jsonDecode(json) as DataMap);

  DataMap toMap() => {
        'id': id,
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
      };

  String toJson() => jsonEncode(toMap());

  ProductModel copyWith({
    String? id,
    int? categoryId,
    String? categoryName,
    String? sku,
    String? name,
    String? description,
    int? weight,
    int? width,
    int? length,
    int? height,
    String? image,
    int? price,
  }) {
    return ProductModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      sku: sku ?? this.sku,
      name: name ?? this.name,
      description: description ?? this.description,
      weight: weight ?? this.weight,
      width: width ?? this.width,
      length: length ?? this.length,
      height: height ?? this.height,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }
}
