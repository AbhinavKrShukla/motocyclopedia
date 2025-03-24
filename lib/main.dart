import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motocyclopedia_2/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    WidgetsFlutterBinding.ensureInitialized();

    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.edgeToEdge,
    //   overlays: [SystemUiOverlay.top]
    // );
    return MaterialApp(
      title: 'MotoCyclopedia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
