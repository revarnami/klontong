import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.sku,
    required this.name,
    required this.description,
    required this.weight,
    required this.width,
    required this.length,
    required this.height,
    required this.image,
    required this.price,
  });

  const Product.empty()
      : this(
          id: '1',
          categoryId: 14,
          categoryName: '_empty.categoryName',
          sku: '_empty.sku',
          name: '_empty.name',
          description: '_empty.description',
          weight: 0,
          width: 0,
          length: 0,
          height: 0,
          image: '_empty.image',
          price: 0,
        );

  final String id;
  final int categoryId;
  final String categoryName;
  final String sku;
  final String name;
  final String description;
  final int weight;
  final int width;
  final int length;
  final int height;
  final String image;
  final int price;

  @override
  List<Object?> get props => [id];
}
