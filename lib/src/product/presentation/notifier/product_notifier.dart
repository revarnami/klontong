import 'package:flutter/cupertino.dart';
import 'package:klontong/src/product/domain/entities/product.dart';
import 'package:klontong/src/product/domain/use_cases/add_product.dart';
import 'package:klontong/src/product/domain/use_cases/get_products.dart';

class ProductNotifier with ChangeNotifier {
  ProductNotifier({required this.addProduct, required this.getProducts});

  final AddProduct addProduct;
  final GetProducts getProducts;

  static const stateLoading = 0;
  static const stateLoaded = 1;
  static const stateAddingComplete = 2;
  static const stateAddingFailed = 3;

  int _stateLoad = stateLoaded;

  int get stateLoad => _stateLoad;

  int _stateAddProduct = stateAddingComplete;
  int get stateAddProduct => _stateAddProduct;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<Product> _products = [];

  List<Product> get products => _products;

  List<Product> _filteredProduct = [];
  List<Product> get filteredProduct => _filteredProduct;

  void clearErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> gettingProducts() async {
    _stateLoad = stateLoading;
    notifyListeners();
    final result = await getProducts();
    result.fold(
      (failure) {
        _errorMessage = failure.errorMessage;
      },
      (listProducts) {
        _products = listProducts;
        searchProduct('');
      },
    );
    _stateLoad = stateLoaded;
    notifyListeners();
  }

  Future<void> addingProduct(
    String sku,
    String name,
    String description,
    int weight,
    int width,
    int length,
    int height,
    String image,
    int price,
  ) async {
    _stateLoad = stateLoading;
    notifyListeners();
    final result = await addProduct(
      AddProductParams(
        categoryId: 46,
        categoryName: 'Food',
        sku: sku,
        name: name,
        description: description,
        weight: weight,
        width: width,
        length: length,
        height: height,
        image: image,
        price: price,
      ),
    );

    result.fold(
      (failure) {
        _errorMessage = failure.errorMessage;
        _stateAddProduct = stateAddingFailed;
      },
      (_) {
        _stateAddProduct = stateAddingComplete;
      },
    );
    _stateLoad = stateLoaded;
    notifyListeners();
  }

  void searchProduct(String query) {
    if (query.isEmpty) {
      _filteredProduct = _products;
    } else {
      _filteredProduct = _products
          .where((s) => s.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      if (_filteredProduct.isEmpty) {
        _filteredProduct = _products
            .where((s) => s.sku.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    }
    notifyListeners();
  }
}
