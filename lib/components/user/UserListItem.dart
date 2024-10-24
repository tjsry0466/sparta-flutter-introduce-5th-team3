import 'package:flutter/material.dart';
import 'package:introduce_sprta_flutter_3_team/components/common/Badge.dart';

class UserListItem extends StatelessWidget {
  final String name;
  final String role;
  final String profileImage;
  final List<String> badges;
  final VoidCallback onTap;

  const UserListItem({
    Key? key,
    required this.name,
    required this.role,
    required this.profileImage,
    required this.badges,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12), // radius 설정
      child: Container(
        color: Colors.white, // 배경색 흰색 설정
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20), // 좌우 패딩 제거
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 29,
                backgroundColor: Colors.grey[300],
                backgroundImage: AssetImage('assets/images/${profileImage}'),
              ),
              const SizedBox(width: 8),
              // 역할과 이름을 왼쪽에 배치
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Text(name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(width: 12),
              // 배지들을 오른쪽에 배치하고 Wrap으로 줄바꿈 처리
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    spacing: 8.0, // Chip 간의 간격
                    runSpacing: 8.0, // 줄 간의 간격
                    children: badges
                        .map((badge) => SkillBadge(label: badge))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_sharp,
            size: 28, // 아이콘 크기를 28 x 28으로 설정
            color: Color(0xFFC8C8C8), // 아이콘 색상을 회색으로 설정
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
