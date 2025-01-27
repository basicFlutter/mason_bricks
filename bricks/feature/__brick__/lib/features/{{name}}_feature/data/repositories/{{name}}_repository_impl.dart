import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/error_handling.dart';
import '../../../../core/error/response_error.dart';
import '../../../../core/success_response/success_response.dart';
import '../../domain/repositories/{{name}}_repository.dart';
import '../data_sources/{{name}}_api_provider.dart';

class {{name.pascalCase()}}RepositoryImpl extends {{name.pascalCase()}}Repository{
    {{name.pascalCase()}}ApiProvider {{name.camelCase()}}ApiProvider;
    {{name.pascalCase()}}RepositoryImpl({required this.{{name.camelCase()}}ApiProvider});
    @override
    Future<Either<ResponseError, SuccessResponse>> {{useCase.camelCase()}}() async{
       try {
       final response = await {{name.camelCase()}}ApiProvider.call{{useCase.pascalCase()}}Route();
       return Right(SuccessResponse());
       } on DioException catch (error) {
       ResponseError responseError =  ErrorHandling().handleDioError(error, "{{useCase.camelCase()}}");
       return Left(responseError);
       }
    }

}
