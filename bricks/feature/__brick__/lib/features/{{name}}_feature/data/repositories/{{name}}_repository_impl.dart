import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/exceptions/response_error.dart';
import '../../../../core/success_response/SuccessResponse.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../domain/repositories/{{name}}_repository.dart';
import '../../../../core/data/error_handling/error_handling.dart';
class {{name.pascalCase()}}RepositoryImpl extends {{name.pascalCase()}}Repository{
    {{name.pascalCase()}}ApiProvider {{name.camelCase()}}ApiProvider;
    {{name.pascalCase()}}RepositoryImpl({required this.{{name.camelCase()}}ApiProvider});
    @override
    Future<Either<ResponseError, SuccessResponse>> {{useCase.camelCase()}}() async{
       try {

       return Right(SuccessResponse());
       } on DioException catch (error) {
       ResponseError responseError =  ErrorHandling().handleDioError(error, "{{useCase.camelCase()}}");
       return Left(responseError);
       }
    }

}