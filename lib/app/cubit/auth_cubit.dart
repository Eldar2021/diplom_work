import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_world/core/core.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authService) : super(AuthState());

  final AuthService authService;

  Future<void> signInWithGoogle() async {
    await authService.signInWithGoogle();
  }
}
