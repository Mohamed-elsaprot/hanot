abstract class AuthState{}

class AuthLoading extends AuthState{}
class AuthSuccess extends AuthState{
  final String? name;
  AuthSuccess({this.name});
}
class AuthFailure extends AuthState{
  final String errorMessage;
  AuthFailure({required this.errorMessage});
}

class AuthInitial extends AuthState{}