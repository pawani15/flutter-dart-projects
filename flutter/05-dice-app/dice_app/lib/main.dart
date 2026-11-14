
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int diceNumber = 1;

  final Random random = Random();

  // Generate a new dice value different from the current value.
  void rollDice() {
    setState(() {
      int newNumber = random.nextInt(5) + 1;

      if (newNumber >= diceNumber) {
        newNumber++;
      }

      diceNumber = newNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text(
          'Dice App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Roll the Dice!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Tap the button to generate a new number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 40),

              // Dice display
              DiceFace(number: diceNumber),

              const SizedBox(height: 30),

              Text(
                'Dice Value: $diceNumber',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 35),

              // Roll button
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: rollDice,
                  icon: const Icon(Icons.casino),
                  label: const Text(
                    'Roll Dice',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom dice face widget
class DiceFace extends StatelessWidget {
  final int number;

  const DiceFace({
    super.key,
    required this.number,
  });

  static const List<List<bool>> patterns = [
    // Dice 1
    [
      false, false, false,
      false, true, false,
      false, false, false,
    ],

    // Dice 2
    [
      true, false, false,
      false, false, false,
      false, false, true,
    ],

    // Dice 3
    [
      true, false, false,
      false, true, false,
      false, false, true,
    ],

    // Dice 4
    [
      true, false, true,
      false, false, false,
      true, false, true,
    ],

    // Dice 5
    [
      true, false, true,
      false, true, false,
      true, false, true,
    ],

    // Dice 6
    [
      true, false, true,
      true, false, true,
      true, false, true,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final dots = patterns[number - 1];

    return Container(
      width: 220,
      height: 220,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.deepPurple,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withValues(alpha: 0.15),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (column) {
              int index = row * 3 + column;

              return Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: dots[index]
                      ? Colors.deepPurple
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
