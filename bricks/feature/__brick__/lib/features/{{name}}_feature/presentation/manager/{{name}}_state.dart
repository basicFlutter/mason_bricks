part of '{{name}}_bloc.dart';


class {{name.pascalCase()}}State  {

  final {{eventName.pascalCase()}}Status {{eventName.camelCase()}}Status;

  const {{name.pascalCase()}}State({required  this.{{eventName.camelCase()}}Status});

    {{name.pascalCase()}}State copyWith({{{event.pascalCase()}}Status? new{{eventName.pascalCase()}}Status}){
    return {{name.pascalCase()}}State(
    {{eventName.camelCase()}}Status : new{{eventName.pascalCase()}}Status ?? {{eventName.camelCase()}}Status,
    );
  }
}