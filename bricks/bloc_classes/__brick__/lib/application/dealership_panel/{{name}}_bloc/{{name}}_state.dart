part of '{{name}}_bloc.dart';

class {{name.pascalCase()}}State  {
  final {{event.pascalCase()}}Status {{event}}Status;
  const {{name.pascalCase()}}State({required  this.{{event}}Status});

  {{name.pascalCase()}}State copyWith({{{event.pascalCase()}}Status? new{{event.pascalCase()}}Status}){
    return {{name.pascalCase()}}State(
      {{event}}Status : new{{event.pascalCase()}}Status ?? {{event}}Status,
      );
  }
}

