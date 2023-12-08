import 'package:flutter/cupertino.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/best_seller_list_view.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/custom_app_bar.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/feature_list_view.dart';
import 'package:my_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/Features/home/presentation/manger/smila_books_cubit/smila_books_cubit.dart';

import '../../../../../core/utils/assests.dart';
import '../../../../../core/utils/style.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key,  });
 

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation slidingAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 30));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
  
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
//mainAxisAlignment: MainAxisAlignment.center,
      //    crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(),
        FeaturedBooksListView(),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Best Seller',
            style: Style.textStyle18,
          ),
        ),
        Expanded(child: BestSellerListView())
        //  BookListViewItem()
      ],
    );
  }
}
