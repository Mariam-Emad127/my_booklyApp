import 'package:flutter/cupertino.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/best_seller_list_view.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/custom_app_bar.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/feature_list_view.dart';
import 'package:my_bookly/core/utils/style.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomAppBar(),
              FeaturedBooksListView(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Seller',
                  style: Style.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BestSellerListView(),
        )
      ],
    );
  }
}
