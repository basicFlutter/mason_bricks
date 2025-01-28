import '../../../../library.dart';
import '../manager/{{name}}_bloc.dart.dart';
class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => {{name.pascalCase()}}Bloc({{useCase.camelCase()}}UseCase: locator()),
      child: Builder(
          builder: (context) {
            return SizedBox();
          }
      ),
    );
  }
}
