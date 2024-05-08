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
    DioHelper().getData(url: PROFILE, token: token).then((value) {
      emit(BooksLoadingUsersState());
      print('sdfdslfldsf${usersModel!.data!.user!.email}');
      // print('token in user cubit issssssss=> ${token}')
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
