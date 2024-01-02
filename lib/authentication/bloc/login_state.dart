part of 'login_bloc.dart';

@immutable
class LoginState {
  final String email;
  final String password;
  final String? error;

  LoginState({
    required this.email,
    required this.password,
    this.error,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? error,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
    );
  }
}

class LoginInitial extends LoginState {
  LoginInitial({String email = '', String password = ''}) : super(email: email, password: password);
}

class LoginLoading extends LoginState {
  LoginLoading({String email = '', String password = ''}) : super(email: email, password: password);
}

class LoginSuccess extends LoginState {
  LoginSuccess({String email = '', String password = ''}) : super(email: email, password: password);
}

class LoginFailed extends LoginState {
  LoginFailed({required String error, String email = '', String password = ''})
      : super(email: email, password: password, error: error);
}
