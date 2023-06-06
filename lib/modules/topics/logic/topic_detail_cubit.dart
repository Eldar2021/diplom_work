import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_world/constants/constants.dart';
import 'package:learn_world/core/core.dart';

part 'topic_detail_state.dart';

class TopicDetailCubit extends Cubit<TopicDetailState> {
  TopicDetailCubit(this.apiService, this.id) : super(const TopicDetailState(FetchStatus.initial));

  final ApiService apiService;
  final String id;

  Future<void> getData() async {
    emit(state.copyWith(fetchStatus: FetchStatus.loading));
    final (data, status) = await apiService.getMDFile('${ApiConst.rocketBase}/$id');
    if (data != null) return emit(state.copyWith(mdFile: data, status: status, fetchStatus: FetchStatus.success));
    return emit(state.copyWith(fetchStatus: FetchStatus.fail, status: status));
  }
}
