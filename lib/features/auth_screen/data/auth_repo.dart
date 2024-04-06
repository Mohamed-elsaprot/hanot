import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure,Map>> sendOtp({required Map data});
  Future<Either<Failure,Map>> confirmOtm({required Map data});
}