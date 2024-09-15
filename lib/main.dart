import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klontong/core/services/injection_container.dart';
import 'package:klontong/core/utils/color_constants.dart';
import 'package:klontong/core/utils/size_config.dart';
import 'package:klontong/src/product/domain/use_cases/add_product.dart';
import 'package:klontong/src/product/domain/use_cases/get_products.dart';
import 'package:klontong/src/product/presentation/notifier/product_notifier.dart';
import 'package:klontong/src/product/presentation/screens/list_product_screen.dart';
import 'package:klontong/src/product/presentation/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

part 'main.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp.router(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: WidgetStateTextStyle.resolveWith((states) {
            return const TextStyle(color: Colors.black);
          }),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
          titleSmall: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        primaryColor: ColorConstants.primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorConstants.primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }

  late final GoRouter _router = GoRouter(
    routes: $appRoutes,
  );
}

@TypedGoRoute<ProductRoute>(
  path: '/',
)
class ProductRoute extends GoRouteData {
  const ProductRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ChangeNotifierProvider(
        create: (_) => ProductNotifier(
          addProduct: sl<AddProduct>(),
          getProducts: sl<GetProducts>(),
        ),
        child: const ListProductScreen(),
      );
}

@TypedGoRoute<ProductDetailRoute>(
  path: '/product-detail',
)
class ProductDetailRoute extends GoRouteData {
  const ProductDetailRoute(
    this.imageUrl,
    this.productName,
    this.price,
    this.sku,
    this.description,
    this.weight,
    this.width,
    this.length,
    this.height,
  );

  final String imageUrl;
  final String productName;
  final int price;
  final String sku;
  final String description;
  final int weight;
  final int width;
  final int length;
  final int height;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProductDetailScreen(
        imageUrl: imageUrl,
        productName: productName,
        price: price,
        sku: sku,
        description: description,
        weight: weight,
        width: width,
        length: length,
        height: height,
      );
}
