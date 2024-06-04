import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

import 'src/api/item.dart';
import 'src/catalog.dart';
import 'src/item_title.dart';
void main() {
  setupWindow();
  runApp(const MyApp());
}
const double windowWidth = 480;
const double windowHeight = 854;

void setupWindow() {
  if(!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle("Infinite List");
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((value) => {
      setWindowFrame(Rect.fromCenter(
        center: value!.frame.center, 
        width: windowWidth, 
        height: windowHeight
        )
      )
    },);
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Catalog>(
      create: (context) => Catalog(),
      child: MaterialApp(
        title: 'Infinite List Sample',
        theme: ThemeData.light(),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Infinite List Sample'),
      ),
      body: Selector<Catalog, int?>(
        selector: (context, catalog) => catalog.itemCount,
        builder: (context, itemCount, child) => ListView.builder(
          itemCount:  itemCount,
          padding: const EdgeInsets.all(18),
          itemBuilder: (context, index) {
            var catalog = Provider.of<Catalog>(context);
            return switch (catalog.getByIndex(index)) {
              Item(isLoading: true) => const LoadingItemTitle(),
              var item => ItemTitle(item: item)
            };
          },
        ),
      ),
    );
  }
} 