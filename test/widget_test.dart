// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:transform_io_v2/main.dart';

void main() {
  testWidgets("Description of Test", (WidgetTester tester) async {
    // Use keys to find the widgets we want to test

    final targetWidget = find.byKey(ValueKey("widgetKey"));
    final targetWidget2 = find.byKey(ValueKey("widget2Key"));


    // execute the actual test
    // we need to wrap out widget in a material app widget as we are extracting it as a stand alone widget
    await tester.pumpWidget(MaterialApp(home: targetWidget));
    await tester.enterText(targetWidget, "Input Text");
    await tester.tap(targetWidget2);

    // Rebuilding the widget
    // set state for widget tests
    await tester.pump();

    // check outputs
    expect(find.text("Input text"), findsOneWidget);


  });
}
