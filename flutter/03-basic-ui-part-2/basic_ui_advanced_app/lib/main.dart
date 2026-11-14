
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic UI Part 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),
      home: const AdvancedUIScreen(),
    );
  }
}

class AdvancedUIScreen extends StatefulWidget {
  const AdvancedUIScreen({super.key});

  @override
  State<AdvancedUIScreen> createState() =>
      _AdvancedUIScreenState();
}

class _AdvancedUIScreenState
    extends State<AdvancedUIScreen> {
  bool showGrid = false;
  int clickCount = 0;

  final List<Map<String, dynamic>> items = [
    {'title': 'Flutter', 'icon': Icons.flutter_dash, 'color': Colors.blue},
    {'title': 'Dart', 'icon': Icons.code, 'color': Colors.indigo},
    {'title': 'Android', 'icon': Icons.android, 'color': Colors.green},
    {'title': 'Design', 'icon': Icons.palette, 'color': Colors.orange},
    {'title': 'Widgets', 'icon': Icons.widgets, 'color': Colors.purple},
    {'title': 'Development', 'icon': Icons.developer_mode, 'color': Colors.teal},
    {'title': 'Firebase', 'icon': Icons.cloud, 'color': Colors.red},
    {'title': 'Projects', 'icon': Icons.folder, 'color': Colors.brown},
  ];

  void onItemTap(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You selected $title'),
      ),
    );
  }

  void onButtonClick() {
    setState(() {
      clickCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore Flutter',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Explore Flutter widgets and concepts.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 15),

            Card(
              elevation: 4,
              color: Colors.teal.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.school,
                      size: 45,
                      color: Colors.teal,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Flutter Learning',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Practice widgets every day.',
                          ),
                          Text('Button clicks: $clickCount'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            Center(
              child: ElevatedButton.icon(
                onPressed: onButtonClick,
                icon: const Icon(Icons.touch_app),
                label: const Text('Click Me'),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Explore Topics',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SegmentedButton<bool>(
                  segments: const [
                    ButtonSegment(
                      value: false,
                      icon: Icon(Icons.list),
                    ),
                    ButtonSegment(
                      value: true,
                      icon: Icon(Icons.grid_view),
                    ),
                  ],
                  selected: {showGrid},
                  onSelectionChanged: (selection) {
                    setState(() {
                      showGrid = selection.first;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 12),

            Expanded(
              child: showGrid
                  ? GridView.builder(
                      itemCount: items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (context, index) {
                        return buildGridItem(items[index]);
                      },
                    )
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return buildListItem(items[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              (item['color'] as Color).withValues(alpha: 0.15),
          child: Icon(
            item['icon'] as IconData,
            color: item['color'] as Color,
          ),
        ),
        title: Text(
          item['title'] as String,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('Tap to explore this topic'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => onItemTap(item['title'] as String),
      ),
    );
  }

  Widget buildGridItem(Map<String, dynamic> item) {
    return Card(
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => onItemTap(item['title'] as String),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item['icon'] as IconData,
              size: 42,
              color: item['color'] as Color,
            ),
            const SizedBox(height: 12),
            Text(
              item['title'] as String,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
