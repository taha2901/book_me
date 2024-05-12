import 'package:finalabanob/features/auth/data/auth/auth.dart';
import 'package:finalabanob/features/settings/presentation/manager/cubit/user_state.dart';
import 'package:bloc/bloc.dart';
import 'package:finalabanob/core/helper/api.dart';
import 'package:finalabanob/core/widgets/custom_print_full_text_method.dart';
import 'package:finalabanob/core/widgets/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  Auth? profileData;

  void getUsersData() {
    DioHelper().getData(url: PROFILE, token: 'Bearer $userToken').then((value) {
      profileData = Auth.fromJson(value.data);
      emit(BooksSucessUsersState(userModel: profileData!));
      print('State in user cubit issssssss=> ${profileData!.success}');
      printFullText(
          'this is data data data data data ======>>>>>>> ${profileData?.data?.user?.username}');
    }).catchError((onError) {
      print(onError.toString());
      emit(BooksErrorUsersState(errMessage: onError.toString()));
    });
  }

  Auth? profileUpdateData;
  void updateUserData({
    required String name,
    required String email,
  }) {
    emit(BooksLoadingUpdateState());
    DioHelper().putData(url: UPDATE_PROFILE, token: 'Bearer $userToken', data: {
      'username': name,
      'email': email,
    }).then((value) {
      profileUpdateData = Auth.fromJson(value.data);
      emit(BooksSucessUpdateState(loginModel: profileUpdateData!));
    }).catchError((onError) {
      print(onError.toString());
      emit(BooksErrorUpdateState());
    });
  }
}


