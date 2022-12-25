import 'package:advicer/const/const_value.dart';
import 'package:advicer/data/datasources/advice_remote_datasource.dart';
import 'package:advicer/data/exceptions/exeptions.dart';
import 'package:advicer/data/models/advice_model.dart';
import 'package:advicer/data/network_core.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';



void main() {
  final network = NetworkCore();
  final dioAdapter = DioAdapter(dio:network.dio );
  network.dio.httpClientAdapter = dioAdapter;
  final AdviceRemoteDatasource adviceRemoteDatasourceUnderTest =
      AdviceRemoteDataSourceImpl(network: network);

  void setMockDioSuccess() async {
    dioAdapter.onGet(baseUrl, (server) {
      server.reply(
        200,
        {'advice_id': 1, 'advice': 'test advice'},
        delay: const Duration(seconds: 1),
      );
    });
  }

  group('AdviceRemoteDatasouce', () {
    group('should return AdviceModel', () {
      test('when client response are 200 and has valid data', () async {
        setMockDioSuccess();
        final result =
            await adviceRemoteDatasourceUnderTest.getRandomAdviceFromApi();
        expect(result, AdviceModel(id: 1, advice: 'test advice'));
      });
    });

    group('should throw', () {
      test('a serverException when client response was not 200', () {
        dioAdapter.onGet(baseUrl, (server) {
          server.reply(
            201,
            null,
            delay: const Duration(seconds: 1),
          );
        });
        final result = adviceRemoteDatasourceUnderTest.getRandomAdviceFromApi();
        expect(() => result, throwsA(isA<ServerException>()));
      });
      test(
          'a serverException when client response was 200 and has no valid data',
          () {
        dioAdapter.onGet(baseUrl, (server) {
          server.reply(
            200,
            {'advice': 'test advice'},
            delay: const Duration(seconds: 1),
          );
        });
        final result = adviceRemoteDatasourceUnderTest.getRandomAdviceFromApi();
        expect(() => result, throwsA(isA<TypeError>()));
      });
    });
  });
}
