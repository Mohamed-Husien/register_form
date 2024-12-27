import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final double width;
  final String text;
  const CustomButton(
      {super.key,
      required this.onTap,
      this.width = 180,
      this.text = "Register"});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      splashColor: const Color(0xffA2A8B7),
      highlightColor: Colors.transparent,
      child: Container(
        height: 64,
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xffFF5722),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}
