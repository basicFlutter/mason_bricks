import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../core/navigation/app_navigation.dart';
GetIt locator = GetIt.instance;

serviceLocator() async {
  locator.registerLazySingleton<AppNavigator>(() => AppNavigator());

  locator.registerSingleton<Dio>(Dio());


  ///############################################## Repository #############################

  // locator.registerLazySingleton<AcceptRejectTaskRepository>(()=>AcceptRejectTaskRepositoryImpl(acceptRejectTaskApiProvider: locator()));


  ///############################################## UseCase #############################


  // locator.registerLazySingleton<GetWorkFlowDetailUseCase>(()=>GetWorkFlowDetailUseCase( workFlowRepository: locator()));




  ///############################################## Bloc #############################
  // locator.registerSingleton<ChatBloc>(ChatBloc(
  //     createRoomUseCase: locator(),
  //     getAllUserUseCase: locator(),
  //     getOnlineUserUseCase: locator(),
  //     getConversationUseCase: locator(),
  //     connectToWebsocketUseCase: locator(),
  //     getNotReadMessagesUseCase: locator()));
}
