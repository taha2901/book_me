import 'package:bloc/bloc.dart';
import 'package:finalabanob/core/helper/api.dart';
import 'package:finalabanob/core/widgets/network.dart';
import 'package:finalabanob/features/auth/data/auth/auth.dart';
import 'package:finalabanob/features/auth/presentation/manager/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    Auth loginModel;
    emit(LoginLoaded());
    DioHelper().postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      loginModel = Auth.fromJson(value.data);
      print('token in login issss${loginModel.data!.token}');
      print(loginModel.toString());
      emit(LoginSuccess(loginModel));
    }).catchError((onError) {
      print(onError.toString());
      emit(LoginFailure(onError.toString()));
    });
  }

  bool isObsecure = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObsecure = !isObsecure;
    suffix =
        isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginchangePasswordVisibility());
  }
}
