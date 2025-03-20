import 'package:equatable/equatable.dart';
import '../../../../../core/error/response_error.dart';
abstract class GetUsersStatus extends Equatable{}

class GetUsersInit extends GetUsersStatus{
  @override
  List<Object?> get props => [];
}

class GetUsersLoading extends GetUsersStatus{
  @override
  List<Object?> get props => [];
}


class GetUsersCompleted extends GetUsersStatus{
  @override
  List<Object?> get props => [];
}

class GetUsersError extends GetUsersStatus{
  final ResponseError responseError;
  GetUsersError({required this.responseError});
  @override
  List<Object?> get props => [responseError];
}


