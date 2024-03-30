import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../model/SmallCategoryModel.dart';


abstract class SmallCategoryRepo{
  Future<Either<Failure,List<SmallCategoryModel>>> getSmallCategories();
}