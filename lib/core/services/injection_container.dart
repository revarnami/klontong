import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:klontong/src/product/data/data_sources/product_remote_data_source.dart';
import 'package:klontong/src/product/data/repositories/product_repository_implementation.dart';
import 'package:klontong/src/product/domain/repositories/product_repository.dart';
import 'package:klontong/src/product/domain/use_cases/add_product.dart';
import 'package:klontong/src/product/domain/use_cases/get_products.dart';
import 'package:klontong/src/product/presentation/notifier/product_notifier.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  sl
    // App Logic
    ..registerFactory(
      () => ProductNotifier(
        addProduct: sl(),
        getProducts: sl(),
      ),
    )

    // Use cases
    ..registerLazySingleton(() => AddProduct(sl()))
    ..registerLazySingleton(() => GetProducts(sl()))

    // Repositories
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImplementation(sl()),
    )

    // Data Sources
    ..registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRDSImplementation(sl()),
    )

    // External Dependencies
    ..registerLazySingleton(http.Client.new);
}
