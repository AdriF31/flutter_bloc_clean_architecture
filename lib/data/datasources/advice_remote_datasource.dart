import 'package:advicer/const/const_value.dart';
import 'package:advicer/data/exeptions/exeptions.dart';
import 'package:advicer/data/models/advice_model.dart';
import 'package:dio/dio.dart';

abstract class AdviceRemoteDatasource {
  /// request random advice from api
  /// return [AdviceModel] if success
  /// throws a server-exception if status code != 200
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSourceImpl implements AdviceRemoteDatasource {
  Dio dio = Dio();

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
   try{
     var response = await dio.get(baseUrl,
         options: Options(headers: {"content-type": "application/json"}));
     return AdviceModel.fromJson(response.data);
   } on DioError catch(_){
     throw ServerExeption();
   }
  }
}
