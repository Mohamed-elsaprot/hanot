import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/auth_screen/data/auth_repo_impl.dart';
import 'package:hanot/features/auth_screen/manager/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit(this.authRepoImpl):super(AuthInitial());
  final AuthRepoImpl authRepoImpl;
  String authType = 'phone';
  int? id;
  String? email;
  String? name;
  String? phone;
  bool isBlocked = false;
  bool isAuth = false;

  changeAuthType(String x){
    authType=x;
    emit(AuthInitial());
  }


  sendOtp()async{
    Map data={'email':email, 'phone':phone, 'type':authType};
    emit(AuthLoading());
    var res = await authRepoImpl.sendOtp(data: data);
    res.fold((failure){
      emit(AuthFailure(errorMessage: failure.errorMessage));
    }, (map){
      id = map['id'];name = map['name'];email = map['email'];phone = map['phone'];isBlocked = map['is_blocked'];
      emit(AuthSuccess());
    });
  }
}