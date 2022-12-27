part of 'employee_bloc.dart';

@immutable
abstract class EmployeeEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmployeeRequestEvent extends EmployeeEvent{}