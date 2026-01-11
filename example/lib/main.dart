import 'package:flutter/material.dart';
import 'package:internet_checker_plus/internet_checker_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Internet Checker Plus')),
        body: Center(
          child: StreamBuilder(
            stream: InternetCheckerPlus.onStatusChange(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              return Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 20),
              );
            },
          ),
        ),
      ),
    );
  }
}
