import 'package:booklyapp1/Home/models/book_model/book_model.dart';
import 'package:booklyapp1/core/Services/ApiServices.dart';
import 'package:booklyapp1/core/home/repo/Errors/Failure.dart';
import 'package:booklyapp1/core/home/repo/homerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsBooks() async {
    try {
      var data = await apiServices.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Science');
      List<BookModel> book = [];
      for (var item in data['items']) {
        book.add(BookModel.fromJson(item));
      }
      return right(book);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchfeatureBooks() async {
    try {
      var data = await apiServices.get(
          endpoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
      List<BookModel> book = [];
      for (var item in data['items']) {
        book.add(BookModel.fromJson(item));
      }
      return right(book);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchsimilarBooks(
      {required String category}) async {
    try {
      var data = await apiServices.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:Programming');
      List<BookModel> book = [];
      for (var item in data['items']) {
        book.add(BookModel.fromJson(item));
      }
      return right(book);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      {required String category}) async {
    try {
      var data = await apiServices.get(
          endpoint: 'volumes?Filtering=free-ebooks&q=subject:$category');
      List<BookModel> book = [];
      for (var item in data['items']) {
        book.add(BookModel.fromJson(item));
      }
      return right(book);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
