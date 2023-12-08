import 'package:flutter/cupertino.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/book_rating.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/custom_book_item.dart';
import 'package:my_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/constant.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/utils/style.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: bookModel);
      },
      child: SizedBox(
          height: 125,
          child: Row(children: [
            CustomBookImage(
              imageUrl:bookModel.volumeInfo.imageLinks?.thumbnail?? ""
                   ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Style.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    bookModel.volumeInfo.authors![0],
                    style: Style.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Style.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      BookRating(rating: bookModel.volumeInfo.averageRating?.round() ??0,
                       count: bookModel.volumeInfo.ratingsCount ??0 ,
                          mainAxisAlignment: MainAxisAlignment.center,
                       )
                    ],
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
