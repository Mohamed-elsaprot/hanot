import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/core/local_storage/secure_storage.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/features/lang/manager/lang_states.dart';

import '../../../core/design/app_styles.dart';

class Lang extends StatefulWidget {
  const Lang({Key? key}) : super(key: key);

  @override
  State<Lang> createState() => _LangState();
}

class _LangState extends State<Lang> {
  int selectedIndex=-1;
  late LangCubit langCubit;
  late AuthCubit authCubit;
  late String newLocale;
  @override
  void initState() {
    langCubit = BlocProvider.of<LangCubit>(context);
    newLocale = langCubit.local;
    authCubit = BlocProvider.of<AuthCubit>(context);
    langCubit.getAvailableLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.secScaffoldColor,
        appBar: AppBar(
          title: Styles.text(
            langCubit.texts['mobile_lang'],
            size: 20,
          ),
          actions: [
            BlocConsumer<LangCubit, LangState>(
              buildWhen: (context,state)=> state is SetUserLangSuccess||state is SetUserLangLoading||state is SetUserLangFailure || state is LangSuccess,
                builder: (context, state) {
                  if (state is SetUserLangLoading) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: loadingIndicator(rad: 15),
                    );
                  } else {
                    return IconButton(
                      onPressed: () async {
                        if(authCubit.isAuth){
                          langCubit.setUserDefaultLang(langCubit.availableLang[selectedIndex]);
                        }else{
                          await SecureStorage.setUserLang(langCubit.availableLang[selectedIndex].locale!);
                          await SecureStorage.setAppDirection(langCubit.availableLang[selectedIndex].direction!);
                          langCubit.local=langCubit.availableLang[selectedIndex].locale!;
                          langCubit.emit(SetUserLangSuccess());
                        }
                      },
                      tooltip: 'save',
                      icon: FittedBox(
                        child: Column(
                          children: [
                            const Icon(
                              Icons.save,
                              size: 25,
                              color: Styles.primary,
                            ),
                            Styles.text('Save', color: Styles.primary)
                          ],
                        ),
                      ),
                    );
                  }
                },
                listener: (context, state) {
                  if(state is SetUserLangSuccess){
                    langCubit.emit(SetUserLangLoading());
                    langCubit.getTextMap();
                  }
                  if(state is SetUserLangFailure) errorDialog(context: context, message: state.errorMessage);
                })
          ],
        ),
        body: BlocBuilder<LangCubit, LangState>(
          buildWhen: (context,state) => state is GetAvailableLangSuccess||state is GetAvailableLangFailure ||state is GetAvailableLangLoading,
          builder: (context, state) {
            if (state is GetAvailableLangSuccess) {
              return ListView.builder(
                  itemCount: langCubit.availableLang.length,
                  itemBuilder: (context,index){
                    if(langCubit.availableLang[index].locale==newLocale){
                      selectedIndex=index;
                    }
                return  RadioListTile(
                  value: index,
                  groupValue: selectedIndex,
                  onChanged: (x) async {
                    selectedIndex = x!;
                    newLocale=langCubit.availableLang[index].locale!;
                    setState(() {});
                  },
                  title: Styles.text(langCubit.availableLang[index].native??''),
                );
              });
            } else {
              return loadingIndicator();
            }
          },
        ));
  }
}