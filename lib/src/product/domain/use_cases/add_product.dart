import 'package:equatable/equatable.dart';
import 'package:klontong/core/use_case/use_case.dart';
import 'package:klontong/core/utils/typedef.dart';
import 'package:klontong/src/product/domain/repositories/product_repository.dart';

class AddProduct extends UseCaseWithParams<void, AddProductParams> {
  AddProduct(this.productRepository);

  final ProductRepository productRepository;

  @override
  ResultFuture<void> call(AddProductParams params) {
    return productRepository.addProduct(
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
        price: params.price,);
  }
}

class AddProductParams extends Equatable {
  const AddProductParams({
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

  const AddProductParams.empty()
      : this(
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

  final int categoryId;
  final String categoryName;
  final String sku;
  final String name;
  final String description;
  final int weight;
  final int width;
  final int length;
  final int height;
  final int price;
  final String image;

  @override
  List<Object?> get props => [sku];
}
