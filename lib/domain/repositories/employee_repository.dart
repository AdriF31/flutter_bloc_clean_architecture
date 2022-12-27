import 'package:advicer/domain/entities/employee_entity.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract class EmployeeRepository{
  Future<Either<Failure,EmployeeEntity>> getEmployeeFromDatasource();
}