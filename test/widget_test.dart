import 'package:flutter_test/flutter_test.dart';
import 'package:mini_katalog_uygulamasi/app.dart';

void main() {
  testWidgets('Mini katalog uygulamasi acilir', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniCatalogApp());
    await tester.pumpAndSettle();

    expect(find.text('Mini Katalog'), findsWidgets);
    expect(find.text('Urunler'), findsOneWidget);
    expect(find.text('Kablosuz Kulaklik'), findsOneWidget);
  });
}
