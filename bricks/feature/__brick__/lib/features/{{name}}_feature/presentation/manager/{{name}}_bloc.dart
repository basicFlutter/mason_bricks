import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/response_error.dart';
import '../../../../core/success_response/success_response.dart';
import '../../presentation/manager/status/{{useCase}}_status.dart';
import '/../core/params/no_params.dart';
import '../../domain/repositories/{{name.camelCase()}}_repository.dart';

part '{{name}}_event.dart';
part '{{name}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Repository {{name.camelCase()}}Repository;
  {{name.pascalCase()}}Bloc({required this.{{name.camelCase()}}Repository}) : super({{name.pascalCase()}}State(
      {{useCase.camelCase()}}Status:
      {{useCase.pascalCase()}}Init(),
    )) {

    on<{{useCase.pascalCase()}}>((event, emit) async{

        emit(state.copyWith(new{{useCase.pascalCase()}}Status: {{useCase.pascalCase()}}Loading()));

        Either<ResponseError , SuccessResponse> result = await {{name.camelCase()}}Repository.{{useCase.camelCase()}}();

        result.fold((l){
           emit(state.copyWith(new{{useCase.pascalCase()}}Status: {{useCase.pascalCase()}}Error(responseError: l)));
        },(r){
           emit(state.copyWith(new{{useCase.pascalCase()}}Status: {{useCase.pascalCase()}}Completed()));
        });

    });

  }
}
