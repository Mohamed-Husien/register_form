import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInitial());
  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(SignInLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailure(erorrMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailure(
            erorrMessage: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(SignInFailure(erorrMessage: 'There was an error please try again!'));
    }
  }
}
