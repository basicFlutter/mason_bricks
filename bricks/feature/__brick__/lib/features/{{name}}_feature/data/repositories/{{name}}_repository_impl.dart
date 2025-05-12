import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/success_response/success_response.dart';
import '../../domain/repositories/{{name}}_repository.dart';
import '../data_sources/{{name}}_api_provider.dart';
import '../../../../core/error/failures.dart';
class {{name.pascalCase()}}RepositoryImpl extends {{name.pascalCase()}}Repository{
    {{name.pascalCase()}}ApiProvider {{name.camelCase()}}ApiProvider;
    {{name.pascalCase()}}RepositoryImpl({required this.{{name.camelCase()}}ApiProvider});
    @override
    Future<Either<Failure, SuccessResponse>> {{useCase.camelCase()}}() async{
       try {
       final response = await {{name.camelCase()}}ApiProvider.call{{useCase.pascalCase()}}Route();
       return Right(SuccessResponse());
       } on DioException catch (error) {
         Failure failure =  ErrorHandler.handleError(error);
        return Left(failure);
       }
    }

}
