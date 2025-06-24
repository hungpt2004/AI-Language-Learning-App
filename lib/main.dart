import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'inject_container_di.dart' as di;
import 'core/routes/app_routes.dart';
import 'core/routes/app_navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  const isProd = bool.fromEnvironment('dart.vm.product');
  final envFile = isProd ? ".env.prod" : ".env.dev";
  await dotenv.load(fileName: envFile);
  
  // Khởi tạo dependency injection
  await di.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Language Learning App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      navigatorKey: AppNavigator.navigatorKey,
      initialRoute: AppRoutes.auth,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
