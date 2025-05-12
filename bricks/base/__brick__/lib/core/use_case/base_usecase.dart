import 'package:dartz/dartz.dart';
import '../error/failures.dart';

abstract class BaseUseCase<Type, InputParams> {
  Future<Either<Failure, Type>> call(InputParams params);
}