import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_world/core/core.dart';
import 'package:learn_world/models/models.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authService) : super(AuthState(user: authService.init()));

  final AuthService authService;

  Future<void> signInWithGoogle() async {
    final (user, error) = await authService.signInWithGoogle();
    if (user != null) return emit(state.copyWith(user: user));
    if (error != null) return emit(state.copyWith(error: error));
  }

  Future<void> logout() async {
    await authService.logout();
    emit(const AuthState());
  }
}
