// constants.dart
import 'package:flutter/material.dart';
import 'package:introduce_sprta_flutter_3_team/components/common/AppStyle.dart';
import 'package:introduce_sprta_flutter_3_team/components/common/HorizontalDivider.dart';
import 'package:introduce_sprta_flutter_3_team/components/user_detail/CapabilitySection.dart';
import 'package:introduce_sprta_flutter_3_team/components/user_detail/InfoSection.dart';
import 'package:introduce_sprta_flutter_3_team/components/user_detail/ProfileSection.dart';
import 'package:introduce_sprta_flutter_3_team/components/user_detail/SkillSection.dart';
import 'package:introduce_sprta_flutter_3_team/models/UserProfile.dart';

class UserDetailScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  const UserDetailScreen({
    Key? key,
    required this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserProfile.fromMap(userData);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56), // 높이를 56픽셀로 설정
        child: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white, // 배경색 고정
          surfaceTintColor: Colors.transparent, // 스크롤 시 색상 변화 방지
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('프로필 보기'),
          titleTextStyle: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로필 영역
            ProfileSection(
              profileImage: user.profileImage,
              role: user.role,
              description: user.description,
              badges: user.badges,
            ),
            HorizontalDivider(
                color: Colors.grey[300]!,
                thickness: 3.0,
                indent: 0.0,
                endIndent: 0.0),

            // 개인 정보 영역
            InfoSection(user: user),
            HorizontalDivider(
                color: Colors.grey[300]!,
                thickness: 3.0,
                indent: 0.0,
                endIndent: 0.0),

            // 역량 영역
            CapabilitySection(capabilities: user.capabilities),
            HorizontalDivider(
                color: Colors.grey[300]!,
                thickness: 3.0,
                indent: 0.0,
                endIndent: 0.0),

            // 스킬 영역
            SkillSection(skills: user.skills),
            const SizedBox(height: AppStyles.defaultSpacing),
          ],
        ),
      ),
    );
  }
}
