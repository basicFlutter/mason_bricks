import 'package:dartz/dartz.dart';
import '../../../../core/error/response_error.dart';
import '../../../../core/success_response/success_response.dart';

abstract class UserRepository {
  Future<Either<ResponseError, SuccessResponse>> getUsers();
}