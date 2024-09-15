// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $productRoute,
      $productDetailRoute,
    ];

RouteBase get $productRoute => GoRouteData.$route(
      path: '/',
      factory: $ProductRouteExtension._fromState,
    );

extension $ProductRouteExtension on ProductRoute {
  static ProductRoute _fromState(GoRouterState state) => const ProductRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $productDetailRoute => GoRouteData.$route(
      path: '/product-detail',
      factory: $ProductDetailRouteExtension._fromState,
    );

extension $ProductDetailRouteExtension on ProductDetailRoute {
  static ProductDetailRoute _fromState(GoRouterState state) =>
      ProductDetailRoute(
        state.uri.queryParameters['image-url']!,
        state.uri.queryParameters['product-name']!,
        int.parse(state.uri.queryParameters['price']!),
        state.uri.queryParameters['sku']!,
        state.uri.queryParameters['description']!,
        int.parse(state.uri.queryParameters['weight']!),
        int.parse(state.uri.queryParameters['width']!),
        int.parse(state.uri.queryParameters['length']!),
        int.parse(state.uri.queryParameters['height']!),
      );

  String get location => GoRouteData.$location(
        '/product-detail',
        queryParams: {
          'image-url': imageUrl,
          'product-name': productName,
          'price': price.toString(),
          'sku': sku,
          'description': description,
          'weight': weight.toString(),
          'width': width.toString(),
          'length': length.toString(),
          'height': height.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
