import 'dart:math' as math;

import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({
    super.key,
    this.widthPercent,
    this.heightPercent,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.paddingPercent,
    this.marginPercent,
    this.alignment,
    this.color,
    this.decoration,
    this.child,
  });

  final double? widthPercent;
  final double? heightPercent;
  final double? minWidth, maxWidth;
  final double? minHeight, maxHeight;
  final double? paddingPercent;
  final double? marginPercent;
  final Alignment? alignment;
  final Color? color;
  final Decoration? decoration;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double? width = widthPercent != null
            ? constraints.maxWidth * (widthPercent! / 100)
            : null;
        double? height = heightPercent != null
            ? constraints.maxHeight * (heightPercent! / 100)
            : null;

        double padding = paddingPercent != null
            ? math
                  .min(
                    constraints.maxWidth * (paddingPercent! / 100),
                    constraints.maxHeight * (paddingPercent! / 100),
                  )
                  .clamp(8.0, 48.0)
            : 0.0;

        return Container(
          width: width,
          height: height,
          alignment: alignment,
          color: color,
          decoration: decoration,
          padding: EdgeInsets.all(padding),
          margin: marginPercent != null
              ? EdgeInsets.all(constraints.maxWidth * (marginPercent! / 100))
              : null,
          constraints: BoxConstraints(
            minWidth: minWidth ?? 0,
            maxWidth: maxWidth ?? double.infinity,
            minHeight: minHeight ?? 0,
            maxHeight: maxHeight ?? double.infinity,
          ),
          child: child,
        );
      },
    );
  }
}
