import 'package:flutter/material.dart';

class DialogBase extends StatelessWidget {
  final String title;

  final Widget body;

  final Color appBarColor;

  const DialogBase({
    super.key,
    required this.title,
    required this.body,
    this.appBarColor = const Color(0xff24a1c1),
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.2,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              centerTitle: false,
              title: SelectableText(
                title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: appBarColor,
              leading: const SizedBox.shrink(),
              leadingWidth: 0,
              actions: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body,
          ],
        ),
      ),
    );
  }
}
