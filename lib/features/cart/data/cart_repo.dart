import 'package:dartz/dartz.dart';
import 'package:hanot/core/errors/failure.dart';

import '../../../general_widgets/add_to_cart_sheet/models/single_sku_details/SingleSkuDetails.dart';

abstract class CartRepo{
  Future<Either<Failure,Map>> addToCart({required Map body});
  Future<Either<Failure,SingleSkuDetails>> checkSkuDetails({required Map body});
  Future<Either<Failure,Map>> getCartProducts();
  Future<Either<Failure,Map>> deleteCartProducts({required String rowId});
  Future<Either<Failure,Map>> updateProduct({required String rowId,required int qun,required String id});

}