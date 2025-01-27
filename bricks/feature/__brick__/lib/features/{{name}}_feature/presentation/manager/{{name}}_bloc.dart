import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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

        Either<ResponseError , SuccessResponse> result = await getUsersUseCase(NoParams());

        result.fold((l){
           emit(state.copyWith(new{{useCase.pascalCase()}}Status: {{useCase.pascalCase()}}Error(responseError: l)));
        },(r){
           emit(state.copyWith(new{{useCase.pascalCase()}}Status: {{useCase.pascalCase()}}Completed()));
        });

    });

  }
}
