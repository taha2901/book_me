import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:finalabanob/core/widgets/custom_button.dart';
import 'package:finalabanob/core/widgets/custom_field.dart';
import 'package:finalabanob/features/settings/presentation/manager/cubit/user_cubit.dart';
import 'package:finalabanob/features/settings/presentation/manager/cubit/user_state.dart';
import 'package:finalabanob/features/settings/presentation/view/widget/custom_sign_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  // var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is BooksSucessUsersState) {
          nameController.text = state.userModel?.data?.user?.username ?? '';
          emailController.text = state.userModel?.data?.user?.email ?? '';
          // phoneController.text = state.userModel?.data?.user?.phone ?? '';
        }
      },
      builder: (context, state) {
        var model = UserCubit.get(context).profileData;

        // if (model != null) {
        //   nameController.text = '${model.data!.user!.username}';
        //   emailController.text = '${model.data!.user!.email}';
        // }
        return ConditionalBuilder(
          // condition: model != null,
          condition: state is BooksSucessUsersState,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (state is BooksLoadingUpdateState)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      controller: nameController,
                      label: 'Enter Name',
                      prefix: Icons.person,
                      type: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'name must be not empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      controller: emailController,
                      label: 'Enter Email',
                      prefix: Icons.mail,
                      type: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'email must be not empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // defaultFormField(
                    //   controller: phoneController,
                    //   label: 'Enter phone',
                    //   prefix: Icons.phone,
                    //   type: TextInputType.phone,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'phone must be not empty';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                            text: 'Update',
                            color: Colors.blue,
                            textcolor: Colors.white,
                            circular: 10.0,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                // UserCubit.get(context).updateUserData(
                                //   name: nameController.text,
                                //   email: emailController.text,
                                // );
                              }
                            },
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      text: 'Logout',
                      color: Colors.blue,
                      textcolor: Colors.white,
                      circular: 10,
                      onTap: () {
                        signOut(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
