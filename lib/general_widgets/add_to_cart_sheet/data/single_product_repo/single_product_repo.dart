import 'package:dartz/dartz.dart';


import '../../../../core/errors/failure.dart';
import '../../models/single_product_model/SingleProductModel.dart';
import '../../models/single_sku_details/SingleSkuDetails.dart';

abstract class SingleProductRepo{
  Future<Either<Failure,SingleProductModel>> getSingleProductModel({required String id});
}