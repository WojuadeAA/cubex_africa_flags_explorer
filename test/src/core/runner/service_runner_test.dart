import 'dart:io';

import 'package:cubex_africa_flags_explorer/src/core/runner/failure.dart';
import 'package:cubex_africa_flags_explorer/src/core/runner/service_runner.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

// Import your service runner
// import 'package:cubex_africa_flags_explorer/src/core/runner/service_runner.dart';
// import 'package:cubex_africa_flags_explorer/src/core/runner/failure.dart';

// Mock classes
class MockFailure extends Mock implements Failure {}

void main() {
  late ServiceRunner<Failure, String> serviceRunner;
  const testName = 'Test Service';

  setUp(() {
    serviceRunner = ServiceRunner<Failure, String>();
  });

  group('ServiceRunner', () {
    test('should return Right with successful data', () async {
      // Arrange
      const expectedData = 'Success data';
      final call = Future.value(expectedData);

      // Act
      final result = await serviceRunner.run(
        call: call,
        name: testName,
      );

      // Assert
      expect(result, const Right<Failure, String>(expectedData));
    });

    test('should return Left with InternetFailure on HandshakeException', () async {
      // Arrange
      final call = Future<String>.error(
        const HandshakeException('Handshake error message'),
      );

      // Act
      final result = await serviceRunner.run(
        call: call,
        name: testName,
      );

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<InternetFailure>());
          expect((failure as InternetFailure).title, '$testName : No Internet access');
          expect(failure.message, 'Handshake error message');
        },
        (_) => fail('Should not return Right'),
      );
    });

    test('should return Left with InternetFailure on SocketException', () async {
      // Arrange
      final call = Future<String>.error(
        const SocketException('Socket error message'),
      );

      // Act
      final result = await serviceRunner.run(
        call: call,
        name: testName,
      );

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<InternetFailure>());
          expect((failure as InternetFailure).title, '$testName : No Internet access');
          expect(failure.message, 'Socket error message');
        },
        (_) => fail('Should not return Right'),
      );
    });

    test('should return Left with InternetFailure on FormatException', () async {
      // Arrange
      final call = Future<String>.error(
        const FormatException('Format error message'),
      );

      // Act
      final result = await serviceRunner.run(
        call: call,
        name: testName,
      );

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<InternetFailure>());
          expect((failure as InternetFailure).title, testName);
          expect(failure.message, 'Format error message');
        },
        (_) => fail('Should not return Right'),
      );
    });

    test('should return Left with CommonFailure on DioException with null response data', () async {
      // Arrange
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          data: null,
        ),
      );
      final call = Future<String>.error(dioException);

      // Act
      final result = await serviceRunner.run(
        call: call,
        name: testName,
      );

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<CommonFailure>());
          expect((failure as CommonFailure).title, 'DioError: $testName');
          expect(failure.message, 'Network Error');
        },
        (_) => fail('Should not return Right'),
      );
    });

    test('should return Left with CommonFailure on DioException with response data', () async {
      // Arrange
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          data: {'message': 'API error message'},
        ),
      );
      final call = Future<String>.error(dioException);

      // Act
      final result = await serviceRunner.run(
        call: call,
        name: testName,
      );

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<CommonFailure>());
          expect((failure as CommonFailure).title, 'DioError: $testName');
          expect(failure.message, 'API error message');
        },
        (_) => fail('Should not return Right'),
      );
    });

    test('should return Left with CommonFailure on general Exception', () async {
      // Arrange
      final call = Future<String>.error(Exception('General error'));

      // Act
      final result = await serviceRunner.run(
        call: call,
        name: testName,
      );

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<CommonFailure>());
          expect((failure as CommonFailure).title, testName);
          expect(failure.message, ' General error');
        },
        (_) => fail('Should not return Right'),
      );
    });

    test('should throw TimeoutException when call times out', () async {
      // Arrange
      final call = Future<String>.delayed(
        const Duration(seconds: 3),
        () => 'Delayed result',
      );

      // Act
      final result = await serviceRunner.run(
        call: call,
        name: testName,
        timeOutSeconds: 1,
      );

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<CommonFailure>());
        },
        (_) => fail('Should not return Right'),
      );
    });

    test('should not time out when disableTimeOut is true', () async {
      // Arrange
      const expectedData = 'Delayed success';
      final call = Future<String>.delayed(
        const Duration(seconds: 2),
        () => expectedData,
      );

      // Act
      final result = await serviceRunner.run(
        call: call,
        name: testName,
        disableTimeOut: true,
        timeOutSeconds: 1,
      );

      // Assert
      expect(result, const Right<Failure, String>(expectedData));
    });
  });
}
