part of 'topics_cubit.dart';

class TopicsState extends Equatable {
  const TopicsState({
    this.topics,
    this.stutus,
    this.fetchStatus = FetchStatus.initial,
  });

  final List<Topic>? topics;
  final String? stutus;
  final FetchStatus fetchStatus;

  @override
  List<Object?> get props => [fetchStatus, topics, stutus];

  TopicsState copyWith({
    List<Topic>? topics,
    String? stutus,
    FetchStatus? fetchStatus,
  }) {
    return TopicsState(
      topics: topics ?? this.topics,
      stutus: stutus ?? this.stutus,
      fetchStatus: fetchStatus ?? this.fetchStatus,
    );
  }
}
