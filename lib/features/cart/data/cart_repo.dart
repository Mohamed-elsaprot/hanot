import 'package:dartz/dartz.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/features/cart/models/CartProductModel.dart';

import '../../../general_widgets/add_to_cart_sheet/models/single_sku_details/SingleSkuDetails.dart';

abstract class CartRepo{
  Future<Either<Failure,Map>> addToCart({required Map body});
  Future<Either<Failure,SingleSkuDetails>> checkSkuDetails({required Map body});
  Future<Either<Failure,List<CartProductModel>>> getCartProducts();
}