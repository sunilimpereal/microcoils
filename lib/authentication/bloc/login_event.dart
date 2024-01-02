part of 'login_bloc.dart';

@immutable
class LoginEvent {}

class LoginChangedEvent extends LoginEvent {
  String? email;
  String? password;
  LoginChangedEvent({this.email, this.password});
}

class LoginSubmittedEvent extends LoginEvent {}

class LoginReitializeEvent extends LoginEvent {}
