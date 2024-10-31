part of '{{useCaseName}}_bloc.dart';


class {{UseCaseName.pascalCase()}}State  {
  final {{eventName.pascalCase()}}Status {{event}}Status;
  const {{eventName.pascalCase()}}State({required  this.{{event}}Status});
    {{eventName.pascalCase()}}State copyWith({{{event.pascalCase()}}Status? new{{event.pascalCase()}}Status}){
    return {{UseCaseName.pascalCase()}}State(
    {{event}}Status : new{{event.pascalCase()}}Status ?? {{event}}Status,
    );
  }
}