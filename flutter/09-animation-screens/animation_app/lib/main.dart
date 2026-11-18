import 'package:flutter/material.dart';

import 'screens/animated_container_screen.dart';
import 'screens/animated_opacity_screen.dart';
import 'screens/animation_controller_screen.dart';

void main() {
  runApp(const AnimationApp());
}

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animations',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const AnimationHomeScreen(),
    );
  }
}

class AnimationHomeScreen extends StatelessWidget {
  const AnimationHomeScreen({super.key});

  void openScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      {
        'title': 'Animated Container',
        'subtitle': 'Change size, color and shape',
        'icon': Icons.crop_square,
        'screen': const AnimatedContainerScreen(),
      },
      {
        'title': 'Animated Opacity',
        'subtitle': 'Fade in and fade out',
        'icon': Icons.visibility,
        'screen': const AnimatedOpacityScreen(),
      },
      {
        'title': 'Animation Controller',
        'subtitle': 'Rotate an icon continuously',
        'icon': Icons.settings,
        'screen': const AnimationControllerScreen(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Gallery'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: screens.length,
        itemBuilder: (context, index) {
          final item = screens[index];

          return Card(
            child: ListTile(
              leading: Icon(
                item['icon'] as IconData,
                color: Colors.deepPurple,
                size: 30,
              ),
              title: Text(item['title'] as String),
              subtitle: Text(item['subtitle'] as String),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => openScreen(
                context,
                item['screen'] as Widget,
              ),
            ),
          );
        },
      ),
    );
  }
}
