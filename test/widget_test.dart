import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_katalog_uygulamasi/app.dart';

void main() {
  testWidgets('Mini katalog uygulamasi acilir', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniCatalogApp());
    await tester.pumpAndSettle();

    expect(find.text('Mini Katalog'), findsWidgets);
    expect(find.text('Urunler'), findsOneWidget);
    expect(find.text('Sofresco Soguk Sikim Meyve Suyu'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'serum');
    await tester.pumpAndSettle();

    expect(find.text('Vitamin C Serumu'), findsOneWidget);
    expect(find.text('Sofresco Soguk Sikim Meyve Suyu'), findsNothing);

    final productTapArea = find.ancestor(
      of: find.text('Vitamin C Serumu'),
      matching: find.byType(InkWell),
    );

    await tester.ensureVisible(productTapArea);
    await tester.pumpAndSettle();
    await tester.tap(productTapArea);
    await tester.pumpAndSettle();

    const detailDescription =
        'Cilde parlaklik hissi veren, portakal temali vitamin C serumu.';

    expect(find.text('Vitamin C Serumu'), findsWidgets);
    await tester.scrollUntilVisible(find.text(detailDescription), 300);
    await tester.pumpAndSettle();

    expect(find.text(detailDescription), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Sepete Ekle'), 300);
    await tester.pumpAndSettle();
    expect(find.text('Sepete Ekle'), findsOneWidget);

    await tester.tap(find.text('Sepete Ekle'));
    await tester.pump();

    expect(find.text('Sepetteki urun sayisi: 1'), findsOneWidget);
    expect(find.text('Vitamin C Serumu sepete eklendi.'), findsOneWidget);
  });
}
