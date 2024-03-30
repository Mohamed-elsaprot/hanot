import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../model/category_details/CategoryDetails.dart';

abstract class CategoryDetailsRepo{
  Future<Either<Failure,List<CategoryDetails>>> getCategories();

}