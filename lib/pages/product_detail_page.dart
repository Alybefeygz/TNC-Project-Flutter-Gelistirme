import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _cartCount = 0;

  void _addToCart(Product product) {
    setState(() {
      _cartCount++;
    });

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('${product.name} sepete eklendi.'),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments! as Product;
    const darkColor = Color(0xFF101018);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          tooltip: 'Geri',
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(product.name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: Badge(
                backgroundColor: const Color(0xFFFF8FD8),
                textColor: darkColor,
                label: Text('$_cartCount'),
                isLabelVisible: _cartCount > 0,
                child: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFFFFC55C),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: darkColor),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x302B2240),
                    blurRadius: 24,
                    offset: Offset(0, 14),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(product.image, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFF9EC5FF),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: darkColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  child: Text(
                    product.category,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: darkColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: darkColor),
            ),
            const SizedBox(height: 12),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF4F4A5E),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${product.price.toStringAsFixed(2)} TL',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: darkColor),
            ),
            const SizedBox(height: 20),
            DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFCF7),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: darkColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.shopping_cart_checkout, color: darkColor),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Sepetteki urun sayisi: $_cartCount',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: darkColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _addToCart(product),
              icon: const Icon(Icons.shopping_bag_outlined),
              label: const Text('Sepete Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
