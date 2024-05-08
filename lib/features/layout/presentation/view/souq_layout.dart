import 'package:finalabanob/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:finalabanob/features/search/data/search/search.dart';
import 'package:finalabanob/features/search/presentation/view/search.dart';
import 'package:finalabanob/features/settings/presentation/view/widget/custom_sign_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SouqLayout extends StatelessWidget {
  const SouqLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Salla'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    signOut(context);
                  },
                  icon: const Icon(Icons.logout_outlined     ),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
                items: cubit.bottomItem),
          );
        },
      ),
    );
  }
}
