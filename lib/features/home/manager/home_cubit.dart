import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/home/data/home_data_repo_impl.dart';
import 'package:hanot/features/home/manager/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit(this.homeDataRepoImpl):super(HomeInitial());
  final HomeDataRepoImpl homeDataRepoImpl;
  List homeList=[];

  getHomeData()async{
    emit(HomeLoading());
    var res = await homeDataRepoImpl.getHomeData();
    res.fold((failure){
      emit(HomeFailure(errorMessage: failure.errorMessage));
    }, (list) {
      homeList = list;
      emit(HomeSuccess());
    });
  }
}