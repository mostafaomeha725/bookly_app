import 'package:bloc/bloc.dart';
import 'package:booklyapp1/Home/models/book_model/book_model.dart';
import 'package:booklyapp1/core/home/repo/homerepo.dart';
import 'package:equatable/equatable.dart';

part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.homeRepo) : super(NewestBookInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewestBook() async {
    emit(NewestBookLoading());
    var data = await homeRepo.fetchNewsBooks();
    data.fold((failure) {
      emit(NewestBookFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(NewestBookSuccess(books: books));
    });
  }
}
