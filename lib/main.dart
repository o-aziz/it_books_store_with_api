import 'package:flutter/material.dart';
import 'package:library_app/views/new_releases.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library app ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewReleases(),
    );
  }
}
