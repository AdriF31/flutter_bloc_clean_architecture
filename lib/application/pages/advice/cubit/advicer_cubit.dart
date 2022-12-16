import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());

  void adviceRequestedEvent() async{
    emit(AdvicerStateLoading());
    //execute bussiness logic
    //get an advice
    debugPrint("advice triggered");
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint('got the advice success');
    emit(AdvicerStateLoaded(advice: 'fake advice'));
    // emit(AdvicerStateError(message: 'error message'));
  }
}
