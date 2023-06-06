part of 'topic_detail_cubit.dart';

class TopicDetailState extends Equatable {
  const TopicDetailState(
    this.fetchStatus, {
    this.mdFile,
    this.status,
  });

  final FetchStatus fetchStatus;
  final String? mdFile;
  final String? status;

  @override
  List<Object?> get props => [fetchStatus, mdFile, status];

  TopicDetailState copyWith({FetchStatus? fetchStatus, String? mdFile, String? status}) {
    return TopicDetailState(
      fetchStatus ?? this.fetchStatus,
      mdFile: mdFile ?? this.mdFile,
      status: status ?? this.status,
    );
  }
}
