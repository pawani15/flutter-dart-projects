import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/todo_model.dart';

class TodoService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _todos {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception('Please login first.');
    }

    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('todos');
  }

  Stream<List<TodoModel>> getTodos() {
    return _todos
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(TodoModel.fromFirestore)
              .toList(),
        );
  }

  Future<void> addTodo({
    required String title,
    required String description,
  }) async {
    final todo = TodoModel(
      id: '',
      title: title,
      description: description,
      isCompleted: false,
      createdAt: DateTime.now(),
    );

    await _todos.add(todo.toMap());
  }

  Future<void> updateTodo({
    required String id,
    required String title,
    required String description,
  }) async {
    await _todos.doc(id).update({
      'title': title,
      'description': description,
    });
  }

  Future<void> toggleTodo({
    required String id,
    required bool isCompleted,
  }) async {
    await _todos.doc(id).update({
      'isCompleted': isCompleted,
    });
  }

  Future<void> deleteTodo(String id) async {
    await _todos.doc(id).delete();
  }
}
