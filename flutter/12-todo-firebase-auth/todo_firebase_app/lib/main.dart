import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/auth_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const TodoFirebaseApp());
}

class TodoFirebaseApp extends StatelessWidget {
  const TodoFirebaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase TODO App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F6FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F6FC),
          centerTitle: true,
        ),
      ),
      home: const AuthWrapper(),
    );
  }
}
