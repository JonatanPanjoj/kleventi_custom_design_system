import 'package:custom_design_system/custom_design_system.dart';
import 'package:flutter/material.dart';

class DsDottedLinePainter extends CustomPainter {

  final Color? color;

  DsDottedLinePainter({
    this.color = DSColors.primary
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color!
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double max = size.width;
    int dashWidth = 5;
    int dashSpace = 5;
    double startY = 0;

    while (max >= 0) {
      canvas.drawLine(Offset(startY, 0), Offset(startY + dashWidth, 0), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}