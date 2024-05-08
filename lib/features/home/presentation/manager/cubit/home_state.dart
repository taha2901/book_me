
import 'package:flutter/material.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class BooksLoadingState extends HomeState {}

final class BooksSuccessState extends HomeState {}

final class BooksErrorState extends HomeState {
  final String error;

  BooksErrorState(this.error);
}