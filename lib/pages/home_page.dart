import 'package:flutter/material.dart';

import '../data/product_repository.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductRepository _productRepository = const ProductRepository();
  late final Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = _productRepository.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Katalog'),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Sepet',
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<Product>>(
          future: _productsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text('Urunler yuklenirken bir sorun olustu.'),
              );
            }

            final products = snapshot.data ?? [];

            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  sliver: SliverToBoxAdapter(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AspectRatio(
                        aspectRatio: 16 / 6,
                        child: Image.asset(
                          'assets/images/banner.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Urunler',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  sliver: SliverGrid.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.72,
                        ),
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
