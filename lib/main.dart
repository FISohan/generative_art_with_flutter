import 'package:flutter/material.dart';
import 'package:generative_art_with_flutter/hypnotic_squares.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomeScreen(),
        '/hypnoticSquare': (context) => const HypnoticSquare(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/hypnoticSquare");
                },
                child: Text("Hypnotic Square"))
          ],
        ),
      ),
    );
  }
}
