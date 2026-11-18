import 'package:flutter/material.dart';

class AnimationControllerScreen extends StatefulWidget {
  const AnimationControllerScreen({super.key});

  @override
  State<AnimationControllerScreen> createState() =>
      _AnimationControllerScreenState();
}

class _AnimationControllerScreenState
    extends State<AnimationControllerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Controller')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: animation.value,
                  child: child,
                );
              },
              child: const Icon(
                Icons.settings,
                size: 130,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton.icon(
              onPressed: () {
                if (controller.isAnimating) {
                  controller.stop();
                } else {
                  controller.repeat();
                }
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('Start / Stop Animation'),
            ),
            TextButton(
              onPressed: () => controller.reset(),
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
