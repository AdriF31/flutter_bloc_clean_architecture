import 'package:advicer/application/pages/advice/bloc/advicer_bloc.dart';
import 'package:advicer/application/pages/employee/bloc/employee_bloc.dart';
import 'package:advicer/data/datasources/advice_remote_datasource.dart';
import 'package:advicer/data/network_core.dart';
import 'package:advicer/data/repositories/advice_repository_impl.dart';
import 'package:advicer/domain/repositories/advice_repository.dart';
import 'package:advicer/domain/usecases/advice_usecases.dart';
import 'package:advicer/domain/usecases/employee_usecases.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/employee_remote_datasource.dart';
import '../data/repositories/employee_repository_impl.dart';
import '../domain/repositories/employee_repository.dart';

final sl = GetIt.I;

Future<void> init() async {
  //application layer
  sl.registerFactory(() => AdvicerBloc(adviceUseCases: sl()));
  sl.registerFactory(() => EmployeeBloc(employeeUseCase: sl()));

  //domain
  sl.registerFactory(() => AdviceUseCases(adviceRepository: sl()));
  sl.registerFactory(() => EmployeeUseCases(employeeRepository: sl()));

  //data layer
  sl.registerFactory<AdviceRepository>(
      () => AdviceRepositoryImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDataSourceImpl(network: sl()));
  sl.registerFactory<EmployeeRepository>(
      () => EmployeeRepositoryImpl(employeeRemoteDatasource: sl()));
  sl.registerFactory<EmployeeRemoteDatasource>(
      () => EmployeeRemoteDataSourceImpl(network: sl()));

  //extern
  sl.registerFactory(() => NetworkCore());
}
