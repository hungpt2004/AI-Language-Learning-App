import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  const isProd = bool.fromEnvironment('dart.vm.product');
  final envFile = isProd ? ".env.prod" : ".env.dev";
  await dotenv.load(fileName: envFile);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}