import 'package:finalabanob/core/helper/cach.dart';
import 'package:finalabanob/core/widgets/custom_button.dart';
import 'package:finalabanob/core/widgets/custom_show_toast.dart';
import 'package:finalabanob/core/widgets/custom_text_form_field.dart';
import 'package:finalabanob/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:finalabanob/features/auth/presentation/manager/register/register_state.dart';
import 'package:finalabanob/features/layout/presentation/view/souq_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            if (state.registerModel.success == true) {
              print(state.registerModel.success);
              print(state.registerModel.data!.token);
              print(state.registerModel.data!.user!.email);

              ChachHelper.saveData(
                      key: 'token', value: state.registerModel.data!.token)
                  .then(
                (value) {
                  String token = '${state.registerModel.data!.token}';
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const SouqLayout()
                    ),
                    (route) => false,
                  );
                },
              );
              showToast(msg: 'success', state: ToastStates.SUCCESS);
            } else {
              showToast(msg: 'no', state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                      Text('Register now to browse our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey)),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomTextField(
                        hint: 'username',
                        prefixIcon: const Icon(Icons.person),
                        controller: nameController,
                        onSubmitted: (value) {
                          nameController.text = value;
                        },
                        // type: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomTextField(
                        hint: 'Email Address',
                        prefixIcon: const Icon(Icons.email_outlined),
                        controller: emailController,
                        onSubmitted: (value) {
                          emailController.text = value;
                        },
                        // type: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomTextField(
                        hint: 'password',
                        prefixIcon: const Icon(Icons.lock_outlined),
                        obscure: RegisterCubit.get(context).isObsecure,
                        controller: passWordController,
                        onSubmitted: (value) {
                          passWordController.text = value;
                        },
                        suffixIcon: RegisterCubit.get(context).suffix,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      state is RegisterLoaded
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              text: 'Register',
                              color: Colors.blue,
                              textcolor: Colors.white,
                              circular: 10.0,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                      username: nameController.text,
                                      email: emailController.text,
                                      password: passWordController.text);
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
