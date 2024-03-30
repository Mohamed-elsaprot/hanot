import 'package:dartz/dartz.dart';
import 'package:hanot/general_widgets/item_sheet/models/single_product_model/SingleProductModel.dart';
import 'package:hanot/general_widgets/item_sheet/models/single_sku_details/SingleSkuDetails.dart';

import '../../../../core/errors/failure.dart';

abstract class SingleProductRepo{
  Future<Either<Failure,SingleProductModel>> getSingleProductModel({required String id});
  Future<Either<Failure,SingleSkuDetails>> checkSkuDetails({required Map body});
}