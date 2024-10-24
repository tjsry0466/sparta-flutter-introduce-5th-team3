import 'package:flutter/material.dart';

class TitleImage extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry padding;

  const TitleImage({
    Key? key,
    this.height = 280, // 기본 높이를 300으로 설정
    this.padding = const EdgeInsets.fromLTRB(30, 10, 20, 0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sparta.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
