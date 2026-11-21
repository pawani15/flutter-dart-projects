import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_firebase_app/models/todo_model.dart';

// The screens and services need a live Firebase connection, so these
// tests cover only the model, which works without Firebase.
void main() {
  test('TodoModel.toMap stores all fields for Firestore', () {
    final createdAt = DateTime(2026, 11, 21, 9, 30);
    final todo = TodoModel(
      id: 'abc',
      title: 'Finish assignment 12',
      description: 'Firebase auth and Firestore',
      isCompleted: false,
      createdAt: createdAt,
    );

    final map = todo.toMap();

    expect(map['title'], 'Finish assignment 12');
    expect(map['description'], 'Firebase auth and Firestore');
    expect(map['isCompleted'], false);
    expect((map['createdAt'] as Timestamp).toDate(), createdAt);
    expect(map.containsKey('id'), isFalse);
  });
}
