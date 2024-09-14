import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    required this.imageUrl, required this.productName, required this.price, super.key,
  });

  final String imageUrl;
  final String productName;
  final int price;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () {
            context.pop();
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Detail Product'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(widget.imageUrl),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Product Name: ${widget.productName}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Price: ${widget.price}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
