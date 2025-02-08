import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/favorites/data/models/get_favorites_model.dart';
import 'package:hanot/general_widgets/removed_price.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun.dart';
import '../../../../core/design/widgets_fun.dart';
import '../../../../core/local_storage/secure_storage.dart';
import '../../../../core/models/category_model/Product.dart';
import '../../../../general_widgets/add_to_cart_sheet/add_to_cart_sheet.dart';
import '../../../../general_widgets/fav_icon.dart';
import '../../../auth_screen/view/phone/auth_screen.dart';

class FavItemCard extends StatelessWidget {
  const FavItemCard({Key? key, required this.favItemModel, required this.index}) : super(key: key);
  final FavItemModel favItemModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    bool checkPrice= favItemModel.discountPrice!=null&&favItemModel.discountPrice!=0;
    return GestureDetector(
      onTap: () async {
        if (!authCubit.isAuth) {
          bottomSheet(
            context,
            const AuthScreen(),
          );
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddToCartScreen(
              product: Product(id: favItemModel.productId,image: favItemModel.image ?? '', inFavorites: true),fromFavScreen: true,
          )));
          // bottomSheet(context, AddToCartScreen(product: Product(id: favItemModel.productId, inFavorites: true),fromFavScreen: true,));
        }
      },
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Hero(tag: favItemModel.id!,child: cachedImage(favItemModel.image ?? '', rad: 10, height: 100, width: 120)),),
                  SizedBox(width: 10.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 200.w,
                          child: Styles.text(favItemModel.name ?? '', size: 13, overflow: TextOverflow.ellipsis),
                      ),
                      // SizedBox(
                      //   height: 8.h,
                      // ),
                      // SizedBox(
                      //     width: 200.w,
                      //     child: Styles.subTitle(favItemModel.,
                      //         size: 11, overflow: TextOverflow.ellipsis)),
                      SizedBox(height: 8.h,),
                      Styles.subTitle('متبقي ${favItemModel.quantity} قطعة', color: Colors.red),
                      SizedBox(height: 15.h,),
                      SizedBox(
                        height: 20.h,
                        child: Row(
                          children: [
                            Styles.text('${checkPrice? favItemModel.discountPrice : favItemModel.salePrice} ${SecureStorage.currency}',color: Styles.primary,size: 13),
                            SizedBox(width: 5.w,),
                            if(checkPrice)RemovedPrice(removedPrice: favItemModel.salePrice??0),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          PositionedDirectional(end: 25, top: 25, child: FavIcon(product: Product(inFavorites: true,id: favItemModel.productId),fromFavScreen: true,))
        ],
      ),
    );
  }
}
