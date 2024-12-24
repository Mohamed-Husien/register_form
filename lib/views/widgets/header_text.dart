import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: const TextStyle(
            color: Color(0xff2C385D),
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text2,
          style: const TextStyle(
            color: Color(0xff1B2B51),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Text(
        //   text3,
        //   style: const TextStyle(
        //     color: Color(0xff1B2B51),
        //     fontSize: 32,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ],
    );
  }
}
