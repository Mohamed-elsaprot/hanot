import 'package:dartz/dartz.dart';
import 'package:hanot/features/tabs_screen/model/category_details/CategoryDetails.dart';

import '../../../../core/errors/failure.dart';

abstract class SingleCategoryRepo{
  Future<Either<Failure,CategoryDetails>> getSingleCategory({required String catId});
}