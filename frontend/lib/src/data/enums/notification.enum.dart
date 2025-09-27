import 'package:flutter/material.dart';

enum ENotification {
  info(Icons.info, Colors.blue),
  error(Icons.error, Colors.red),
  warning(Icons.warning, Colors.orange),
  success(Icons.check_circle, Colors.green),
  debug(Icons.bug_report, Colors.teal),
  trace(Icons.code, Colors.grey),
  message(Icons.message, Colors.purple);

  final Color color;

  final IconData icon;

  const ENotification(this.icon, this.color);
}
