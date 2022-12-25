import 'dart:io';

import 'package:advicer/data/repositories/advice_repository_impl.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/usecases/advice_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_usecases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRepositoryImpl>()])
void main() {
  final mockAdviceRepositoryImpl = MockAdviceRepositoryImpl();
  final adviceUseCasesUnderTest =
      AdviceUseCases(adviceRepository: mockAdviceRepositoryImpl);

  group('AdviceUseCases', () {
    group('should return AdviceEntity', () {
      test('when AdviceRepositoryImpl return AdviceEntity', () async {
        when(mockAdviceRepositoryImpl.getAdviceFromDatasource()).thenAnswer(
            (realInvocation) =>
                Future.value(const Right(AdviceEntity(advice: 'test', id: 1))));

        final result = await adviceUseCasesUnderTest.getAdvice();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(
            result,
            const Right<Failure, AdviceEntity>(
                AdviceEntity(advice: 'test', id: 1)));
        verify(mockAdviceRepositoryImpl.getAdviceFromDatasource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepositoryImpl);
      });
    });

    group('should return left with', () {
      test('a ServerFailure', ()async {
        when(mockAdviceRepositoryImpl.getAdviceFromDatasource()).thenAnswer(
            (realInvocation) => Future.value(Left(ServerFailure())));

        final result = await adviceUseCasesUnderTest.getAdvice();

        expect(result.isRight(), false);
        expect(result.isLeft(), true);
        expect(result, Left<Failure,AdviceEntity>(ServerFailure()));
        verify(mockAdviceRepositoryImpl.getAdviceFromDatasource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepositoryImpl);
      });

      test('a GeneralFailure', ()async {
        when(mockAdviceRepositoryImpl.getAdviceFromDatasource()).thenAnswer(
                (realInvocation) => Future.value(Left(GeneralFailure())));

        final result = await adviceUseCasesUnderTest.getAdvice();

        expect(result.isRight(), false);
        expect(result.isLeft(), true);
        expect(result, Left<Failure,AdviceEntity>(GeneralFailure()));
        verify(mockAdviceRepositoryImpl.getAdviceFromDatasource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepositoryImpl);
      });
    });
  });
}
