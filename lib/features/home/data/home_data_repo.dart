import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';


abstract class HomeDataRepo{
  Future<Either<Failure,List>> getHomeData();
}