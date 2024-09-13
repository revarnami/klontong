import 'package:flutter/material.dart';
import 'package:klontong/src/product/presentation/notifier/product_notifier.dart';
import 'package:provider/provider.dart';

class AddProductDialog extends StatelessWidget {
  const AddProductDialog({
    required this.productNameController,
    required this.priceController,
    super.key,
  });

  final TextEditingController productNameController;
  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: productNameController,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                ),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final productNotifier = context.read<ProductNotifier>();
                  await productNotifier.addingProduct(
                    'random sku',
                    productNameController.text,
                    'No Description',
                    0,
                    0,
                    0,
                    0,
                    'https://loremflickr.com/640/480/food',
                    int.parse(priceController.text),
                  );
                  await productNotifier.gettingProducts();
                  Navigator.of(context).pop();
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
