import 'package:bloc/bloc.dart';
import 'package:finalabanob/core/helper/api.dart';
import 'package:finalabanob/core/widgets/custom_print_full_text_method.dart';
import 'package:finalabanob/core/widgets/custom_show_toast.dart';
import 'package:finalabanob/core/widgets/network.dart';
import 'package:finalabanob/features/settings/data/profile/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  Profile? usersModel;

  void getUsersData() {
    emit(BooksLoadingUsersState());
    DioHelper().getData(url: PROFILE, token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MzdmYjRkZGUyMjIwNmExNGY3OTVmOSIsImlhdCI6MTcxNTM1NDUyNSwiZXhwIjoxNzE3OTQ2NTI1fQ.yGiFH07PoZ1NQ-pL6SpD3H4YvT4sQhw9VGi4ZSpIuLM').then((value) {
      print('sdfdslfldsf${usersModel!.data!.user!.email}');
      print('token in user cubit issssssss=> ${token}');
      usersModel = Profile.fromJson(value.data);
      printFullText(
          'this is data data data data data ======>>>>>>> ${usersModel!.data!.user!.username}');
      emit(BooksSucessUsersState(userModel: usersModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(BooksErrorUsersState());
    });
  }
}
