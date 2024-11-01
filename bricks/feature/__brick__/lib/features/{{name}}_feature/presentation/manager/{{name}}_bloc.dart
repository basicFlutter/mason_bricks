import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../presentation/manager/status/_status.dart';
import '../../domain/use_cases/{{useCase}}_use_case.dart';

part '{{name}}_event.dart';
part '{{name}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{useCase.pascalCase()}}UseCase {{useCase.camelCase()}}UseCase;
  {{name.pascalCase()}}Bloc({required this.{{useCase.camelCase()}}UseCase}) : super({{name.pascalCase()}}State(
      {{useCase.camelCase()}}Status:
      {{useCase.pascalCase()}}Init(),
    )) {

    on<{{useCase.pascalCase()}}>((event, emit) async{



    });

  }
}
