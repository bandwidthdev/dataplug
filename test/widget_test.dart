// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dataplug/main.dart';
import 'package:dataplug/screens/sharer_dashboard.dart';
import 'package:dataplug/screens/receiver_dashboard.dart';

void main() {
  testWidgets('Welcome screen loads and shows main actions', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DataPlugApp());
    expect(find.text('Welcome to DataPlug'), findsOneWidget);
    expect(find.text('Share My Bandwidth'), findsOneWidget);
    expect(find.text('Find Nearby Sharers'), findsOneWidget);
  });

  testWidgets('Sharer dashboard UI elements present', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: SharerDashboard()));
    expect(find.text('Sharer Dashboard'), findsOneWidget);
    expect(find.text('Enable Sharing'), findsOneWidget);
    expect(find.text('Speed Tier'), findsOneWidget);
    expect(find.text('Bandwidth Usage'), findsOneWidget);
  });

  testWidgets('Receiver dashboard UI elements present', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: ReceiverDashboard()));
    expect(find.text('Nearby Sharers'), findsOneWidget);
    expect(find.text('Sharer #1'), findsOneWidget);
    expect(find.text('Sharer #2'), findsOneWidget);
    expect(find.text('Connect'), findsWidgets);
  });
}
