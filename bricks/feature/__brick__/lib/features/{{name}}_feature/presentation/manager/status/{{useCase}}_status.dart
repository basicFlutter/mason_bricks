import 'package:equatable/equatable.dart';
import '../../../../../core/error/failures.dart';
abstract class {{useCase.pascalCase()}}Status extends Equatable{}

class {{useCase.pascalCase()}}Init extends {{useCase.pascalCase()}}Status{
  @override
  List<Object?> get props => [];
}

class {{useCase.pascalCase()}}Loading extends {{useCase.pascalCase()}}Status{
  @override
  List<Object?> get props => [];
}


class {{useCase.pascalCase()}}Completed extends {{useCase.pascalCase()}}Status{
  @override
  List<Object?> get props => [];
}

class {{useCase.pascalCase()}}Error extends {{useCase.pascalCase()}}Status{
  final Failure failure;
  {{useCase.pascalCase()}}Error({required this.failure});
  @override
  List<Object?> get props => [failure];
}


