part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}


final class BooksLoadingUsersState extends UserState {}

final class BooksSucessUsersState extends UserState {
  final Profile userModel;

  BooksSucessUsersState({required this.userModel});
}

final class BooksErrorUsersState extends UserState {}


// final class BooksLoadingUpdateState extends UserState {}

// final class BooksSucessUpdateState extends UserState {
//   final Auth loginModel;

//   BooksSucessUpdateState({required this.loginModel});
// }

// final class BooksErrorUpdateState extends UserState {}