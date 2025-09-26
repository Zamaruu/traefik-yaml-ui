import 'package:flutter/material.dart';

class AppMenuTile extends StatelessWidget {
  final IconData leadingIcon;

  final String title;

  final String? subtitle;

  final VoidCallback? onPressed;

  const AppMenuTile({
    super.key,
    this.onPressed,
    this.subtitle,
    required this.leadingIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onPressed,
    );
  }
}
