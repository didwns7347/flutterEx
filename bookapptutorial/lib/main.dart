import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "App Title",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("AppBar Title"),
        ),
        body: Center(
          child: Image.network('https://docs.flutter.dev/assets/images/dash/Dash.png',width: 100, height: 100,),
        ),
      ),
    );
  }
}
