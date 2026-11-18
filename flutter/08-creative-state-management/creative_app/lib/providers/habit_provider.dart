import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitProvider extends ChangeNotifier {
  final List<Habit> _habits = [
    Habit(title: 'Read for 20 minutes'),
    Habit(title: 'Drink enough water'),
    Habit(title: 'Practice Flutter'),
  ];

  List<Habit> get habits => List.unmodifiable(_habits);

  int get completedCount =>
      _habits.where((habit) => habit.isCompleted).length;

  double get progress =>
      _habits.isEmpty ? 0 : completedCount / _habits.length;

  void addHabit(String title) {
    if (title.trim().isEmpty) return;

    _habits.add(Habit(title: title.trim()));
    notifyListeners();
  }

  void toggleHabit(int index) {
    _habits[index].isCompleted = !_habits[index].isCompleted;
    notifyListeners();
  }

  void deleteHabit(int index) {
    _habits.removeAt(index);
    notifyListeners();
  }
}
