part of 'detail_cubit.dart';

class DetailState extends Equatable {
  const DetailState(
    this.fetchStatus,
    this.myLocale, {
    this.mdFile,
    this.status,
  });

  final FetchStatus fetchStatus;
  final String? mdFile;
  final String? status;
  final MyLocale myLocale;

  @override
  List<Object?> get props => [fetchStatus, mdFile, status];

  DetailState copyWith({FetchStatus? fetchStatus, MyLocale? myLocale, String? mdFile, String? status}) {
    return DetailState(
      fetchStatus ?? this.fetchStatus,
      myLocale ?? this.myLocale,
      mdFile: mdFile ?? this.mdFile,
      status: status ?? this.status,
    );
  }
}
