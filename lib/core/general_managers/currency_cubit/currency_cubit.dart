import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/data/currency_repo/currency_repo.dart';
import 'package:hanot/core/local_storage/secure_storage.dart';
import 'package:hanot/core/models/Currency.dart';

import 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit(this.repo) : super(CurrencyInitial());
  final CurrencyRepo repo;

  late Currency currency;
  getDefaultCurrency()async{
    emit(CurrencyLoading());
    var res = await repo.getDefaultCurrency();
    res.fold((failure)=> emit(CurrencyFailure(errorMessage: failure.errorMessage)), (currency){
      this.currency = currency;
      SecureStorage.currency=currency.symbol;
      emit(CurrencySuccess());
    });
  }
}
