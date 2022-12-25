import 'dart:io';

import 'package:advicer/data/datasources/advice_remote_datasource.dart';
import 'package:advicer/data/exceptions/exeptions.dart';
import 'package:advicer/data/models/advice_model.dart';
import 'package:advicer/data/repositories/advice_repository_impl.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDataSourceImpl>()])
void main() {
  group('AdviceRepoImpl', () {
    group('should return advice entity', () {
      test('when AdviceRemoteDataSource return AdviceModel', () async {
        final mockAdviceRemoteDatasource = MockAdviceRemoteDataSourceImpl();
        final adviceRepoImplUnderTest = AdviceRepositoryImpl(
            adviceRemoteDatasource: mockAdviceRemoteDatasource);

        when(mockAdviceRemoteDatasource.getRandomAdviceFromApi()).thenAnswer(
            (realInvocation) =>
                Future.value(AdviceModel(advice: 'test', id: 1)));
        final result = await adviceRepoImplUnderTest.getAdviceFromDatasource();
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result,
            Right<Failure, AdviceModel>(AdviceModel(id: 1, advice: 'test')));
        verify(mockAdviceRemoteDatasource.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mockAdviceRemoteDatasource);
      });
    });
    group('should return left with', () {
      test('a serverFailure when a ServerException occurs', () async {
        final mockAdviceRemoteDatasource = MockAdviceRemoteDataSourceImpl();
        final adviceRepoImplUnderTest = AdviceRepositoryImpl(
            adviceRemoteDatasource: mockAdviceRemoteDatasource);

        when(mockAdviceRemoteDatasource.getRandomAdviceFromApi())
            .thenThrow(ServerException());
        final result = await adviceRepoImplUnderTest.getAdviceFromDatasource();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
      });

      test('a serverFailure when a ServerException occurs', () async {
        final mockAdviceRemoteDatasource = MockAdviceRemoteDataSourceImpl();
        final adviceRepoImplUnderTest = AdviceRepositoryImpl(
            adviceRemoteDatasource: mockAdviceRemoteDatasource);

        when(mockAdviceRemoteDatasource.getRandomAdviceFromApi())
            .thenThrow(const SocketException('test'));
        final result = await adviceRepoImplUnderTest.getAdviceFromDatasource();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(GeneralFailure()));
      });
    });
  });
}
