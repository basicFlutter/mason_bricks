part of '{{name}}_bloc.dart';


class {{name.pascalCase()}}State  {

  final {{useCase.pascalCase()}}Status {{useCase.camelCase()}}Status;

  const {{name.pascalCase()}}State({required  this.{{useCase.camelCase()}}Status});

    {{name.pascalCase()}}State copyWith({{{useCase.pascalCase()}}Status? new{{useCase.pascalCase()}}Status}){
    return {{name.pascalCase()}}State(
    {{useCase.camelCase()}}Status : new{{useCase.pascalCase()}}Status ?? {{useCase.camelCase()}}Status,
    );
  }
}