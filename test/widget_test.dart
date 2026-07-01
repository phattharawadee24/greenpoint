import 'package:flutter_test/flutter_test.dart';

import 'package:greenpoint/main.dart';

void main() {
  testWidgets('GreenPoint app แสดงหน้าโปรไฟล์ได้ถูกต้อง', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const GreenPointApp());
    await tester.pumpAndSettle();

    expect(find.text('GreenPoint'), findsOneWidget);
    expect(find.text('Mr. G'), findsOneWidget);
    expect(find.text('Achievements'), findsOneWidget);
    expect(find.text('ประวัติการทำรายการ'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Partner Store'), findsOneWidget);
    expect(find.text('Scan'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  testWidgets('กด Achievements ดูทั้งหมด แล้วเปิดหน้าใหม่ได้', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const GreenPointApp());
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('ดูทั้งหมด').first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('ดูทั้งหมด').first);
    await tester.pumpAndSettle();

    expect(find.text('Achievements ทั้งหมด'), findsOneWidget);
  });
}
