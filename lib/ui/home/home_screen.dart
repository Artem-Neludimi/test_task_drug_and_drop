import 'package:flutter/material.dart';

import '../puzzle/puzzle_screen.dart';
import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(testTask),
      ),
      body: Center(
        child: OutlinedButton(
          child: const Text(solvePuzzle),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const PuzzleScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
