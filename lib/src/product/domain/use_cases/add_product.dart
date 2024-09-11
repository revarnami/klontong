import 'package:equatable/equatable.dart';
import 'package:klontong/core/use_case/use_case.dart';
import 'package:klontong/core/utils/typedef.dart';

class AddProduct extends UseCaseWithParams<void, AddProductParams> {
  @override
  ResultFuture<void> call(AddProductParams params) {
    // TODO: implement call
    throw UnimplementedError();
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
  });

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

  @override
  List<Object?> get props => [sku];
}