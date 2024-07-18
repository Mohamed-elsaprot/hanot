import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/local_storage/secure_storage.dart';
import 'package:hanot/features/lang/data/lang_repo.dart';
import 'package:hanot/features/lang/manager/lang_states.dart';
import 'package:hanot/features/lang/model/LangModel.dart';

class LangCubit extends Cubit<LangState>{
  LangCubit(this.langRepo):super(LangInitial());
  final LangRepo langRepo;
  // late LangModel langModel;
  List<LangModel> availableLang=[];
  Map texts ={};
  late String local;

  getTextMap()async{
    var res = await langRepo.getTexts();
    res.fold((failure){
      emit(LangFailure(errorMessage: failure.errorMessage));
    }, (map){
      texts=map;
      emit(LangPreSuccess());
    });
  }

  checkUserLang()async{
    emit(LangLoading());
    var lang = await SecureStorage.getUserLang();
    if(lang!=null){
      local=lang;
      getTextMap();
    }else{
      await getDefaultLang();
    }
  }

  getDefaultLang()async{
    var res = await langRepo.getDefaultUserLang();
    res.fold((failure){
      emit(LangFailure(errorMessage: failure.errorMessage));
    }, (defaultLang)async{
      // langModel = defaultLang;
      local=defaultLang.locale!;
      await SecureStorage.setUserLang(defaultLang.locale!);
      await SecureStorage.setAppDirection(defaultLang.direction!);
      getTextMap();
    });
  }

  setUserDefaultLang(LangModel x)async{
    emit(SetUserLangLoading());
    var res = await langRepo.setUserDefaultLang(langId: x.id!.toInt());
    res.fold((failure){
      emit(SetUserLangFailure(errorMessage: failure.errorMessage));
    }, (successRes) async {
      await SecureStorage.setUserLang(x.locale!);
      await SecureStorage.setAppDirection(x.direction!);
      local=x.locale!;
      emit(SetUserLangSuccess());
    });
  }

  getAvailableLang()async{
    emit(GetAvailableLangLoading());
    var res = await langRepo.getLanguages();
    res.fold((failure){
      emit(GetAvailableLangFailure(errorMessage: failure.errorMessage));
    }, (list){
      availableLang = list;
      emit(GetAvailableLangSuccess());
    });
  }
}