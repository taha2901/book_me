import 'package:finalabanob/core/helper/api.dart';
import 'package:finalabanob/core/helper/cach.dart';
import 'package:finalabanob/core/widgets/onboarding.dart';
import 'package:finalabanob/features/auth/presentation/view/login.dart';
import 'package:finalabanob/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:finalabanob/features/settings/presentation/manager/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await ChachHelper.init();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  String? token = ChachHelper.getData(key: 'token');
  print('tokennnn in main is $token');

  Widget widget;
  bool? onBoarding = ChachHelper.getData(key: 'onBoarding');

  if (onBoarding != null) {
    if (token != null) {
      widget = Container();
    } else {
      widget = const LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }
  runApp(
      MyApp(startWidget: widget, token: token, savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {Key? key, required this.startWidget, this.token, this.savedThemeMode})
      : super(key: key);
  final Widget startWidget;
  final AdaptiveThemeMode? savedThemeMode;
  final String? token;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit()..getHomeData(),
          ),
          BlocProvider(
            create: (context) => UserCubit()..getUsersData(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          home: startWidget,
        ),
      ),
      debugShowFloatingThemeButton: true,
    );
  }
}
