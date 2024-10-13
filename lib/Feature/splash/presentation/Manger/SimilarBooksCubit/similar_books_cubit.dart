import 'package:bloc/bloc.dart';
import 'package:booklyapp1/Home/models/book_model/book_model.dart';
import 'package:booklyapp1/core/home/repo/homerepo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarBook({required String category}) async {
    emit(SimilarBooksLoading());
    var data = await homeRepo.fetchsimilarBooks(category: category);
    data.fold((failure) {
      emit(SimilarBooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books: books));
    });
  }
}
