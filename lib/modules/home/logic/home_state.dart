part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.contents,
    this.stutus,
    this.fetchStatus = FetchStatus.initial,
  });

  final List<Content>? contents;
  final String? stutus;
  final FetchStatus fetchStatus;

  @override
  List<Object?> get props => [fetchStatus, stutus, contents];

  HomeState copyWith({
    List<Content>? contents,
    String? stutus,
    FetchStatus? fetchStatus,
  }) {
    return HomeState(
      contents: contents ?? this.contents,
      stutus: stutus ?? this.stutus,
      fetchStatus: fetchStatus ?? this.fetchStatus,
    );
  }
}
