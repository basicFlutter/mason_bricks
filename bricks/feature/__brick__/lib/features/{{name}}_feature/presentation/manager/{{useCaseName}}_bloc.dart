import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '{{useCaseName}}_event.dart';
part '{{useCaseName}}_state.dart';

class {{UseCaseName.PascalCase()}}Bloc extends Bloc<{{UseCaseName.PascalCase()}}Event, {{UseCaseName.PascalCase()}}State> {
  {{useCaseName.pascalCase()}}UseCase {{useCaseName}}UseCase;
  {{UseCaseName.PascalCase()}}Bloc({required this.{{useCaseName}}UseCase}) : super(UseCaseNamePascalCaseInitial()) {

    on<{{eventName.pascalCase()}}>((event, emit) async{



    });

  }
}
