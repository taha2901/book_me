import 'package:finalabanob/core/helper/cach.dart';
import 'package:finalabanob/core/widgets/custom_button.dart';
import 'package:finalabanob/core/widgets/custom_show_toast.dart';
import 'package:finalabanob/core/widgets/custom_text_form_field.dart';
import 'package:finalabanob/core/widgets/network.dart';
import 'package:finalabanob/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:finalabanob/features/auth/presentation/manager/login/login_state.dart';
import 'package:finalabanob/features/auth/presentation/view/register.dart';
import 'package:finalabanob/features/layout/presentation/view/souq_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//     var emailController = TextEditingController();
//     var passWordController = TextEditingController();

//     return BlocProvider(
//       create: (context) => LoginCubit(),
//       child: BlocConsumer<LoginCubit, LoginState>(
//         listener: (context, state) {
//           if (state is LoginSuccess) {
//             if (state.loginModel.success == true) {
//               userToken = state.loginModel.data!.token;
//               ChachHelper.saveData(
//                       key: 'token', value: state.loginModel.data?.token)
//                   .then(
//                 (value) {
//                   Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => SouqLayout(
//                               name: '${state.loginModel.data!.user!.username}',
//                             )),
//                     (route) => false,
//                   );
//                 },
//               );
//               showToast(msg: 'success', state: ToastStates.SUCCESS);
//             } else {
//               showToast(msg: 'no', state: ToastStates.ERROR);
//             }
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             body: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Login',
//                         style: Theme.of(context).textTheme.headline4!.copyWith(
//                             // color: Colors.black,
//                             ),
//                       ),
//                       Text('Login now to browse our hot offers',
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall!
//                               .copyWith(color: Colors.grey)),
//                       const SizedBox(
//                         height: 30.0,
//                       ),
//                       CustomTextField(
//                         hint: 'Email Address',
//                         prefixIcon: const Icon(Icons.email_outlined),
//                         controller: emailController,
//                         onSubmitted: (value) {
//                           emailController.text = value;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 15.0,
//                       ),
//                       CustomTextField(
//                         hint: 'password',
//                         prefixIcon: const Icon(Icons.lock_outlined),
//                         obscure: LoginCubit.get(context).isObsecure,
//                         controller: passWordController,
//                         onSubmitted: (value) {
//                           passWordController.text = value;
//                         },
//                         suffixIcon: LoginCubit.get(context).suffix,
//                         suffixPressed: () {
//                           LoginCubit.get(context).changePasswordVisibility();
//                         },
//                       ),
//                       const SizedBox(
//                         height: 30.0,
//                       ),
//                       state is LoginLoaded
//                           ? const Center(
//                               child: CircularProgressIndicator(),
//                             )
//                           : CustomButton(
//                               text: 'LOGIN',
//                               color: Colors.blue,
//                               textcolor: Colors.white,
//                               circular: 10.0,
//                               onTap: () {
//                                 if (formKey.currentState!.validate()) {
//                                   LoginCubit.get(context).userLogin(
//                                       email: emailController.text,
//                                       password: passWordController.text);
//                                 }
//                               },
//                             ),
//                       const SizedBox(
//                         height: 15.0,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text('Don\'t have an account?'),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) {
//                                     return RegisterScreen();
//                                   },
//                                 ),
//                               );
//                             },
//                             child: const Text('Register'),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }




class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passWordController = TextEditingController();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            if (state.loginModel.success == true) {
              userToken = state.loginModel.data!.token;
              ChachHelper.saveData(key: 'token', value: state.loginModel.data?.token)
                  .then((value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SouqLayout(
                      name: '${state.loginModel.data!.user!.username}',
                    ),
                  ),
                  (route) => false,
                );
              });
              showToast(msg: 'success', state: ToastStates.SUCCESS);
            } 
          }
          else {
              showToast(msg: 'no', state: ToastStates.ERROR);
            }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: _buildLoginForm(context, formKey, emailController, passWordController, state),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, GlobalKey<FormState> formKey,
      TextEditingController emailController, TextEditingController passWordController, LoginState state) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: Theme.of(context).textTheme.headline4!.copyWith(),
          ),
          Text('Login now to browse our hot offers',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey)),
          const SizedBox(height: 30.0),
          CustomTextField(
            hint: 'Email Address',
            prefixIcon: const Icon(Icons.email_outlined),
            controller: emailController,
            onSubmitted: (value) {
              emailController.text = value;
            },
          ),
          const SizedBox(height: 15.0),
          CustomTextField(
            hint: 'password',
            prefixIcon: const Icon(Icons.lock_outlined),
            obscure: LoginCubit.get(context).isObsecure,
            controller: passWordController,
            onSubmitted: (value) {
              passWordController.text = value;
            },
            suffixIcon: LoginCubit.get(context).suffix,
            suffixPressed: () {
              LoginCubit.get(context).changePasswordVisibility();
            },
          ),
          const SizedBox(height: 30.0),
          state is LoginLoaded
              ? const Center(child: CircularProgressIndicator())
              : CustomButton(
                  text: 'LOGIN',
                  color: Colors.blue,
                  textcolor: Colors.white,
                  circular: 10.0,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      LoginCubit.get(context).userLogin(email: emailController.text, password: passWordController.text);
                    }
                  },
                ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return RegisterScreen();
                    }),
                  );
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
