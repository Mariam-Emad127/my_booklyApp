import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly/Features/home/presentation/manger/featured_books_cubit/FeaturedBooksCubit.dart';
import 'package:my_bookly/Features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'package:my_bookly/Features/home/presentation/view/home_view.dart';
import 'package:my_bookly/Features/splash_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/api_service.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/utils/service_locator.dart';
import 'constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
              ..fetchFeaturedBooks()),

//BlocProvider(create:  (context)=>FeaturedBooksCubit(HomeRepoImpl(ApiService(Dio())))),

        BlocProvider(
            create: (context) =>
                NewsetBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks())
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        //   home:HomeView (),
        //SplashView
      ),
    );
  }
}

/// The route configuration.
