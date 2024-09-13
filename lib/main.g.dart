// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $productRoute,
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
