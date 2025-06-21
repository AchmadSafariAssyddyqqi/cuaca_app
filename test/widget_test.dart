import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cuaca_app/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen tampil dengan input dan tombol Cari', (WidgetTester tester) async {
    // Tampilkan HomeScreen dalam MaterialApp
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Periksa apakah TextField untuk kota muncul
    expect(find.byType(TextField), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Masukkan Nama Kota'), findsOneWidget);

    // Periksa apakah tombol 'Cari' muncul
    expect(find.widgetWithText(ElevatedButton, 'Cari'), findsOneWidget);
  });
}
