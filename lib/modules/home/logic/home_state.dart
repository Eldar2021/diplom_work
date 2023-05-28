part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.contents,
    this.stutus,
    this.fetchStatus = FetchStatus.initial,
    this.myLocale = MyLocale.en,
  });

  final List<Content>? contents;
  final String? stutus;
  final FetchStatus fetchStatus;
  final MyLocale myLocale;

  @override
  List<Object?> get props => [fetchStatus, myLocale, stutus, contents];

  HomeState copyWith({
    List<Content>? contents,
    String? stutus,
    FetchStatus? fetchStatus,
    MyLocale? myLocale,
  }) {
    return HomeState(
      contents: contents ?? this.contents,
      stutus: stutus ?? this.stutus,
      fetchStatus: fetchStatus ?? this.fetchStatus,
      myLocale: myLocale ?? this.myLocale,
    );
  }
}
