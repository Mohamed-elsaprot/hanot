import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/search/manager/search_results_cubit.dart';
import 'package:hanot/features/search/search_result_repo/search_result_repo.dart';
import 'package:hanot/features/search/view/widgets/search_body.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> SearchResultsCubit(SearchResultRepo()),child: const SearchBody(),);
  }
}
