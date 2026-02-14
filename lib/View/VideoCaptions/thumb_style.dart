import 'package:flutter/material.dart';

class TransparentThumb extends SliderComponentShape {
  final double thumbRadius;

  TransparentThumb({this.thumbRadius = 10});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    // Outer white border
    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Inner transparent circle
    final Paint fillPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    // Draw transparent center
    canvas.drawCircle(center, thumbRadius - 3, fillPaint);

    // Draw white border
    canvas.drawCircle(center, thumbRadius - 1.5, borderPaint);
  }
}
