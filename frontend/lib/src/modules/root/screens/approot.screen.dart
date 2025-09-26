import 'package:flutter/material.dart';
import 'package:frontend/src/core/widgets/app_scaffold.widget.dart';
import 'package:frontend/src/core/widgets/app_screen.widget.dart';
import 'package:frontend/src/modules/error/widgets/error.widget.dart';

class AppRoot extends StatelessScreenWidget {
  const AppRoot({super.key, required super.argument});

  Future<String> _mockedLoader() async {
    await Future.delayed(const Duration(seconds: 2));
    return "Test";
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Traefik Config UI",
      body: FutureBuilder(
        future: _mockedLoader(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return AppErrorInfoBox(error: snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text(snapshot.data!));
          }
        },
      ),
    );
  }
}
