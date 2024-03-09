import 'dart:math';

import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final Color color;
  final double height;
  final double waveAmplitude;
  final double waveFrequency;

  WavePainter({
    required this.color,
    required this.height,
    required this.waveAmplitude,
    required this.waveFrequency,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    for (double x = 0; x < size.width; x += 10) {
      final y = height /99 -
          waveAmplitude *
              sin(x / 9 * waveFrequency * pi / 180);
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.lineTo(size.width, height);
    path.lineTo(0, height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}