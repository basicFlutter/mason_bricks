import 'package:dartz/dartz.dart';
import '../../../../core/success_response/success_response.dart';
import '../../../../core/error/failures.dart';
abstract class {{name.pascalCase()}}Repository {
  Future<Either<Failure, SuccessResponse>> {{useCase.camelCase()}}();
}