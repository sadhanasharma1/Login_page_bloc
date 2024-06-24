import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../services/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService = AuthService();

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      bool isAuthenticated = await _authService.login(event.username, event.password);
      if (isAuthenticated) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure());
      }
    });

    on<SignupEvent>((event, emit) async {
      bool isRegistered = await _authService.signup(event.username, event.password);
      if (isRegistered) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure());
      }
    });

    on<LogoutEvent>((event, emit) {
      emit(AuthInitial());
    });
  }
}
