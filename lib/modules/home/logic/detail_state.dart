part of 'detail_cubit.dart';

class DetailState extends Equatable {
  const DetailState(
    this.fetchStatus, {
    this.mdFile,
    this.status,
  });

  final FetchStatus fetchStatus;
  final String? mdFile;
  final String? status;

  @override
  List<Object?> get props => [fetchStatus, mdFile, status];

  DetailState copyWith({FetchStatus? fetchStatus, String? mdFile, String? status}) {
    return DetailState(
      fetchStatus ?? this.fetchStatus,
      mdFile: mdFile ?? this.mdFile,
      status: status ?? this.status,
    );
  }
}
