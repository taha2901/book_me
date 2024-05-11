
import 'package:finalabanob/features/auth/data/auth/auth.dart';

sealed class UserState {}

final class UserInitial extends UserState {}


final class BooksLoadingUsersState extends UserState {}

final class BooksSucessUsersState extends UserState {
  final Auth? userModel;

  BooksSucessUsersState({ this.userModel});
}

final class BooksErrorUsersState extends UserState {
  final String? errMessage;

  BooksErrorUsersState({required this.errMessage});
}


final class BooksLoadingUpdateState extends UserState {}

final class BooksSucessUpdateState extends UserState {
  final Auth loginModel;

  BooksSucessUpdateState({required this.loginModel});
}

final class BooksErrorUpdateState extends UserState {}