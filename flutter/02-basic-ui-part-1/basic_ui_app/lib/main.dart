
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
      title: 'Basic UI Part 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const BasicUIScreen(),
    );
  }
}

class BasicUIScreen extends StatelessWidget {
  const BasicUIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Basic UI',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        leading: const Icon(
          Icons.flutter_dash,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to Flutter!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Learning Flutter UI widgets step by step.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.phone_android,
                    size: 65,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Build Beautiful Apps',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Flutter makes cross-platform development easy.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            const Text(
              'Explore Widgets',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: featureCard(
                    Icons.widgets, 'Widgets', Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: featureCard(
                    Icons.palette, 'Design', Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: featureCard(
                    Icons.devices, 'Devices', Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: featureCard(
                    Icons.code, 'Coding', Colors.pink,
                  ),
                ),
              ],
            ),
const SizedBox(height: 30),

const Text(
  'More Flutter Topics',
  style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

const Card(
  child: ListTile(
    leading: Icon(Icons.phone_android),
    title: Text('Mobile App Development'),
    subtitle: Text('Build Android and iOS applications'),
  ),
),

const Card(
  child: ListTile(
    leading: Icon(Icons.design_services),
    title: Text('UI Design'),
    subtitle: Text('Learn layouts and styling'),
  ),
),

const Card(
  child: ListTile(
    leading: Icon(Icons.code),
    title: Text('Dart Programming'),
    subtitle: Text('Practice Dart concepts'),
  ),
),


            const SizedBox(height: 25),
            const Text(
              'What I am learning',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  title: Text('Scaffold and AppBar'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  title: Text('Container and Text'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  title: Text('Row and Column'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget featureCard(
    IconData icon,
    String title,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(icon, size: 35, color: color),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
