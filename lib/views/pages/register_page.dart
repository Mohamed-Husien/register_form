import 'package:flutter/material.dart';
import 'package:register_app/views/widgets/register_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: RegisterBody(),
    );
  }
}
