import '../../../../core/data/network/api_provider.dart';

class UserApiProvider {

  Future<dynamic> callGetUsersRoute() async{
    final res = await ApiProvider().get('/api/v1/project/get_suggestion_projects');
    return res ;
  }

}