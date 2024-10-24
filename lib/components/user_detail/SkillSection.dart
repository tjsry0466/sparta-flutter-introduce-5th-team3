import 'package:flutter/material.dart';
import 'package:introduce_sprta_flutter_3_team/components/common/AppStyle.dart';
import 'package:introduce_sprta_flutter_3_team/components/user_detail/SkillBar.dart';

class SkillSection extends StatelessWidget {
  final Map<String, double> skills;

  const SkillSection({
    Key? key,
    required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.sectionPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('나의 SKILL', style: AppStyles.sectionTitle),
          const SizedBox(height: 5), // 섹션 제목과 진행 바 사이 간격 추가
          Column(
            children: skills.entries
                .map((entry) =>
                    SkillBar(skill: entry.key, progress: entry.value))
                .toList(),
          ),
        ],
      ),
    );
  }
}
