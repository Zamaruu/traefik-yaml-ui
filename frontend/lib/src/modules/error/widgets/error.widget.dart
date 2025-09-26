import 'package:flutter/material.dart';

class AppErrorInfoBox extends StatelessWidget {
  final String error;

  const AppErrorInfoBox({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.deepOrange,
            size: 32,
          ),
          Text(error),
        ],
      ),
    );
  }
}
