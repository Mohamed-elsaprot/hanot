import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/order_details/data/get_single_order_repo.dart';
import 'package:hanot/features/order_details/data/get_states_repo.dart';
import 'package:hanot/features/order_details/manager/get_single_order_state.dart';
import 'package:hanot/features/order_details/models/StateModel.dart';
import 'package:hanot/features/order_details/models/single_order.dart';

class SingleOrderCubit extends Cubit<GetSingleOrderState>{
  SingleOrderCubit(this.getSingleOrderRepo, this.getStatesRepo,):super(GetSingleOrderInitial());
  final GetSingleOrderRepo getSingleOrderRepo;
  final GetStatesRepo getStatesRepo;
  late SingleOrder singleOrderModel;
  List<StateModel> statesList=[];

  getSingleOrder({required int orderId})async{
    emit(GetSingleOrderLoading());
    var res = await getSingleOrderRepo.getSingleOrder(orderId: orderId);
    res.fold((failure){
      emit(GetSingleOrderFailure(errorMessage: failure.errorMessage));
    }, (singleOrder){
      singleOrderModel = singleOrder;
      emit(GetSingleOrderSuccess());
    });
  }

  getStates({required int orderId})async{
    emit(GetStatesLoading());
    var res = await getStatesRepo.getStates(orderId: orderId);
    res.fold((failure){
      emit(GetStatesFailure(errorMessage: failure.errorMessage));
    },(list){
      statesList=list;
      emit(GetStatesSuccess());
    });
  }
}