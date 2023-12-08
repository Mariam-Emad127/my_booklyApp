import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/best_seller_list_view_item.dart';
 import 'package:my_bookly/Features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/widgets/custom_error_widget.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
        builder: (context, state) {
      if (state is NewsetBooksSuccess) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return BookListViewItem(
                bookModel: state.books[index],
              );
            },
          ),
        );
      } else if (state is NewsetBooksFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return CircularProgressIndicator();
      }
    });
  }
}
