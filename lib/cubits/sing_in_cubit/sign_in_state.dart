part of 'sigin_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInitial extends SignInState {}

final class SignInSuccess extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInFailure extends SignInState {
  final String erorrMessage;

  SignInFailure({required this.erorrMessage});
}
