import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/networking/api_result.dart';
import '../data/repo/trending_repo.dart';
import 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  final TrendingRepo _repo;

  TrendingCubit(this._repo) : super(TrendingInitial());

  Future<void> getTrendingCoins() async {
    emit(TrendingLoading());
    
    final result = await _repo.getTrendingCoins();

    switch (result) {
      case Success(data: var coins):
        emit(TrendingSuccess(coins));
      case Failure(error: var msg):
        emit(TrendingError(msg));
    }
  }
}