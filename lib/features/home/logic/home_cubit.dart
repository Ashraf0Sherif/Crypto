import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeInitial());

  Future<void> getCoinsMarkets() async {
    emit(HomeLoading());
    final result = await _homeRepo.getCoinsMarkets();
    switch (result) {
      case Success(data: var coins):
        emit(HomeSuccess(coins));
      case Failure(error: var msg):
        emit(HomeError(msg));
    }
  }
}
