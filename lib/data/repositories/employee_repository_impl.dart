import 'package:advicer/data/datasources/employee_remote_datasource.dart';
import 'package:advicer/data/network_core.dart';
import 'package:advicer/domain/entities/employee_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/employee_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../exceptions/exeptions.dart';

class EmployeeRepositoryImpl implements EmployeeRepository{
  EmployeeRepositoryImpl({required this.employeeRemoteDatasource});
  final EmployeeRemoteDatasource employeeRemoteDatasource;
  @override
  Future<Either<Failure, EmployeeEntity>> getEmployeeFromDatasource() async{
    try {
      final result = await employeeRemoteDatasource.getEmployees();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }



}