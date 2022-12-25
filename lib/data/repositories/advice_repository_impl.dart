import 'package:advicer/data/datasources/advice_remote_datasource.dart';
import 'package:advicer/data/exceptions/exeptions.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/advice_repository.dart';
import 'package:dartz/dartz.dart';

class AdviceRepositoryImpl implements AdviceRepository {
  AdviceRepositoryImpl({required this.adviceRemoteDatasource});
  final AdviceRemoteDatasource adviceRemoteDatasource;

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();

      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
