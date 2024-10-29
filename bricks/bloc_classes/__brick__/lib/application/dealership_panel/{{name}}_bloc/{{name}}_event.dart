part of '{{name}}_bloc.dart';

abstract class {{name.pascalCase()}}Event extends Equatable {}

class {{event.pascalCase()}} extends {{name.pascalCase()}}Event{

 @override
 List<Object?> get props => [];
}