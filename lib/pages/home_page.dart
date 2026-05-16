import 'package:flutter/material.dart';

import '../data/product_repository.dart';
import '../models/product.dart';
import 'product_detail_page.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductRepository _productRepository = const ProductRepository();
  late final Future<List<Product>> _productsFuture;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _productsFuture = _productRepository.loadProducts();
  }

  void _openProductDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        settings: RouteSettings(arguments: product),
        builder: (context) => const ProductDetailPage(),
      ),
    );
  }

  void _updateSearchQuery(String value) {
    setState(() {
      _searchQuery = value.trim().toLowerCase();
    });
  }

  List<Product> _filterProducts(List<Product> products) {
    if (_searchQuery.isEmpty) {
      return products;
    }

    return products.where((product) {
      final name = product.name.toLowerCase();
      final category = product.category.toLowerCase();

      return name.contains(_searchQuery) || category.contains(_searchQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Katalog'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFCF7),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF101018)),
              ),
              child: IconButton(
                onPressed: () {},
                tooltip: 'Sepet',
                icon: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
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

            final products = _filterProducts(snapshot.data ?? []);

            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  sliver: SliverToBoxAdapter(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFC55C),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF101018)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x302B2240),
                            blurRadius: 24,
                            offset: Offset(0, 14),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 6,
                              child: Image.asset(
                                'assets/images/catalog_banner.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned.fill(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Colors.black.withValues(alpha: 0.48),
                                      Colors.black.withValues(alpha: 0.04),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 18,
                              bottom: 16,
                              right: 18,
                              child: Text(
                                'Taze secimler',
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                  sliver: SliverToBoxAdapter(
                    child: TextField(
                      onChanged: _updateSearchQuery,
                      decoration: const InputDecoration(
                        hintText: 'Urun veya kategori ara',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Urunler',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                if (products.isEmpty)
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    sliver: SliverToBoxAdapter(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search_off,
                                color: Color(0xFF101018),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Arama sonucu bulunamadi.',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                else
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
                        final product = products[index];

                        return ProductCard(
                          product: product,
                          onTap: () => _openProductDetail(product),
                          accentColor: _productAccentColor(index),
                        );
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

  Color _productAccentColor(int index) {
    const colors = [
      Color(0xFFFFC55C),
      Color(0xFF9EC5FF),
      Color(0xFFFF8FD8),
      Color(0xFFFF6B5C),
      Color(0xFFFFB26B),
      Color(0xFFC7B6FF),
    ];

    return colors[index % colors.length];
  }
}
