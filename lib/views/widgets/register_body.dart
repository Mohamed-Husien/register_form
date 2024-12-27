import 'package:flutter/material.dart';
import 'package:register_app/views/widgets/header_text.dart';
import 'package:register_app/views/widgets/register_part.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 48,
            ),
            HeaderText(
              text1: "Welcome!.",
              text2: "Register now to unlock a world of exclusive services.",
            ),
            SizedBox(
              height: 16,
            ),
            RegisterPart()
          ],
        ),
      ),
    );
  }
}
