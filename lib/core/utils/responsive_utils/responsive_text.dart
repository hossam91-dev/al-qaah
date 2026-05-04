import 'dart:math' as math;

import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  const ResponsiveText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.maxScaleFactor = 1.3,
  });

  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double maxScaleFactor;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context);
    final baseStyle = style ?? Theme.of(context).textTheme.bodyMedium;

    final effectiveStyle = baseStyle?.copyWith(
      fontSize: baseStyle.fontSize != null
          ? math.min(
              scale.scale(baseStyle.fontSize!),
              baseStyle.fontSize! * maxScaleFactor,
            )
          : null,
    );

    return Text(
      data,
      style: effectiveStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
