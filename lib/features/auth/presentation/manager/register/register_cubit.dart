import 'package:bloc/bloc.dart';
import 'package:finalabanob/core/helper/api.dart';
import 'package:finalabanob/core/widgets/network.dart';
import 'package:finalabanob/features/auth/data/auth/auth.dart';
import 'package:finalabanob/features/auth/presentation/manager/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String username,
    required String email,
    required String password,
  }) {
    Auth registerModel;
    emit(RegisterLoaded());
    DioHelper().postData(
      url: REGISTER,
      data: {
        'username': username,
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      registerModel = Auth.fromJson(value.data);
      print(registerModel.toString());
      emit(RegisterSuccess(registerModel: registerModel));
    }).catchError((onError) {
      print(onError.toString());
      emit(RegisterFailure(onError.toString()));
    });
  }

  bool isObsecure = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObsecure = !isObsecure;
    suffix =
        isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterchangePasswordVisibility());
  }
}
