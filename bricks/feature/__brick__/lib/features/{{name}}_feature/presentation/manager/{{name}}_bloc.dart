import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/success_response/success_response.dart';
import '../../presentation/manager/status/{{useCase}}_status.dart';
import '../../domain/use_cases/{{useCase}}_use_case.dart';
import '/../core/params/no_params.dart';

part '{{name}}_event.dart';
part '{{name}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{useCase.pascalCase()}}UseCase {{useCase.camelCase()}}UseCase;
  {{name.pascalCase()}}Bloc({required this.{{useCase.camelCase()}}UseCase}) : super({{name.pascalCase()}}State(
      {{useCase.camelCase()}}Status:
      {{useCase.pascalCase()}}Init(),
    )) {

    on<{{useCase.pascalCase()}}>((event, emit) async{

        emit(state.copyWith(new{{useCase.pascalCase()}}Status: {{useCase.pascalCase()}}Loading()));

        Either<Failure , SuccessResponse> result = await {{useCase.camelCase()}}UseCase(NoParams());

        result.fold((l){
           emit(state.copyWith(new{{useCase.pascalCase()}}Status: {{useCase.pascalCase()}}Error(failure: l)));
        },(r){
           emit(state.copyWith(new{{useCase.pascalCase()}}Status: {{useCase.pascalCase()}}Completed()));
        });

    });

  }
}
