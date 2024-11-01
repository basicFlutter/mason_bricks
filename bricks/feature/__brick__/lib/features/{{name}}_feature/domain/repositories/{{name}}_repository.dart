import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/response_error.dart';
import '../../../../core/success_response/SuccessResponse.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Either<ResponseError, SuccessResponse>> {{useCaseName.camelCase()}}(params);
}