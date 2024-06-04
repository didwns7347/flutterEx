import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import '리스트예제/ListExs.dart';
import '제스쳐/gesture.dart';
// import '스크롤뷰/scrollEx.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: const Color.fromARGB(255, 1, 40, 72)),
      debugShowCheckedModeBanner: false,
      home: HandleTapEx(title: 'Handle Tap Ex',),
    );
  }
}
