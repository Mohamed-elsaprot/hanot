import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/models/category_model/Product.dart';
import 'package:hanot/features/search/manager/search_result_state.dart';
import 'package:hanot/features/search/search_result_repo/search_result_repo.dart';

class SearchResultsCubit extends Cubit<SearchResultState>{
  SearchResultsCubit(this.searchResultRepo):super(SearchResultsInitial());
  final SearchResultRepo searchResultRepo;
  List<Product> resultsList=[];

  getResults({required String keyWord})async{
    emit(SearchResultsLoading());
    var res = await searchResultRepo.getSearchResults(keyWord: keyWord);
    res.fold((failure){
      emit(SearchResultsFailure(errorMessage: failure.errorMessage));
    }, (list){
      resultsList=list;
      emit(SearchResultsSuccess());
    });
  }
}