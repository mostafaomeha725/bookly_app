import 'package:booklyapp1/Feature/splash/presentation/Manger/SearchBookCubit/search_book_cubit.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/Cardbook.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/CustomTextField.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/FailureWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBookViewBody extends StatefulWidget {
  SearchBookViewBody({
    super.key,
  });
  String? category;
  @override
  State<SearchBookViewBody> createState() => _SearchBookViewBodyState();
}

class _SearchBookViewBodyState extends State<SearchBookViewBody> {
  void initState() {
    BlocProvider.of<SearchBookCubit>(context)
        .fetchSearchBook(category: widget.category ?? "programming");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBookCubit, SearchBookState>(
      listener: (context, state) {
        if (state is SearchBookFailure) {
          showsnakebar(context, 'Oops! Something went wrong.');
        }
      },
      builder: (context, state) {
        if (state is SearchBookSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  onsubmit: (data) {
                    widget.category = data;
                    setState(() {
                      BlocProvider.of<SearchBookCubit>(context)
                          .fetchSearchBook(category: widget.category!);
                    });
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Search Result",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                    child: CardBook(
                  bookModel: state.books,
                )),
              ],
            ),
          );
        } else if (state is SearchBookFailure) {
          return const FailureWidget();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void showsnakebar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
