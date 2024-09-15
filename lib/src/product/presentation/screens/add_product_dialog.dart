import 'package:flutter/material.dart';
import 'package:klontong/src/product/presentation/notifier/product_notifier.dart';
import 'package:provider/provider.dart';

class AddProductDialog extends StatelessWidget {
  const AddProductDialog({
    required this.productNameController,
    required this.priceController,
    required this.skuController,
    required this.descriptionController,
    required this.weightController,
    required this.widthController,
    required this.lengthController,
    required this.heightController,
    super.key,
  });

  final TextEditingController productNameController;
  final TextEditingController skuController;
  final TextEditingController descriptionController;
  final TextEditingController weightController;
  final TextEditingController widthController;
  final TextEditingController lengthController;
  final TextEditingController heightController;
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
                keyboardType: TextInputType.text,
                controller: skuController,
                decoration: const InputDecoration(
                  labelText: 'SKU',
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: productNameController,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: weightController,
                decoration: const InputDecoration(
                  labelText: 'Weight',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: widthController,
                decoration: const InputDecoration(
                  labelText: 'Width',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: lengthController,
                decoration: const InputDecoration(
                  labelText: 'Length',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: heightController,
                decoration: const InputDecoration(
                  labelText: 'Height',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: priceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final productNotifier = context.read<ProductNotifier>();
                  await productNotifier.addingProduct(
                    skuController.text,
                    productNameController.text,
                    descriptionController.text,
                    int.parse(weightController.text),
                    int.parse(widthController.text),
                    int.parse(lengthController.text),
                    int.parse(heightController.text),
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
