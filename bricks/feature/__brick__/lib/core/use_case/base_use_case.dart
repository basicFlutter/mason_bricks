import 'package:dartz/dartz.dart';
import '../exceptions/response_error.dart';


abstract class BaseUseCase<Type, Map> {
  Future<Either<ResponseError, Type>> call(Map params);
}


