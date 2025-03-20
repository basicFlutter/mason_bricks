import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object?> get props => [];
}

class ChangeLanguage extends LanguageEvent {
  final Locale locale;

  const ChangeLanguage(this.locale);

  @override
  List<Object?> get props => [locale];
}

class AddSupportedLocale extends LanguageEvent {
  final Locale locale;

  const AddSupportedLocale(this.locale);

  @override
  List<Object?> get props => [locale];
}

class RemoveSupportedLocale extends LanguageEvent {
  final Locale locale;

  const RemoveSupportedLocale(this.locale);

  @override
  List<Object?> get props => [locale];
} 