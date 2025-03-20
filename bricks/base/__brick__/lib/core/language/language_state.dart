import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class LanguageState extends Equatable {
  final Locale currentLocale;
  final List<Locale> supportedLocales;
  final bool isLoading;

  const LanguageState({
    required this.currentLocale,
    required this.supportedLocales,
    this.isLoading = false,
  });

  factory LanguageState.initial() {
    return LanguageState(
      currentLocale: const Locale('fa'),
      supportedLocales: const [
        Locale('fa'),
        Locale('en'),
      ],
      isLoading: false,
    );
  }

  LanguageState copyWith({
    Locale? currentLocale,
    List<Locale>? supportedLocales,
    bool? isLoading,
  }) {
    return LanguageState(
      currentLocale: currentLocale ?? this.currentLocale,
      supportedLocales: supportedLocales ?? this.supportedLocales,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [currentLocale, supportedLocales, isLoading];
} 