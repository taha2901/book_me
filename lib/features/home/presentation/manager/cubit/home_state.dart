
import 'package:finalabanob/features/auth/data/auth_login/auth.dart';
import 'package:flutter/material.dart';

// @immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class BooksLoadingState extends HomeState {}

final class BooksSuccessState extends HomeState {}

final class BooksErrorState extends HomeState {
  final String error;

  BooksErrorState(this.error);
}

// final class BooksLoadingUsersState extends HomeState {}

// final class BooksSucessUsersState extends HomeState {
//   final Auth userModel;

//   BooksSucessUsersState({required this.userModel});
// }

// final class BooksErrorUsersState extends HomeState {}