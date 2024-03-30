abstract class AuthState{}

class AuthLoading extends AuthState{}
class AuthSuccess extends AuthState{}
class AuthFailure extends AuthState{
  final String errorMessage;
  AuthFailure({required this.errorMessage});
}

class AuthInitial extends AuthState{}