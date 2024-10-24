import 'package:flutter/material.dart';
import 'package:introduce_sprta_flutter_3_team/components/user/UserListItem.dart';
import 'package:introduce_sprta_flutter_3_team/pages/UserDetailScreen.dart';

class UserList extends StatelessWidget {
  final List<Map<String, dynamic>> users;

  UserList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: users.length,
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: UserListItem(
            name: users[index]['name']!,
            role: users[index]['role']!,
            profileImage: users[index]['profileImage']!,
            badges: users[index]['badges']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailScreen(
                    userData: users[index], // userData에서 특정 인덱스의 데이터를 전달
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
