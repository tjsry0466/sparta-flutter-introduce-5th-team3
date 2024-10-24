import 'package:flutter/material.dart';
import 'package:introduce_sprta_flutter_3_team/components/common/Badge.dart';

class BadgeList extends StatelessWidget {
  final List<String> badges;

  const BadgeList({Key? key, required this.badges}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: badges.map((badge) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: SkillBadge(label: badge),
        );
      }).toList(),
    );
  }
}
