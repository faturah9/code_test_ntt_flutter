import 'package:flutter/material.dart';

class BuildErrorWidget extends StatelessWidget {
  final String? error;
  const BuildErrorWidget({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error occured: $error"),
        ],
      ),
    );
  }
}
