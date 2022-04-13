import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_projects/login/loginbloc/login_event.dart';
import 'package:ui_projects/login/loginbloc/login_state.dart';

import '../auth_repository.dart';
import '../formsubmission_status.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState (LoginEvent event) async*{

    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);

      // Password updated
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form submitted
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        //yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
