part of 'user_bloc.dart';


class UserState  {

  final GetUsersStatus getUsersStatus;

  const UserState({required  this.getUsersStatus});

    UserState copyWith({GetUsersStatus? newGetUsersStatus}){
    return UserState(
    getUsersStatus : newGetUsersStatus ?? getUsersStatus,
    );
  }
}