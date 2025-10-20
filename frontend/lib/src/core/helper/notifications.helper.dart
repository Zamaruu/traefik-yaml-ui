import 'package:flutter/cupertino.dart';
import 'package:traefik_frontend_ui/src/data/enums/notification.enum.dart';
import 'package:toastification/toastification.dart';

class NotificationHelper {
  static void showNotification({
    required BuildContext context,
    required String title,
    String? description,
    ENotification type = ENotification.info,
    Alignment alignment = Alignment.topRight,
    Duration autoCloseTimer = const Duration(milliseconds: 3500),
  }) {
    final useTimer = type != ENotification.warning && type != ENotification.error;

    toastification.show(
      context: context,
      style: ToastificationStyle.minimal,
      title: Text(title),
      description: description != null ? Text(description) : null,
      icon: Icon(type.icon),
      primaryColor: type.color,
      autoCloseDuration: useTimer ? autoCloseTimer : null,
      showProgressBar: useTimer,
    );
  }
}
