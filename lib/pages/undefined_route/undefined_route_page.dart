import 'package:flutter/material.dart';

class UndefinedRoutePage extends StatelessWidget {
  final String name;

  const UndefinedRoutePage(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Text('Rute untuk $name tidak ditemukan'),
        ),
      ),
    );
  }
}
