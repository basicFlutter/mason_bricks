import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/exceptions/response_error.dart';
import '../../../../core/success_response/SuccessResponse.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../domain/repositories/{{name}}_repository.dart';
class {{name.pascalCase()}}RepositoryImpl extends {{name.pascalCase()}}Repository{

    @override
    Future<Either<ResponseError, SuccessResponse>> {{useCase.camelCase()}}(params) async{
       try {

       // return Right(SuccessResponse());
       } on DioException catch (error) {
       // ResponseError responseError =  ErrorHandling().handleDioError(error, {{useCaseName}},);
       // return Left(responseError);
       }
    }

}