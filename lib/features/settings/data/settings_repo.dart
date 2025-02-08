import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/app_styles.dart';
import '../../../core/errors/failure.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/localization.dart';
import '../../../general_widgets/custom_button.dart';
import '../../lang/manager/lang_cubit.dart';

class SettingsRepo {
  Future<Either<Failure,Map>> getSettings() async {
    try {
      Map response = await ApiService.getData(endPoint: ApiService.settings);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }

  logOutDialog(BuildContext context, void Function() yesFun){
    var langCubit = BlocProvider.of<LangCubit>(context);

    showDialog(context: context, builder: (context){
      return AlertDialog(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Styles.text(langCubit.texts['mobile_confirm_logout_message'],textAlign: TextAlign.center),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    padding: EdgeInsets.symmetric(horizontal: 45.w,vertical: 10.h),
                    fun: yesFun,
                    title: langCubit.texts['mobile_yes_button_label'],
                    rad: 50,textSize: 12,
                  ),
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: CustomButton(
                    padding: EdgeInsets.symmetric(horizontal: 45.w,vertical: 10.h),
                    fun: () => Navigator.pop(context),
                    title: langCubit.texts['mobile_no_button_label'],
                    rad: 50,textSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}