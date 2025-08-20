import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/token_storage.dart';
import '../../../services/api_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiService apiService;

  AuthBloc(this.apiService) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await apiService.login({
        "email": event.email,
        "password": event.password,
      });

      final token = response["access_token"] ??
          response["token"] ??
          response["jwt"];

      if (token != null) {
        TokenStorage.saveToken(token);
        emit(AuthSuccess(token));
      } else {
        emit(AuthFailure("No token found in response"));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
