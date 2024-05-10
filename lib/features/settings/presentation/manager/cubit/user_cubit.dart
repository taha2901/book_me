import 'package:bloc/bloc.dart';
import 'package:finalabanob/core/helper/api.dart';
import 'package:finalabanob/core/widgets/custom_print_full_text_method.dart';
import 'package:finalabanob/core/widgets/network.dart';
import 'package:finalabanob/features/auth/data/auth_login/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  Auth? usersModel;

  void getUsersData() {
    emit(BooksLoadingUsersState());
    DioHelper().getData(url: PROFILE, token: 'Bearer $userToken').then((value) {
      print('sdfdslfldsf${usersModel!.data!.user!.email}');
      print('token in user cubit issssssss=> ${usersModel}');
      usersModel = Auth.fromJson(value.data);
      printFullText(
          'this is data data data data data ======>>>>>>> ${usersModel?.data?.user?.username}');
      emit(BooksSucessUsersState(userModel: usersModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(BooksErrorUsersState());
    });
  }
}
