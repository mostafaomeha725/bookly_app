import 'package:booklyapp1/Home/models/book_model/book_model.dart';
import 'package:booklyapp1/core/home/repo/Errors/Failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewsBooks();
  Future<Either<Failure, List<BookModel>>> fetchfeatureBooks();
  Future<Either<Failure, List<BookModel>>> fetchsimilarBooks(
      {required String category});
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      {required String category});
}
