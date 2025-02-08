import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/categories/data/filter_repo/filter_repo.dart';

import '../../../features/categories/model/filter_model/FilterOption.dart';
import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(this.repo) : super(FilterInitial());
  final FilterRepo repo;
  List<FilterOption> filterOptions = [];
  // List<String?>? selectedOptions;
  List<String> selectedOptions=[];

  getFilterOptions({required String catId}) async {
    emit(FilterLoading());
    var res = await repo.getFilerOptions(catId: catId);
    res.fold(
        (failure) => emit(FilterFailure(errorMessage: failure.errorMessage)),
        (list) {
      filterOptions = list;
      // selectedOptions=List.generate(filterOptions.length, (index)=> null);
      emit(FilterSuccess());
    });
  }
  //required int index,
  //Two pieces overall
  setOptionVal({required String val}){
    // selectedOptions![index]=val;
    selectedOptions!.contains(val)? selectedOptions!.remove(val):selectedOptions!.add(val);
    emit(FilterSuccess());
  }
}
