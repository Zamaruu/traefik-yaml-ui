import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/constans.dart';

class TraefikLogo extends StatelessWidget {
  final String svgPath;

  final Color svgColor;

  final EdgeInsetsGeometry padding;

  const TraefikLogo({
    super.key,
    this.svgPath = kTraefikLogoPath,
    this.svgColor = Colors.white,
    this.padding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SvgPicture.asset(
        svgPath,
        semanticsLabel: 'Treafik Proxy Logo',
        colorFilter: ColorFilter.mode(
          svgColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
