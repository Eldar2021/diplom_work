import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_world/constants/constants.dart';
import 'package:learn_world/core/core.dart';
import 'package:learn_world/models/models.dart';

part 'topics_state.dart';

class TopicsCubit extends Cubit<TopicsState> {
  TopicsCubit(this.apiService) : super(const TopicsState());

  final ApiService apiService;

  Future<void> getTopics() async {
    emit(state.copyWith(fetchStatus: FetchStatus.loading));
    final (topics, status) = await apiService.getTypeList<Topic>(
      ApiConst.topics,
      fromJson: Topic.fromJson,
    );
    if (topics == null) return emit(state.copyWith(fetchStatus: FetchStatus.fail, stutus: status));
    emit(state.copyWith(topics: topics, stutus: status, fetchStatus: FetchStatus.success));
  }

  // void changeLocale(MyLocale myLocale) {
  //   emit(state.copyWith(myLocale: myLocale));
  // }
}
