import 'package:flutter/material.dart';
import 'package:converter/view/converter_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fast converter',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const ConverterView(title: 'Conversor de bases numéricas'),
      debugShowCheckedModeBanner: false,
    );
  }
}
