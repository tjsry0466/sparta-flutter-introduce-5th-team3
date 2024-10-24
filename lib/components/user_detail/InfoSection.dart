import 'package:flutter/material.dart';
import 'package:introduce_sprta_flutter_3_team/components/common/AppStyle.dart';
import 'package:introduce_sprta_flutter_3_team/components/user_detail/InfoRow.dart';
import 'package:introduce_sprta_flutter_3_team/models/UserProfile.dart';
import 'package:introduce_sprta_flutter_3_team/utils/CaculateAge.dart';

class InfoSection extends StatelessWidget {
  final UserProfile user;

  const InfoSection({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.sectionPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '상세 프로필',
            style: AppStyles.sectionTitle,
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoRow(label: '이름:', value: user.name),
                    InfoRow(
                      label: '나이:',
                      value: calculateAge(user.birth).toString(),
                    ),
                    InfoRow(label: '성별:', value: user.gender),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    InfoRow(label: '거주 지역:', value: user.location),
                    InfoRow(label: 'MBTI:', value: user.mbti),
                    InfoRow(label: '관심사:', value: user.interests),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
