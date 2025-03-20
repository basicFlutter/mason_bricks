import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/error_handling.dart';
import '../../../../core/error/response_error.dart';
import '../../../../core/success_response/success_response.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/user_api_provider.dart';

class UserRepositoryImpl extends UserRepository{
    UserApiProvider userApiProvider;
    UserRepositoryImpl({required this.userApiProvider});
    @override
    Future<Either<ResponseError, SuccessResponse>> getUsers() async{
       try {
       final response = await userApiProvider.callGetUsersRoute();
       return Right(SuccessResponse());
       } on DioException catch (error) {
       ResponseError responseError =  ErrorHandling().handleDioError(error, "getUsers");
       return Left(responseError);
       }
    }

}
