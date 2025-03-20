import '../../../../library.dart';
import '../manager/{{name}}_bloc.dart';
import '../manager/status/{{useCase}}_status.dart';
class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => {{name.pascalCase()}}Bloc({{name.camelCase()}}Repository: locator())..add({{useCase.pascalCase()}}()),
      child: Builder(
          builder: (context) {
            return  Scaffold(
            body: BlocBuilder<{{name.pascalCase()}}Bloc , {{name.pascalCase()}}State>(
              builder: (context , state){
                 if(state.{{useCase.camelCase()}}Status is {{useCase.pascalCase()}}Loading){
                    return CircularProgressIndicator();
                  }

                 if(state.getUsersStatus is {{useCase.pascalCase()}}Completed){
                  {{useCase.pascalCase()}}Completed {{useCase.camelCase()}}Completed = state.{{useCase.camelCase()}}Status as {{useCase.pascalCase()}}Completed;
                   return SizedBox();
                 }

                 if(state.getUsersStatus is {{useCase.pascalCase()}}Error){
                    {{useCase.pascalCase()}}Error {{useCase.camelCase()}}Error = state.{{useCase.camelCase()}}Status as {{useCase.pascalCase()}}Error;
                   return SizedBox();
                 }
                 return SizedBox();

              }),
            );
          }),
    );
  }
}
