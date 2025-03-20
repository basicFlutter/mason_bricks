import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../core/navigation/app_navigation.dart';
GetIt locator = GetIt.instance;

serviceLocator() async {
  locator.registerLazySingleton<AppNavigator>(() => AppNavigator());
  locator.registerSingleton<Dio>(Dio());

  ///############################################## API Provider #############################

 // locator.registerLazySingleton<UserApiProvider>(() => UserApiProvider());

  ///############################################## Repository #############################

  //locator.registerLazySingleton<UserRepository>(()=>UserRepositoryImp(userApiProvider: locator()));

  ///############################################## UseCase #############################

 // locator.registerLazySingleton<GetUserUseCase>(()=>GetUserUseCase( userRepository: locator()));

  ///############################################## Bloc #############################
  // locator.registerSingleton<ChatBloc>(ChatBloc(
  //     createRoomUseCase: locator(),
  //     getAllUserUseCase: locator(),
  //     getOnlineUserUseCase: locator(),
  //     getConversationUseCase: locator(),
  //     connectToWebsocketUseCase: locator(),
  //     getNotReadMessagesUseCase: locator()));
}
