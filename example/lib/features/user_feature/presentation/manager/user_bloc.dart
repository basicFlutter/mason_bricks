import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/response_error.dart';
import '../../../../core/success_response/success_response.dart';
import '../../presentation/manager/status/get_users_status.dart';
import '../../domain/use_cases/get_users_use_case.dart';
import '/../core/params/no_params.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  GetUsersUseCase getUsersUseCase;
  UserBloc({required this.getUsersUseCase}) : super(UserState(
      getUsersStatus:
      GetUsersInit(),
    )) {

    on<GetUsers>((event, emit) async{

        emit(state.copyWith(newGetUsersStatus: GetUsersLoading()));

        Either<ResponseError , SuccessResponse> result = await getUsersUseCase(NoParams());

        result.fold((l){
           emit(state.copyWith(newGetUsersStatus: GetUsersError(responseError: l)));
        },(r){
           emit(state.copyWith(newGetUsersStatus: GetUsersCompleted()));
        });

    });

  }
}
