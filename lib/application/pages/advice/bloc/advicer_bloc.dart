import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/usecases/advice_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'advicer_event.dart';

part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    final AdviceUseCases adviceUseCases = AdviceUseCases();
    on<AdviceRequestEvent>((event, emit) async {
      emit(AdvicerStateLoading());
      //execute bussiness logic
      //get an advice

      final failureOrAdvice = await adviceUseCases.getAdvice();

      failureOrAdvice.fold(
          (failure) =>
              emit(AdvicerStateError(message: _mapFailureToMessage(failure))),
          (advice) => emit(AdvicerStateLoaded(advice: advice.advice)));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "server error";
      case CacheFailure:
        return "cache fail";
      default:
        return "General Failure";
    }
  }
}
