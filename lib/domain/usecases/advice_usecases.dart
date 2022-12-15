import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<Failure,AdviceEntity>> getAdvice() async {
    //call a repository to get data(failure or data)
    //proceed with bussiness logic(manipulate data)
    await Future.delayed(const Duration(seconds: 3), () {});

    //call repo success -> return data
    return right(const AdviceEntity(advice: 'advice test', id: 1));
    //call repo fail -> return failure
    return left(ServerFailure());
  }
}
