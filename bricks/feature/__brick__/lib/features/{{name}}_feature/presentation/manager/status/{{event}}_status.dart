import 'package:equatable/equatable.dart';

abstract class {{eventName.pascalCase()}}Status extends Equatable{}

class {{eventName.pascalCase()}}Init extends {{eventName.pascalCase()}}Status{
  @override
  List<Object?> get props => [];
}

class {{eventName.pascalCase()}}Loading extends {{eventName.pascalCase()}}Status{
  @override
  List<Object?> get props => [];
}


class {{eventName.pascalCase()}}Completed extends {{eventName.pascalCase()}}Status{
  @override
  List<Object?> get props => [];
}

class {{eventName.pascalCase()}}Error extends {{eventName.pascalCase()}}Status{
  final String message;
  {{eventName.pascalCase()}}Error({required this.message});
  @override
  List<Object?> get props => [message];
}


