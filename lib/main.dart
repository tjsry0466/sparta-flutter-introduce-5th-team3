import 'package:flutter/material.dart';
import 'package:introduce_sprta_flutter_3_team/pages/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFCFCFC),
        fontFamily: 'Pretendard-Medium', // Pretendard-Medium 폰트 지정
      ),
    );
  }
}
