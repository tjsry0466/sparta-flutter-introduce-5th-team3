import 'package:flutter/material.dart';

class SkillBar extends StatelessWidget {
  final String skill;
  final double progress;

  const SkillBar({
    Key? key,
    required this.skill,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.0),
      child: Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              child: Text(
                skill,
                style: TextStyle(fontSize: 14),
                maxLines: 1, // 한 줄로 제한
                overflow: TextOverflow.ellipsis, // 길어질 경우 ...으로 표시
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      // 배경 바
                      Container(
                        height: 12,
                        decoration: BoxDecoration(
                          color: Color(0xFFCCF1FF),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      // 진행도 바
                      Container(
                        height: 12,
                        width: constraints.maxWidth *
                            progress, // Expanded 내부의 실제 가용 너비에 progress 비율을 곱합니다
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFF6DD8FF),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
