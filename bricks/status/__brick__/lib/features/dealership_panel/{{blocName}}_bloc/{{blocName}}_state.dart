part of '{{blocName}}_bloc.dart';


class {{blocName.pascalCase()}}State  {

  final {{event.pascalCase()}}Status {{event.camelCase()}}Status;

  const {{blocName.pascalCase()}}State({required  this.{{event.camelCase()}}Status});

    {{blocName.pascalCase()}}State copyWith({{{event.pascalCase()}}Status? new{{event.pascalCase()}}Status}){
    return {{blocName.pascalCase()}}State(
    {{event.camelCase()}}Status : new{{event.pascalCase()}}Status ?? {{event.camelCase()}}Status,
    );
  }
}