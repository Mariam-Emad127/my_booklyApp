import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/custom_book_item.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/custom_list_view.dart';
import 'package:my_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/Features/home/presentation/manger/featured_books_cubit/FeaturedBooksCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/widgets/custom_error_widget.dart';
import 'package:my_bookly/core/widgets/custom_loading_indicator.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assests.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: (){
                          GoRouter.of(context).push(AppRouter.kBookDetailsView,extra:state.books[index] );},
                        
                        child: CustomBookImage(imageUrl:state.books[index].volumeInfo.imageLinks?.thumbnail??"",)),
                    );
                  }));
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CircularProgressIndicator();
        }
      },
    );

 
  }
}
