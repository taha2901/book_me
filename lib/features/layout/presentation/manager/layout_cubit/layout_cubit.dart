import 'package:bloc/bloc.dart';
import 'package:finalabanob/features/category/presentation/view/category.dart';
import 'package:finalabanob/features/home/presentation/view/home.dart';
import 'package:finalabanob/features/settings/presentation/view/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const CategoryView(),
     SettingsView(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ShopBottomNavbar());
  }

  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.apps),
      label: 'Categories',
    ),
    // const BottomNavigationBarItem(
    //   icon: Icon(Icons.favorite),
    //   label: 'Favorite',
    // ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
}
