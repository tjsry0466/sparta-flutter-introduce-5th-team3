import 'package:flutter/material.dart';
import 'package:introduce_sprta_flutter_3_team/components/common/AppStyle.dart';
import 'package:introduce_sprta_flutter_3_team/components/user_detail/BadgeList.dart';

class ProfileSection extends StatelessWidget {
  final String description;
  final String role;
  final List<String> badges;
  final String profileImage; // 이미지 URL 추가

  const ProfileSection({
    Key? key,
    required this.role,
    required this.description,
    required this.badges,
    required this.profileImage, // 이미지 URL 추가
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.sectionPadding,
      child: Column(
        children: [
          Stack(children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/${profileImage}'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  role,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppStyles.defaultSpacing),
          BadgeList(badges: badges),
        ],
      ),
    );
  }
}
