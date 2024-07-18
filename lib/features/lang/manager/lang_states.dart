abstract class LangState{}

class LangInitial extends LangState{}
class LangLoading extends LangState{}
class LangPreSuccess extends LangState{}
class LangSuccess extends LangState{}
class LangFailure extends LangState{
  final String errorMessage;
  LangFailure({required this.errorMessage});
}

class SetUserLangLoading extends LangState{}
class SetUserLangSuccess extends LangState{}
class SetUserLangFailure extends LangState{
  final String errorMessage;
  SetUserLangFailure({required this.errorMessage});
}

class GetAvailableLangLoading extends LangState{}
class GetAvailableLangSuccess extends LangState{}
class GetAvailableLangFailure extends LangState{
  final String errorMessage;
  GetAvailableLangFailure({required this.errorMessage});
}