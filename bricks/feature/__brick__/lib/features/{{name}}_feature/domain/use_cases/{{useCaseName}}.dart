import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/response_error.dart';
import '../../../../core/success_response/SuccessResponse.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repositories/{{name}}_repository.dart';

class {{useCaseName.pascalCase()}}UseCase extends BaseUseCase<SuccessResponse , void>{

  {{name.pascalCase()}}Repository {{name}}Repository;
  {{useCaseName.pascalCase()}}UseCase({required this.{{name}}Repository });
  @override
  Future<Either<ResponseError, SuccessResponse>> call(params params)async{
    return await {{name}}Repository.{{useCaseName.camelCase()}}(params);
  }
}