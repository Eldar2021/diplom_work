part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({this.user, this.error});

  final User? user;
  final String? error;

  @override
  List<Object?> get props => [user, error];

  AuthState copyWith({User? user, String? error}) {
    return AuthState(
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}
