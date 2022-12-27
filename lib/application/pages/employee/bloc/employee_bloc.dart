import 'package:advicer/domain/entities/employee_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/usecases/employee_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/employee_model.dart';

part 'employee_event.dart';

part 'employee_state.dart';

const generalFailureMessage = 'Ups, something gone wrong. Please try again!';
const serverFailureMessage = 'Ups, API Error. please try again!';
const cacheFailureMessage = 'Ups, cache failed. Please try again!';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeUseCases employeeUseCase;

  EmployeeBloc({required this.employeeUseCase}) : super(EmployeeInitial()) {
    on<EmployeeRequestEvent>((event, emit) async {
      emit(EmployeeStateLoading());

      final failureOrEmployee = await employeeUseCase.getEmployee();

      failureOrEmployee.fold(
          (failure) =>
              emit(EmployeeStateError(message: _mapFailureToMessage(failure))),
          (employee) => emit(EmployeeStateLoaded(employee: employee)));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
