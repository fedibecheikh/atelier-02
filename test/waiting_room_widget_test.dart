import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waiting_room_app/main.dart';

void main() {
  testWidgets('should add a new client to the list on button tap',
      (tester) async {
    // ARRANGE
    await tester.pumpWidget(const WaitingRoomApp());

    // ACT
    await tester.enterText(find.byType(TextField), 'Alice');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // ASSERT
    expect(find.text('Alice'), findsOneWidget);
    expect(find.text('Clients in Queue: 1'), findsOneWidget);
  });

  testWidgets('should remove a client when the delete button is tapped',
      (tester) async {
    // ARRANGE
    await tester.pumpWidget(const WaitingRoomApp());
    await tester.enterText(find.byType(TextField), 'Bob');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // ACT
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    // ASSERT
    expect(find.text('Bob'), findsNothing);
    expect(find.text('Clients in Queue: 0'), findsOneWidget);
  });

  testWidgets('should not add an empty client', (tester) async {
    await tester.pumpWidget(const WaitingRoomApp());

    await tester.enterText(find.byType(TextField), '   ');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Clients in Queue: 0'), findsOneWidget);
  });
}
