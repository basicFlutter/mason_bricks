import 'package:dartz/dartz.dart';
import '../../../core/exceptions/response_error.dart';
import '../../../core/success_response/success_response.dart;

abstract class {{name.pascalCase()}}Repository {
  Future<Either<ResponseError, SuccessResponse>> {{useCaseName}}(params);
}