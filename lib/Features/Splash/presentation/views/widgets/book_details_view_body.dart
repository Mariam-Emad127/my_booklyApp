import 'package:flutter/material.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/book_rating.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/books_action.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/books_details_sectioni.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/custom_book_item.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/custom_list_view.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/feature_list_view.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/similar_books_list_view.dart';
import 'package:my_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/core/utils/style.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              CustomBookDetailsAppBar(),
              BookDetailsSection(
                book: bookModel,
              ),
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              const SimilarBooksListview(),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
