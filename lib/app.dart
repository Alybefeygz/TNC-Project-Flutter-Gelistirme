import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'theme/app_theme.dart';

class MiniCatalogApp extends StatelessWidget {
  const MiniCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomePage(),
    );
  }
}
