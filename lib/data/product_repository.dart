import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/product.dart';

class ProductRepository {
  const ProductRepository();

  Future<List<Product>> loadProducts() async {
    final jsonText = await rootBundle.loadString('assets/data/products.json');
    final jsonList = jsonDecode(jsonText) as List<dynamic>;

    return jsonList
        .map((jsonItem) => Product.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }
}
