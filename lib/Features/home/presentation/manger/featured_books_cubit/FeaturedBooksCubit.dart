import 'package:bloc/bloc.dart';
import 'package:my_bookly/Features/home/data/models/book_model/book_model.dart';

import 'package:my_bookly/Features/home/data/repos/home_repo.dart';

 import 'package:equatable/equatable.dart';
part 'FeaturedBooksState.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) => emit(FeaturedBooksSuccess(books)));
  }
}
