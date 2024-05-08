import 'package:bloc/bloc.dart';
import 'package:finalabanob/features/home/data/boob_model.dart';
import 'package:finalabanob/features/home/presentation/manager/cubit/home_state.dart';
import 'package:finalabanob/core/helper/api.dart';
import 'package:finalabanob/core/widgets/custom_print_full_text_method.dart';
import 'package:finalabanob/core/widgets/custom_show_toast.dart';
import 'package:finalabanob/core/widgets/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  BooksModel? book;
  void getHomeData() {
    emit(BooksLoadingState());
    DioHelper().getData(url: HOME).then((value) {
      book = BooksModel.fromJson(value.data);
      emit(BooksSuccessState());
      // printFullText('${book!.data}');
      // print('total is ${book!.pagination!.total}');
    }).catchError((onError) {
      print(onError.toString());
      emit(BooksErrorState(onError.toString()));
    });
  }
}
