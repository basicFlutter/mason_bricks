import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
class {{name.pascalCase()}}RepositoryImpl extends {{name.pascalCase()}}Repository{

    @override
    Future<Either<ResponseError, SuccessResponse>> {{useCaseName}}(params) async{
       try {

       // return Right(SuccessResponse());
       } on DioException catch (error) {
       // ResponseError responseError =  ErrorHandling().handleDioError(error, {{useCaseName}},);
       // return Left(responseError);
       }
    }

}