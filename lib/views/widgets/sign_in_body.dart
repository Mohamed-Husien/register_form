import 'package:flutter/material.dart';
import 'package:register_app/views/widgets/header_text.dart';
import 'package:register_app/views/widgets/sign_in_part.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 64,
            ),
            HeaderText(
              text1: "Welcome Back!.",
              text2: "Sign in now to unlock a world of exclusive services.",
            ),
            SizedBox(
              height: 120,
            ),
            SingInPart(),
          ],
        ),
      ),
    );
  }
}
