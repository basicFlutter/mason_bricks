import 'package:dartz/dartz.dart';
import '../../../core/exceptions/response_error.dart';
import '../../../core/success_response/success_response.dart;

class {{useCaseName.pascalCase()}}UseCase extends BaseUseCase<SuccessResponse , params>{

  {{name.pascalCase()}}Repository {{name}}Repository;
  {{useCaseName.pascalCase()}}UseCase({required this.{{name}}Repository });
  @override
  Future<Either<ResponseError, SuccessResponse>> call(params params)async{
    return await {{name}}Repository.{{useCaseName}}(params);
  }
}