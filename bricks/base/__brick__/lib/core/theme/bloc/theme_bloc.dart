import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ToggleTheme>((event, emit) {
      final currentState = state;
      if (currentState is ThemeInitial) {
        emit(ThemeChanged(!currentState.isDark));
      } else if (currentState is ThemeChanged) {
        emit(ThemeChanged(!currentState.isDark));
      }
    });

    on<SetTheme>((event, emit) {
      emit(ThemeChanged(event.isDark));
    });
  }
} 