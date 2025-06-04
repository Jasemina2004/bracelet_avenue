import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bracelet_avenue/main.dart';
import 'package:bracelet_avenue/screens/login_screen.dart';
import 'package:bracelet_avenue/screens/home_screen.dart';

void main() {
  testWidgets('Test loading of login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(LoginScreen), findsOneWidget);

    expect(find.text('Welcome'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
  });

  testWidgets('Test navigation to home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
