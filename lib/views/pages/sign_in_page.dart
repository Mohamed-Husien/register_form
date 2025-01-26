import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:register_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:register_app/helpers/show_snack_bar_function.dart';
import 'package:register_app/views/widgets/sign_in_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          isLoading = true;
        } else if (state is SignInSuccess) {
          showSnachBarFun(context, 'Sign in done successfully');
          isLoading = false;
        } else if (state is SignInFailure) {
          showSnachBarFun(context, state.erorrMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: const Scaffold(
            backgroundColor: Color(0xFFF3F3F3),
            body: SignInBody(),
          ),
        );
      },
    );
  }
}
