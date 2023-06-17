import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_world/core/core.dart';
import 'package:learn_world/models/models.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(
    this.fetchMdService,
    this.path,
    this.myLocale,
  ) : super(DetailState(FetchStatus.initial, myLocale));

  final FetchMdService fetchMdService;
  final String path;
  final MyLocale myLocale;

  Future<void> getData() async {
    emit(state.copyWith(fetchStatus: FetchStatus.loading));
    final (data, status) = await fetchMdService.getMDFile(path);
    if (data != null) return emit(state.copyWith(mdFile: data, status: status, fetchStatus: FetchStatus.success));
    return emit(state.copyWith(fetchStatus: FetchStatus.fail, status: status));
  }
}
