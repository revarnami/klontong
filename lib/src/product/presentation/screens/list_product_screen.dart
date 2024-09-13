import 'package:flutter/material.dart';
import 'package:klontong/core/services/injection_container.dart';
import 'package:klontong/src/product/domain/use_cases/add_product.dart';
import 'package:klontong/src/product/domain/use_cases/get_products.dart';
import 'package:klontong/src/product/presentation/notifier/product_notifier.dart';
import 'package:klontong/src/product/presentation/screens/add_product_dialog.dart';
import 'package:provider/provider.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({super.key});

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  final searchController = TextEditingController();
  final productNameController = TextEditingController();
  final priceController = TextEditingController();
  final searchFocus = FocusNode();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<ProductNotifier>().gettingProducts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final listProduct = context.watch<ProductNotifier>().filteredProduct;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('List Product'),
      ),
      body: Consumer<ProductNotifier>(
        builder: (context, productNotifier, child) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                // width: SizeConfig.screenWidth * 0.30,
                child: TextField(
                  controller: searchController,
                  focusNode: searchFocus,
                  onChanged: (value) {
                    productNotifier.searchProduct(value);
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                    hintText: 'Search product',
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              if (productNotifier.stateLoad == ProductNotifier.stateLoading)
                const CircularProgressIndicator()
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: listProduct.length,
                    itemBuilder: (context, index) {
                      final product = listProduct[index];
                      return ListTile(
                        leading: Image.network(product.image),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name),
                          ],
                        ),
                        subtitle: Text('price ${product.price}'),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog<String>(
            context: context,
            builder: (context) => ChangeNotifierProvider(
              create: (_) => ProductNotifier(
                addProduct: sl<AddProduct>(),
                getProducts: sl<GetProducts>(),
              ),
              child: AddProductDialog(
                productNameController: productNameController,
                priceController: priceController,
              ),
            ),
          );
          await context.read<ProductNotifier>().gettingProducts();
        },
        tooltip: 'Add Product',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
