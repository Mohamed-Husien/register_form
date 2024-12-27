import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_cubit_state.dart';

class RegisterCubitCubit extends Cubit<RegisterCubitState> {
  RegisterCubitCubit() : super(RegisterCubitInitial());

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterCubitLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(RegisterCubitSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(RegisterCubitFailure(
            erorrMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(RegisterCubitFailure(
            erorrMessage: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(RegisterCubitFailure(
          erorrMessage: 'There was an error please try again!'));
    }
  }
}
