import 'package:advicer/data/exceptions/exeptions.dart';
import 'package:advicer/data/network_core.dart';

import '../models/employee_model.dart';

abstract class EmployeeRemoteDatasource{
 Future<EmployeeModel>getEmployees();
}

class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDatasource{
 NetworkCore network;
 EmployeeRemoteDataSourceImpl({required this.network});
 

  @override
  Future<EmployeeModel> getEmployees()async {
    var response= await network.dio.get('https://demo.medxa.id:8443/simrs/pon/hr/employees/');
    if(response.statusCode==200){
      return EmployeeModel.fromJson(response.data);
    }else{
      throw ServerException();



    }

  }

}