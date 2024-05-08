import 'package:bloc/bloc.dart';
import 'package:finalabanob/core/helper/api.dart';
import 'package:finalabanob/core/widgets/custom_show_toast.dart';
import 'package:finalabanob/core/widgets/network.dart';
import 'package:finalabanob/features/search/data/search/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  Search? search;
  void searchh(String text) {
    emit(SearchLoadingStates());
    DioHelper().getData(url: SEARCH, query: {
      'keyword': text,
    }).then((value) {
      search = Search.fromJson(value.data);
      print('object${search!.success}');
      emit(SearchSuccessStates());
    }).catchError((onError) {
      print('This is Eror ${onError.toString()}');
      emit(SearchErrorStates());
    });
  }
}
