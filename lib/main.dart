import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_app/cubits/register_cubit/register_cubit.dart';
import 'package:register_app/cubits/sing_in_cubit/sigin_in_cubit.dart';
import 'package:register_app/cubits/store_user_data_cubit/store_user_data_cubit.dart';
import 'package:register_app/firebase_options.dart';
import 'package:register_app/views/pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RegisterApp());
}

class RegisterApp extends StatelessWidget {
  const RegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => SignInCubit(),
        ),
        BlocProvider(
          create: (context) => StoreUserDataCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Arial'),
        debugShowCheckedModeBanner: false,
        home: const RegisterPage(),
      ),
    );
  }
}
