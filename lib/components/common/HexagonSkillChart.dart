import 'dart:math';

import 'package:flutter/material.dart';

class HexagonSkillChart extends StatelessWidget {
  final List<double> skillValues; // 0.0 to 1.0 사이의 값
  final List<String> skillLabels;

  HexagonSkillChart({required this.skillValues, required this.skillLabels})
      : assert(skillValues.length == 6 && skillLabels.length == 6);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(280, 280), // 차트 크기
      painter: _HexagonSkillChartPainter(skillValues, skillLabels),
    );
  }
}

class _HexagonSkillChartPainter extends CustomPainter {
  final List<double> skillValues;
  final List<String> skillLabels;
  final Paint hexagonPaint;
  final Paint skillPaint;
  final Paint skillBorderPaint;
  final Paint linePaint;
  final double maxRadius = 100.0;
  final int levels = 4; // 내부 그리드 레벨 수

  _HexagonSkillChartPainter(this.skillValues, this.skillLabels)
      : hexagonPaint = Paint()
          ..color = Colors.grey.withOpacity(0.2)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0,
        skillPaint = Paint()
          ..color = Color(0xFFCCF1FF)
          ..style = PaintingStyle.fill,
        skillBorderPaint = Paint()
          ..color = Color(0xFF6FF1FF)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5,
        linePaint = Paint()
          ..color = Colors.grey.withOpacity(0.2)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // 내부 레벨별 6각형 그리기
    for (int i = 1; i <= levels; i++) {
      _drawHexagon(canvas, center, maxRadius * (i / levels), hexagonPaint);
    }

    // 중심에서 꼭짓점까지의 선 그리기
    _drawLinesToVertices(canvas, center, maxRadius);

    // 스킬 값으로 6각형 채우기
    _drawSkillPolygon(canvas, center, skillValues);

    // 각 점에 라벨 그리기
    _drawLabels(canvas, center);
  }

  void _drawHexagon(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (pi / 3) * i - pi / 2; // 위아래가 뾰족하도록 -pi/2 추가
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  void _drawSkillPolygon(Canvas canvas, Offset center, List<double> values) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (pi / 3) * i - pi / 2;
      // 값이 0.0 ~ 1.0 사이에 있도록 보정
      final clampedValue = values[i].clamp(0.0, 1.0);
      final valueRadius = maxRadius * clampedValue;
      final x = center.dx + valueRadius * cos(angle);
      final y = center.dy + valueRadius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    // 스킬 영역 채우기
    canvas.drawPath(path, skillPaint);
    // 스킬 영역 테두리 그리기
    canvas.drawPath(path, skillBorderPaint);
  }

  void _drawLinesToVertices(Canvas canvas, Offset center, double radius) {
    for (int i = 0; i < 6; i++) {
      final angle = (pi / 3) * i - pi / 2;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      canvas.drawLine(center, Offset(x, y), linePaint);
    }
  }

  void _drawLabels(Canvas canvas, Offset center) {
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    for (int i = 0; i < 6; i++) {
      final angle = (pi / 3) * i - pi / 2;
      final x = center.dx + (maxRadius + 20) * cos(angle);
      final y = center.dy + (maxRadius + 20) * sin(angle);
      final textSpan = TextSpan(
        text: skillLabels[i],
        style: TextStyle(color: Colors.black87, fontSize: 14),
      );
      textPainter.text = textSpan;
      textPainter.layout();
      final offset =
          Offset(x - textPainter.width / 2, y - textPainter.height / 2);
      textPainter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
