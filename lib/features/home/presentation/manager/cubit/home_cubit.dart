import 'package:bloc/bloc.dart';
import 'package:finalabanob/features/home/data/book/book.dart';
import 'package:finalabanob/features/home/presentation/manager/cubit/home_state.dart';
import 'package:finalabanob/core/helper/api.dart';
import 'package:finalabanob/core/widgets/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  Book? book;
  void getHomeData() {
    emit(BooksLoadingState());
    DioHelper().getData(url: HOME).then((value) {
      book = Book.fromJson(value.data);
      emit(BooksSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(BooksErrorState(onError.toString()));
    });
  }

  // Auth? usersModel;
  // void getUsersData() {
  //   emit(BooksLoadingUsersState());
  //   DioHelper().getData(url: PROFILE, token: token).then((value) {
  //     print('sdfdslfldsf${usersModel!.data!.user!.email}');
  //     print('token in user cubit issssssss=> ${token}');
  //     usersModel = Auth.fromJson(value.data);
  //     printFullText(
  //         'this is data data data data data ======>>>>>>> ${usersModel?.data?.user?.username}');
  //     emit(BooksSucessUsersState(userModel: usersModel!));
  //   }).catchError((onError) {
  //     print(onError.toString());
  //     emit(BooksErrorUsersState());
  //   });
  // }
}

