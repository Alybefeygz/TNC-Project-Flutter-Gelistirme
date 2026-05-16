import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_katalog_uygulamasi/app.dart';

void main() {
  testWidgets('Mini katalog uygulamasi acilir', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniCatalogApp());
    await tester.pumpAndSettle();

    expect(find.text('Mini Katalog'), findsWidgets);
    expect(find.text('Urunler'), findsOneWidget);
    expect(find.text('Kablosuz Kulaklik'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'saat');
    await tester.pumpAndSettle();

    expect(find.text('Akilli Saat'), findsOneWidget);
    expect(find.text('Kablosuz Kulaklik'), findsNothing);

    await tester.tap(find.text('Akilli Saat'));
    await tester.pumpAndSettle();

    expect(
      find.text(
        'Bildirim takibi, aktivite olcumu ve sade arayuz sunan akilli saat.',
      ),
      findsOneWidget,
    );
    expect(find.text('Sepete Ekle'), findsOneWidget);

    await tester.tap(find.text('Sepete Ekle'));
    await tester.pump();

    expect(find.text('Sepetteki urun sayisi: 1'), findsOneWidget);
    expect(find.text('Akilli Saat sepete eklendi.'), findsOneWidget);
  });
}
