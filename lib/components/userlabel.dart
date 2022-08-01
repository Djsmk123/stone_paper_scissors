import 'package:flutter/material.dart';

import '../constant.dart';

class UsersLabel extends StatelessWidget {
  final String title;
  const UsersLabel({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      decoration: BoxDecoration(
          color: secondanryBackClr,
          borderRadius: BorderRadius.circular(8)
      ),
      child:  Text(title,style:  const TextStyle(
          color: Colors.white,
          fontSize: 20
      ),),
    );
  }
}