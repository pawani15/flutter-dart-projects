
import 'package:flutter/material.dart';

void main() {
  runApp(const HelpApp());
}

class HelpApp extends StatelessWidget {
  const HelpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Help Center',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HelpHomeScreen(),
    );
  }
}

class HelpTopic {
  final String title;
  final String description;
  final IconData icon;
  final List<String> instructions;

  const HelpTopic({
    required this.title,
    required this.description,
    required this.icon,
    required this.instructions,
  });
}

const topics = [
  HelpTopic(
    title: 'Getting Started',
    description: 'Learn how to get started with the application.',
    icon: Icons.rocket_launch,
    instructions: [
      'Open the application.',
      'Explore the home screen.',
      'Select the feature you want to use.',
      'Follow the instructions displayed on screen.',
    ],
  ),
  HelpTopic(
    title: 'Account Settings',
    description: 'Manage your account information.',
    icon: Icons.manage_accounts,
    instructions: [
      'Open your profile.',
      'Select Account Settings.',
      'Update your personal information.',
      'Save your changes.',
    ],
  ),
  HelpTopic(
    title: 'Notifications',
    description: 'Manage application notifications.',
    icon: Icons.notifications,
    instructions: [
      'Open Settings.',
      'Select Notifications.',
      'Enable or disable notifications.',
      'Save your preferences.',
    ],
  ),
  HelpTopic(
    title: 'Privacy and Security',
    description: 'Keep your account secure.',
    icon: Icons.security,
    instructions: [
      'Use a strong password.',
      'Never share your password.',
      'Sign out when using a shared device.',
      'Keep your application updated.',
    ],
  ),
];

class HelpHomeScreen extends StatelessWidget {
  const HelpHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help Center',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Icon(
            Icons.support_agent,
            size: 75,
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 12),
          const Text(
            'How can we help you?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Browse topics to find helpful instructions.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          const Text(
            'Help Topics',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ...topics.map(
            (topic) => Card(
              child: ExpansionTile(
                leading: Icon(topic.icon, color: Colors.deepPurple),
                title: Text(
                  topic.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(topic.description),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...topic.instructions.map(
                          (instruction) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text('• $instruction'),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      HelpDetailsScreen(topic: topic),
                                ),
                              );
                            },
                            child: const Text('View Details'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HelpDetailsScreen extends StatelessWidget {
  final HelpTopic topic;

  const HelpDetailsScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Icon(topic.icon, size: 70, color: Colors.deepPurple),
          const SizedBox(height: 20),
          Text(
            topic.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(topic.description),
          const SizedBox(height: 20),
          const Text(
            'Step-by-step Instructions',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...topic.instructions.asMap().entries.map(
            (entry) => ListTile(
              leading: CircleAvatar(
                child: Text('${entry.key + 1}'),
              ),
              title: Text(entry.value),
            ),
          ),
        ],
      ),
    );
  }
}
