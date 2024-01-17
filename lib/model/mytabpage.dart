import 'package:flutter/material.dart';

class myTabPage extends StatelessWidget {
  const myTabPage({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('탭 $tabIndex 페이지'),
      ),
      body: Center(
        child: Text('이것은 탭 $tabIndex 페이지입니다.'),
      ),
    );
  }
}
