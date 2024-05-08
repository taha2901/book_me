import 'package:finalabanob/core/widgets/custom_field.dart';
import 'package:finalabanob/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:finalabanob/features/search/presentation/view/widgets/build_list_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      label: 'Search',
                      prefix: Icons.search,
                      onFieldSubmitted: (String text) {
                        SearchCubit.get(context).searchh(text);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter text to search';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (state is SearchLoadingStates)
                      const LinearProgressIndicator(),
                    if (state is SearchSuccessStates)
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              BuildListProductsToSearch(
                                  search: SearchCubit.get(context)
                                      .search!
                                      .data![index]),
                          itemCount:
                              SearchCubit.get(context).search!.data!.length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
