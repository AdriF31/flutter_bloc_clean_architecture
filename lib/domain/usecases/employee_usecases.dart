import 'package:dartz/dartz.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../entities/employee_entity.dart';
import '../failures/failures.dart';
import '../repositories/employee_repository.dart';

class EmployeeUseCases{
  EmployeeUseCases({required this.employeeRepository});
  final EmployeeRepository employeeRepository;
  // final PagingController<int, Items> pagingController =
  // PagingController(firstPageKey: 0);

  Future<Either<Failure,EmployeeEntity>> getEmployee() async {
    return employeeRepository.getEmployeeFromDatasource();
  }
  //
  // Future<void> _fetchPage(int pageKey) async {
  //   try {
  //     final newItems = await employeeRepository.getEmployeeFromDatasource();
  //
  //     final isLastPage = newItems!.items!.isEmpty;
  //     if (isLastPage) {
  //       pagingController.appendLastPage(newItems.items!);
  //     } else {
  //       final nextPageKey = pageKey + 1;
  //       pagingController.appendPage(newItems.items!, nextPageKey);
  //     }
  //   } catch (error) {
  //     pagingController.error = error;
  //   }
  // }
}