import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginChangedEvent>((event, emit) {
      emit(state.copyWith(email: event.email, password: event.password));
    });

    on<LoginSubmittedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
