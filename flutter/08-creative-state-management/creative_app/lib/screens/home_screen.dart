import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/habit_provider.dart';
import '../widgets/habit_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void showAddDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add New Habit'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Enter habit name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                context.read<HabitProvider>().addHabit(controller.text);
                Navigator.pop(dialogContext);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HabitProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Habit Tracker'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showAddDialog(context),
        icon: const Icon(Icons.add),
        label: const Text('Add Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daily Progress',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: provider.progress,
              minHeight: 12,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: 8),
            Text(
              '${provider.completedCount} of ${provider.habits.length} habits completed',
            ),
            const SizedBox(height: 24),
            const Text(
              'My Habits',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: provider.habits.isEmpty
                  ? const Center(child: Text('No habits added yet.'))
                  : ListView.builder(
                      itemCount: provider.habits.length,
                      itemBuilder: (context, index) {
                        final habit = provider.habits[index];

                        return HabitCard(
                          habit: habit,
                          onToggle: () => context
                              .read<HabitProvider>()
                              .toggleHabit(index),
                          onDelete: () => context
                              .read<HabitProvider>()
                              .deleteHabit(index),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
