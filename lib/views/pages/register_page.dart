import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:register_app/cubits/register_cubit/register_cubit.dart';
import 'package:register_app/helpers/show_snack_bar_function.dart';
import 'package:register_app/views/widgets/register_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          showSnachBarFun(context, 'Sign in done successfully');
          isLoading = false;
        } else if (state is RegisterFailure) {
          showSnachBarFun(context, state.erorrMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: const Scaffold(
            backgroundColor: Color(0xFFF3F3F3),
            body: RegisterBody(),
          ),
        );
      },
    );
  }
}
