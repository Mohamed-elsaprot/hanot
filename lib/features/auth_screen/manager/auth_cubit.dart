import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/local_storage/secure_storage.dart';
import 'package:hanot/core/services/localization.dart';
import 'package:hanot/features/auth_screen/data/auth_repo_impl.dart';
import 'package:hanot/features/auth_screen/manager/auth_state.dart';
import 'package:hanot/features/auth_screen/view/otp/otp_screen.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit(this.authRepoImpl):super(AuthInitial());
  final AuthRepoImpl authRepoImpl;
  String authType = 'phone';
  int? id;
  String? email;
  String? name;
  String? phone;
  String? code;
  bool? isBlocked = false;
  bool isAuth = false;

  changeAuthType(String x){
    authType=x;
    emit(AuthInitial());
  }

  sendOtp({required BuildContext context})async{
    Map data={'email':email, 'phone':phone, 'type':authType};
    emit(AuthLoading());
    var res = await authRepoImpl.sendOtp(data: data);
    res.fold((failure){
      errorDialog(context: context, message: failure.errorMessage);
      emit(AuthFailure(errorMessage: failure.errorMessage));
    }, (map){
        id = map['id'];name = map['name'];email = map['email'];phone = map['phone'];isBlocked = map['is_blocked'];
      emit(AuthSuccess());
      Navigator.pop(context);
      bottomSheet(context, OtpScreen(),);
    });
  }
  confirmOtp({required String code})async{
    Map data={'email':email, 'phone':phone, 'code':code};
    emit(AuthLoading());
    var res = await authRepoImpl.confirmOtm(data: data);
    res.fold((failure){
      emit(AuthFailure(errorMessage: failure.errorMessage));
    }, (map) async {
      if(map['token']!=null){
        isAuth=true;
        await SecureStorage.setToken(map['token']);
        await SecureStorage.setUserId(id.toString());
        emit(AuthSuccess(name: map['customer']['name']));
      }else{
        emit(AuthFailure(errorMessage: Localization.tryAgainMessage));
      }
    });
  }
  setName({required String name})async{
    emit(AuthLoading());
    var res = await authRepoImpl.setName(name: name);
    res.fold((failure){
      emit(AuthFailure(errorMessage: failure.errorMessage));
    }, (map) => emit(AuthSuccess()));
  }

  checkToken()async{
    String? token = await SecureStorage.getToken();
    if(token!=null) isAuth = true;
    print(token);
  }

  logOut()async{
    await SecureStorage.deleteData();
    isAuth=false;
  }
}