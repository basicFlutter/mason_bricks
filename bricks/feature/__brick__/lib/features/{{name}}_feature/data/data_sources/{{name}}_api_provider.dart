import '../../../../core/data/network/api_provider.dart';

class {{name.pascalCase()}}ApiProvider {

  Future<dynamic> call{{useCase.pascalCase()}}Route() async{
    final res = await ApiProvider().get('/api/v1/project/get_suggestion_projects');
    return res ;
  }

}