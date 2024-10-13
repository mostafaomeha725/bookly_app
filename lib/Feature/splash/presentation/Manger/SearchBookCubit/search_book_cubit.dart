import 'package:bloc/bloc.dart';
import 'package:booklyapp1/Home/models/book_model/book_model.dart';
import 'package:booklyapp1/core/home/repo/homerepo.dart';
import 'package:equatable/equatable.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.homeRepo) : super(SearchBookInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSearchBook({required String category}) async {
    emit(SearchBookLoading());
    var data = await homeRepo.fetchSearchBooks(category: category);
    data.fold((failure) {
      emit(SearchBookFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(SearchBookSuccess(books: books));
    });
  }
}
