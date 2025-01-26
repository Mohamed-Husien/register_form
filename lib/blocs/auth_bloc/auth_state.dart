part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterFailure extends AuthState {
  final String erorrMessage;

  RegisterFailure({required this.erorrMessage});
}

final class SignInitial extends AuthState {}

final class SignInSuccess extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInFailure extends AuthState {
  final String erorrMessage;

  SignInFailure({required this.erorrMessage});
}
