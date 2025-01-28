import 'package:equatable/equatable.dart';

abstract class {{event.pascalCase()}}Status extends Equatable{}

class {{event.pascalCase()}}Init extends {{event.pascalCase()}}Status{
  @override
  List<Object?> get props => [];
}

class {{event.pascalCase()}}Loading extends {{event.pascalCase()}}Status{
  @override
  List<Object?> get props => [];
}


class {{event.pascalCase()}}Completed extends {{event.pascalCase()}}Status{
  @override
  List<Object?> get props => [];
}

class {{event.pascalCase()}}Error extends {{event.pascalCase()}}Status{
  final String message;
{{event.pascalCase()}}Error({required this.message});
  @override
  List<Object?> get props => [message];
}


