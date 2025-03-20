import '../../../../library.dart';
import '../manager/user_bloc.dart';
import '../manager/status/get_users_status.dart';
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(getUsersUseCase: locator())..add(GetUsers()),
      child: Builder(
          builder: (context) {
            return  Scaffold(
            body: BlocBuilder<UserBloc , UserState>(
              builder: (context , state){
                 if(state.getUsersStatus is GetUsersLoading){
                    return CircularProgressIndicator();
                  }

                 if(state.getUsersStatus is GetUsersCompleted){
                  GetUsersCompleted getUsersCompleted = state.getUsersStatus as GetUsersCompleted;
                   return SizedBox();
                 }

                 if(state.getUsersStatus is GetUsersError){
                    GetUsersError getUsersError = state.getUsersStatus as GetUsersError;
                   return SizedBox();
                 }
                 return SizedBox();

              }),
            );
          }),
    );
  }
}
