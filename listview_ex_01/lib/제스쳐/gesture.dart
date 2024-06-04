import 'package:flutter/material.dart';
class HandleTapEx extends StatelessWidget {
  final String title;

  const HandleTapEx({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(child: MyButton(),),
    );
  } 
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        debugPrint("hello world");
      const snackBar = SnackBar(content: Text('Tap'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text("My Button"),
    ),
    );
  }
}

