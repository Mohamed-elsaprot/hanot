abstract class SearchResultState{}

class SearchResultsInitial extends SearchResultState{}
class SearchResultsLoading extends SearchResultState{}
class SearchResultsSuccess extends SearchResultState{}
class SearchResultsFailure extends SearchResultState{
  final String errorMessage;
  SearchResultsFailure({required this.errorMessage});
}