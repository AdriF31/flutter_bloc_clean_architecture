import 'package:advicer/const/const_value.dart';
import 'package:advicer/data/exceptions/exeptions.dart';
import 'package:advicer/data/models/advice_model.dart';
import 'package:advicer/data/network_core.dart';
import 'package:dio/dio.dart';

abstract class AdviceRemoteDatasource {
  /// request random advice from api
  /// return [AdviceModel] if success
  /// throws a server-exception if status code != 200
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSourceImpl implements AdviceRemoteDatasource {
  NetworkCore network;
  AdviceRemoteDataSourceImpl({required this.network});
  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {

     var response = await network.dio.get(baseUrl,
         options: Options(headers: {"content-type": "application/json"}));
     if(response.statusCode!=200){
       throw ServerException();
     }else{
       return AdviceModel.fromJson(response.data);
     }


  }
}
