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

  
  void updateUserData({
    required String name,
    required String email,
  }) {
    emit(BooksSucessUpdateState(loginModel: profileData!));
    DioHelper().putData(url: UPDATE_PROFILE, token: 'Bearer $userToken', data: {
      'name': name,
      'email': email,
    }).then((value) {
      profileData = Auth.fromJson(value.data);
      printFullText(
          'this is data data data data data ======>>>>>>> ${profileData!.data}');
      emit(BooksSucessUpdateState(loginModel: profileData!));
    }).catchError((onError) {
      print(onError.toString());
      emit(BooksErrorUpdateState());
    });
  }
}


