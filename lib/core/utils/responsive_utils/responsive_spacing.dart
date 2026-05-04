import 'package:flutter/material.dart';

class ResponsiveSpacing extends StatelessWidget {
  const ResponsiveSpacing({super.key, this.widthPercent, this.heightPercent})
    : assert(widthPercent != null || heightPercent != null);

  final double? widthPercent;
  final double? heightPercent;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: widthPercent != null
              ? constraints.maxWidth * (widthPercent! / 100)
              : null,
          height: heightPercent != null
              ? constraints.maxHeight * (heightPercent! / 100)
              : null,
        );
      },
    );
  }
}
