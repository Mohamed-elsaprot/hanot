import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../model/category_details/CategoryDetails.dart';

abstract class SingleCategoryRepo{
  Future<Either<Failure,CategoryDetails>> getSingleCategory({required String catId});
}