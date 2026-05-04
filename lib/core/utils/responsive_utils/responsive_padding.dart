import 'dart:math' as math;

import 'package:flutter/material.dart';

class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({
    super.key,
    this.horizontalPercent,
    this.verticalPercent,
    this.allPercent,
    required this.child,
  });

  final double? horizontalPercent;
  final double? verticalPercent;
  final double? allPercent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double h = 0, v = 0;

        if (allPercent != null) {
          h = v = math.min(
            constraints.maxWidth * (allPercent! / 100),
            constraints.maxHeight * (allPercent! / 100),
          );
        } else {
          if (horizontalPercent != null) {
            h = constraints.maxWidth * (horizontalPercent! / 100);
          }
          if (verticalPercent != null) {
            v = constraints.maxHeight * (verticalPercent! / 100);
          }
        }

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: h.clamp(8.0, 64.0),
            vertical: v.clamp(8.0, 64.0),
          ),
          child: child,
        );
      },
    );
  }
}
