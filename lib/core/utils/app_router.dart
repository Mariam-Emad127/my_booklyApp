 import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/book_details_view.dart';
import 'package:my_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly/Features/home/presentation/manger/smila_books_cubit/smila_books_cubit.dart';
import 'package:my_bookly/Features/home/presentation/view/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/utils/service_locator.dart';
 

abstract class AppRouter {
  static const kBookDetailsView = '/bookDetailsView';
  static final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        }),
    GoRoute(
        path: kBookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(bookModel: state.extra as BookModel,),
          );
        }),
  ]);
}
