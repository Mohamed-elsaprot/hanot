import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/local_storage/secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:open_store/open_store.dart';
import '../../features/lang/manager/lang_cubit.dart';
import '../../general_widgets/custom_button.dart';
import '../design/app_styles.dart';

class VersionHandler{
  static late String version;

  static Future checkVersion(BuildContext context)async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    if(SecureStorage.version==null){
      SecureStorage.setVersion(version);
    }else{
      if(SecureStorage.version!=version) showDialog(context: context, builder: (context){
        Map textsMap = BlocProvider.of<LangCubit>(context).texts;
        return AlertDialog(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(backgroundColor: Colors.grey.shade200,radius: 50.sp,child: Icon(Icons.update,size: 40.sp,),),
              SizedBox(height: 15.h,),
              Styles.text(textsMap['new_version'],textAlign: TextAlign.center),
              SizedBox(height: 10.h,),
              Styles.text(textsMap['update_quote'],textAlign: TextAlign.center),
              SizedBox(height: 30.h,),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                  fun: () {
                    OpenStore.instance.open(
                        appStoreId: '6705133300',
                        androidAppBundleId: 'com.frame.hanot.bbear',
                    );
                  },
                  title: textsMap['update_now'],
                  rad: 50,textSize: 12,
                ),
              ),
              SizedBox(height: 10.h,),
            ],
          ),
        );
      });
    }
  }

}