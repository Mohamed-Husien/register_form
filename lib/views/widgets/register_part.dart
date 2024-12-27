import 'package:flutter/material.dart';
import 'package:register_app/helpers/validate_email.dart';
import 'package:register_app/helpers/validate_name.dart';
import 'package:register_app/helpers/validate_password.dart';
import 'package:register_app/views/widgets/custom_button.dart';
import 'package:register_app/views/widgets/custom_text_form_field.dart';
import 'package:register_app/views/widgets/cutom_text_buttom.dart';

class RegisterPart extends StatefulWidget {
  const RegisterPart({super.key});

  @override
  State<RegisterPart> createState() => _RegisterPartState();
}

class _RegisterPartState extends State<RegisterPart> {
  bool isSecurePassword = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? password, email, name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              onChanged: (value) {
                email = value;
              },
              validator: (value) => validateName(value),
              hint: 'Name',
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              onChanged: (value) {
                email = value;
              },
              validator: (value) => validateEmail(value),
              hint: 'Email',
            ),
            const SizedBox(height: 24),
            //---------------------------------------------

            CustomTextFormField(
              onChanged: (value) {
                password = value;
              },
              validator: (value) => validatePassword2(value),
              obscureText: isSecurePassword,
              suffixIcon: toggalePassword(),
              hint: 'Password',
            ),
            //--------------------------------------------
            const SizedBox(height: 84),
            CustomButton(
              width: double.infinity,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  // BlocProvider.of<SignInCubit>(context)
                  //     .loginUser(email: email!, password: password!);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
            ),
            //-------------------------------------------------
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("You already have an account?"),
                CustomTextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   (MaterialPageRoute(
                    //     builder: (context) {
                    //       return const ResgisterView();
                    //     },
                    //   )),
                    // );
                  },
                  text: "Sign In",
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget toggalePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecurePassword = !isSecurePassword;
        });
      },
      icon: isSecurePassword
          ? const Icon(
              Icons.visibility_off,
              color: Color(0xff007BFF),
            )
          : const Icon(
              Icons.visibility,
              color: Color(0xff007BFF),
            ),
    );
  }
}
