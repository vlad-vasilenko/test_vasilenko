import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String url;

  const HomePage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo preview')),
      body: Image.network(url),
    );
  }
}