import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:my_bookly/Features/search/presentation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}
