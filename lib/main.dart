import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Luncher',
      theme: ThemeData(
        colorScheme:  ColorScheme.fromSeed(seedColor: brandColor),
        useMaterial3: true,
      ),

    );
  }
}
