import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'title': 'My Tasks',
      'subtitle': 'Manage your daily activities',
      'icon': Icons.task_alt,
      'color': Colors.blue,
    },
    {
      'title': 'Analytics',
      'subtitle': 'View your performance',
      'icon': Icons.analytics,
      'color': Colors.orange,
    },
    {
      'title': 'Messages',
      'subtitle': 'Check your conversations',
      'icon': Icons.message,
      'color': Colors.green,
    },
    {
      'title': 'Settings',
      'subtitle': 'Manage your preferences',
      'icon': Icons.settings,
      'color': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final columns = width < 600
            ? 1
            : width < 1000
                ? 2
                : 3;

        final horizontalPadding = width < 600 ? 16.0 : 28.0;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Responsive Dashboard'),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          body: Padding(
            padding: EdgeInsets.all(horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  width < 600 ? 'Welcome!' : 'Welcome to Your Dashboard',
                  style: TextStyle(
                    fontSize: width < 600 ? 24 : 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Your activities at a glance.'),
                const SizedBox(height: 24),
                Expanded(
                  child: GridView.builder(
                    itemCount: items.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.3,
                      // Fixed card height on mobile so the content never
                      // overflows on narrow phones.
                      mainAxisExtent: width < 600 ? 190 : null,
                    ),
                    itemBuilder: (context, index) {
                      final item = items[index];

                      return DashboardCard(
                        title: item['title'] as String,
                        subtitle: item['subtitle'] as String,
                        icon: item['icon'] as IconData,
                        color: item['color'] as Color,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
