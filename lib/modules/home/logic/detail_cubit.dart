import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_world/constants/constants.dart';

import 'package:learn_world/core/core.dart';
import 'package:learn_world/models/models.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(
    this.apiService,
    this.path,
    this.myLocale,
  ) : super(DetailState(FetchStatus.initial, myLocale));

  final ApiService apiService;
  final String path;
  final MyLocale myLocale;

  Future<void> getData() async {
    emit(state.copyWith(fetchStatus: FetchStatus.loading));
    final (data, status) = await apiService.getMDFile(
      '${ApiConst.eldarApiBase}/learn_world/data/${state.myLocale.locale.languageCode}/$path.md',
    );
    if (data != null) return emit(state.copyWith(mdFile: data, status: status, fetchStatus: FetchStatus.success));
    return emit(state.copyWith(fetchStatus: FetchStatus.fail, status: status));
  }
}
