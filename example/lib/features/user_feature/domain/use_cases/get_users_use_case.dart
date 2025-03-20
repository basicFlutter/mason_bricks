import 'package:dartz/dartz.dart';
import '../../../../core/error/response_error.dart';
import '../../../../core/success_response/success_response.dart';
import '../../../../core/use_case/base_usecase.dart';
import '../repositories/user_repository.dart';

class GetUsersUseCase extends BaseUseCase<SuccessResponse , void>{

  UserRepository userRepository;
  GetUsersUseCase({required this.userRepository });
  @override
  Future<Either<ResponseError, SuccessResponse>> call(void params)async{
    return await userRepository.getUsers();
  }
}