import 'package:flutter/material.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/custom_book_item.dart';
import 'package:my_bookly/Features/home/presentation/manger/smila_books_cubit/smila_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/widgets/custom_error_widget.dart';
import 'package:my_bookly/core/widgets/custom_loading_indicator.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
  if (state is SimilarBooksSuccess) {

        return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
              itemCount: state.books.length,
              //state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(

                  imageUrl:state.books[index].volumeInfo.imageLinks?.thumbnail??""
                  )
                );
              }),
        );
  }else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      
      
      },
    );
  }
}
