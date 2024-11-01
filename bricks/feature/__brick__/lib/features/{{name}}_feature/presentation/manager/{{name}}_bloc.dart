import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '{{name}}_event.dart';
part '{{name}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{useCaseName.pascalCase()}}UseCase {{useCaseName.camelCase()}}UseCase;
  {{name.pascalCase()}}Bloc({required this.{{useCaseName.camelCase()}}UseCase}) : super({{name.pascalCase()}}State(
      {{eventName.camelCase()}}Status:
      {{eventName.pascalCase()}}Init(),
    )) {

    on<{{eventName.pascalCase()}}>((event, emit) async{



    });

  }
}
