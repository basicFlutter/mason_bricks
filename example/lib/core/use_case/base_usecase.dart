import 'package:dartz/dartz.dart';
import '/core/error/response_error.dart';

abstract class BaseUseCase<Type, InputParams> {
  Future<Either<ResponseError, Type>> call(InputParams params);
}