import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  static const String routeName = '/main_app';
  @override
  State<MainApp> createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Main App'),
      ),
    );
  }
}
