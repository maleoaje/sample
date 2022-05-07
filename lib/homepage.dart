import 'package:flutter/material.dart';
import 'package:sample/config/constants.dart';
import 'package:sample/config/global_style.dart';

class HomePage extends StatefulWidget {
  final String email;
  const HomePage({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          "Hello email: ${widget.email}",
          style: GlobalStyle.subTitleStyle,
        ),
      ),
    );
  }
}
