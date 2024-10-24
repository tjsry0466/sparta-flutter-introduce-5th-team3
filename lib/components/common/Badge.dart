import 'package:flutter/material.dart';

class SkillBadge extends StatelessWidget {
  final String label;

  const SkillBadge({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getBadgeColor(label),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12, color: Colors.black),
      ),
    );
  }

  // 배지에 따라 배경색을 다르게 설정하는 함수
  Color _getBadgeColor(String badge) {
    switch (badge) {
      case '개발':
      case '서버 개발':
      case '사이드 프로젝트':
      case '인프라':
        return Color(0xFFFFBBBB);
      case '운동':
      case '러닝':
        return Color(0xFFCBD5FF);
      case '헬스 케어':
        return Color(0xFFD9FFE3);
      case '시니어':
        return Color(0xFFFFCC80);
      case '그림':
      case '예술':
      case 'UX 디자인':
      case 'UI 디자인':
      case '서비스 디자인':
        return Color(0xFFFFD0F5);
      case '게임':
        return Color(0xFFB3E5FC);
      case '창업':
        return Color(0xFFFEC094);
      case '잠자기':
        return Color(0xFFE0E0E0); // 연한 회색 계열
      default:
        return Colors.grey; // 기본 색상 설정
    }
  }
}
