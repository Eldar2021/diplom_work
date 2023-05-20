import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_world/constants/constants.dart';
import 'package:learn_world/core/core.dart';
import 'package:learn_world/models/models.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.apiService) : super(const HomeState());

  final ApiService apiService;

  Future<void> getContents() async {
    emit(state.copyWith(fetchStatus: FetchStatus.loading));
    final (contents, status) = await apiService.getTypeList<Content>(
      ApiConst.main,
      fromJson: Content.fromJson,
    );
    if (contents == null) return emit(state.copyWith(fetchStatus: FetchStatus.fail, stutus: status));
    emit(state.copyWith(contents: contents, stutus: status, fetchStatus: FetchStatus.success));
  }
}
