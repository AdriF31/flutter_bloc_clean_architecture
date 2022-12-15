import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdviceRequestEvent>((event, emit) async {
      emit(AdvicerStateLoading());
      //execute bussiness logic
      //get an advice
      debugPrint("advice triggered");
      await Future.delayed(Duration(seconds: 3), () {});
      debugPrint('got the advice success');
      emit(AdvicerStateLoaded(advice: 'fake advice'));
      // emit(AdvicerStateError(message: 'error message'));
    });
  }
}
