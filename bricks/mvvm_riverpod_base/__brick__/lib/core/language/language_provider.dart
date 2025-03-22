import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_provider.g.dart';

@riverpod
class Language extends _$Language {
  @override
  Locale build() => const Locale('fa');

  void changeLanguage(String languageCode) {
    state = Locale(languageCode);
  }
}

final currentLocaleProvider = Provider<Locale>((ref) {
  return ref.watch(languageProvider);
}); 