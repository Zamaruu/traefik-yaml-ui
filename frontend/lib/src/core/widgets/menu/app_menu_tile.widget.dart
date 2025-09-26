import 'package:flutter/material.dart';

class AppMenuTile extends StatelessWidget {
  final IconData leadingIcon;

  final String title;

  final String? subtitle;

  final VoidCallback? onPressed;

  final Color? iconColor;

  const AppMenuTile({
    super.key,
    this.onPressed,
    this.subtitle,
    this.iconColor = const Color(0xff24a1c1),
    required this.leadingIcon,
    required this.title,
  });

  // -------------------------------------------------------------------------
  // Getter

  bool get isEnabled => onPressed != null;

  // -------------------------------------------------------------------------
  // Build

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: isEnabled ? iconColor : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(color: isEnabled ? null : Colors.grey.shade600),
      ),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onPressed,
    );
  }
}
