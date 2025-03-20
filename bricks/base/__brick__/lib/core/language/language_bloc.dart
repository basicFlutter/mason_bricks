import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../secure_storage/secure_storage.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final _storage = SecureStorage();
  static const String _languageKey = 'selected_language';

  LanguageBloc() : super(LanguageState.initial()) {
    on<ChangeLanguage>(_onChangeLanguage);
    on<AddSupportedLocale>(_onAddSupportedLocale);
    on<RemoveSupportedLocale>(_onRemoveSupportedLocale);

    // Load saved language on initialization
    _initializeLanguage();
  }

  Future<void> _initializeLanguage() async {
    try {
      final savedLanguage = await _storage.read(_languageKey);
      if (savedLanguage != null) {
        add(ChangeLanguage(Locale(savedLanguage)));
      }
    } catch (e) {
      // در صورت خطا در خواندن زبان، از زبان پیش‌فرض استفاده می‌شود
    }
  }

  Future<void> _onChangeLanguage(
    ChangeLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    if (!state.supportedLocales.contains(event.locale)) {
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      await _storage.write(_languageKey, event.locale.languageCode);
      emit(state.copyWith(
        currentLocale: event.locale,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onAddSupportedLocale(
    AddSupportedLocale event,
    Emitter<LanguageState> emit,
  ) {
    if (state.supportedLocales.contains(event.locale)) {
      return;
    }

    final updatedLocales = List<Locale>.from(state.supportedLocales)
      ..add(event.locale);
    emit(state.copyWith(supportedLocales: updatedLocales));
  }

  void _onRemoveSupportedLocale(
    RemoveSupportedLocale event,
    Emitter<LanguageState> emit,
  ) {
    if (event.locale == state.currentLocale ||
        !state.supportedLocales.contains(event.locale)) {
      return;
    }

    final updatedLocales = List<Locale>.from(state.supportedLocales)
      ..remove(event.locale);
    emit(state.copyWith(supportedLocales: updatedLocales));
  }
} 