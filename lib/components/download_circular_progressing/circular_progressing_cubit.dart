import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CircularPrCubit extends Cubit<CircularPrState> {
  CircularPrCubit() : super(CircularPrInit());

  Future<void> downLoad() async {
    for (var x = 0.0; x <= 10; x++) {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CircularPrPg(x));
    }
    emit(CircularPrSuccess());
  }
}

abstract class CircularPrState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CircularPrInit extends CircularPrState {}

class CircularPrPg extends CircularPrState {
  CircularPrPg(this.val);
  final double val;

  @override
  List<Object> get props => [val];
}

class CircularPrSuccess extends CircularPrState {}
