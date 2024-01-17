import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metaleader/view/home.dart';

class MyTabPage extends StatelessWidget {
  const MyTabPage({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
