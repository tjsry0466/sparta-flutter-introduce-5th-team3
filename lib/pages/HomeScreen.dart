import 'package:flutter/material.dart';
import 'package:introduce_sprta_flutter_3_team/components/common/TitleImage.dart';
import 'package:introduce_sprta_flutter_3_team/components/user/UserList.dart';
import 'package:introduce_sprta_flutter_3_team/contant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TitleImage(),
            Expanded(child: UserList(users: users)),
          ],
        ),
      ),
    );
  }
}
