import 'package:advicer/data/datasources/advice_remote_datasource.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/advice_repository.dart';
import 'package:dartz/dartz.dart';

class AdviceRepositoryImpl implements AdviceRepository {
  final AdviceRemoteDatasource adviceRemoteDatasource =
      AdviceRemoteDataSourceImpl();

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
    return right(result);
  }
}
