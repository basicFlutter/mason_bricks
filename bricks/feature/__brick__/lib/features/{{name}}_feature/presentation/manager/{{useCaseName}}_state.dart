part of '{{useCaseName}}_bloc.dart';


class {{useCaseName.pascalCase()}}State  {
  final {{eventName.pascalCase()}}Status {{eventName}}Status;
  const {{eventName.pascalCase()}}State({required  this.{{eventName}}Status});
    {{eventName.pascalCase()}}State copyWith({{{event.pascalCase()}}Status? new{{eventName.pascalCase()}}Status}){
    return {{useCaseName.pascalCase()}}State(
    {{eventName}}Status : new{{eventName.pascalCase()}}Status ?? {{eventName}}Status,
    );
  }
}