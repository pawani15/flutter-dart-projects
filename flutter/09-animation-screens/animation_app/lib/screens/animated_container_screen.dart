import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState
    extends State<AnimatedContainerScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              width: isExpanded ? 260 : 120,
              height: isExpanded ? 260 : 120,
              decoration: BoxDecoration(
                color: isExpanded ? Colors.orange : Colors.deepPurple,
                borderRadius: BorderRadius.circular(
                  isExpanded ? 30 : 100,
                ),
              ),
              child: const Icon(
                Icons.star,
                color: Colors.white,
                size: 55,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: const Text('Animate Container'),
            ),
          ],
        ),
      ),
    );
  }
}
