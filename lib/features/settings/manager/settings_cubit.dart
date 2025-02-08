import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/settings/data/settings_repo.dart';
import 'package:hanot/features/settings/manager/settings_states.dart';

class SettingsCubit extends Cubit<SettingsStates>{
  SettingsCubit(this.settingsRepo):super(SettingsInitial());

  final SettingsRepo settingsRepo;
  Map settingsMap= {};
  getSettings()async{
    emit(SettingsLoading());
    var res = await settingsRepo.getSettings();
    res.fold((failure){
      emit(SettingsFailure(errorMessage: failure.errorMessage));
    }, (map){
      settingsMap=map;
      emit(SettingsSuccess());
    });
  }
}