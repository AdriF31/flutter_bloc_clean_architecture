import 'package:advicer/data/repositories/advice_repository_impl.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/advice_repository.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final adviceRepository = AdviceRepositoryImpl();
  Future<Either<Failure,AdviceEntity>> getAdvice() async {
    return adviceRepository.getAdviceFromDatasource();

  }
}
