import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '{{useCaseName}}_event.dart';
part '{{useCaseName}}_state.dart';

class {{name.PascalCase()}}Bloc extends Bloc<{{name.PascalCase()}}Event, {{name.PascalCase()}}State> {
  {{name.pascalCase()}}UseCase {{name}}UseCase;
  {{name.PascalCase()}}Bloc({required this.{{name}}UseCase}) : super({{name.PascalCase()}}State(
      {{event}}Status:
      {{event.pascalCase()}}Init(),
    )) {

    on<{{eventName.pascalCase()}}>((event, emit) async{



    });

  }
}
