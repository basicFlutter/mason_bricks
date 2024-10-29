import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hillz_customer_sites/application/dealership_panel/{{name}}_bloc/status/{{event}}_status.dart';
part '{{name}}_event.dart';
part '{{name}}_state.dart';



class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc() : super({{name.pascalCase()}}State(
  {{event}}Status:
    {{event.pascalCase()}}Init(),
   ));
  @override
  Stream<{{name.pascalCase()}}State> mapEventToState({{name.pascalCase()}}Event event)async*{
    if(event is {{event.pascalCase()}}){

    }
  }
}
