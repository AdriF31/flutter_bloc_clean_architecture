part of 'employee_bloc.dart';

@immutable
abstract class EmployeeState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmployeeInitial extends EmployeeState {}

class EmployeeStateLoading extends EmployeeState {}

class EmployeeStateLoaded extends EmployeeState {
  final EmployeeEntity employee;

  EmployeeStateLoaded({required this.employee});

  @override
  // TODO: implement props
  List<Object?> get props => [employee];
}

class EmployeeStateError extends EmployeeState {
  final String message;
  EmployeeStateError({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
