import 'package:bloc/bloc.dart';
import 'package:booklyapp1/Home/models/book_model/book_model.dart';
import 'package:booklyapp1/core/home/repo/homerepo.dart';
import 'package:equatable/equatable.dart';

part 'feature_book_state.dart';

class FeatureBookCubit extends Cubit<FeatureBookState> {
  FeatureBookCubit(this.homeRepo) : super(FeatureBookInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeatureBook() async {
    emit(FeatureBookLoading());
    var data = await homeRepo.fetchfeatureBooks();
    data.fold((failure) {
      emit(FeatureBookFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(FeatureBookSuccess(books: books));
    });
  }
}
