import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../model/category_model/CategoryModel.dart';

abstract class ProductsRepo{
  Future<Either<Failure,CategoryProductsModel>> getCategoryProducts({required String catId});

}