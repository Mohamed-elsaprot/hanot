import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../models/category_model/CategoryModel.dart';

abstract class NextPageProductsRepo{
  Future<Either<Failure,CategoryProductsModel>> getNextPageProducts({required String nextLink});

}