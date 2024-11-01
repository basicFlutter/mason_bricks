part of '{{useCaseName}}_bloc.dart';

abstract class {{useCaseName.pascalCase()}}Event extends Equatable {}

class {{eventName.pascalCase()}} extends {{useCaseName.pascalCase()}}Event{
  @override
  List<Object?> get props => [];
}