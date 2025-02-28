import 'package:cubex_africa_flags_explorer/src/core/network/interceptors.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockRequestHandler extends Mock implements RequestInterceptorHandler {}

class MockErrorHandler extends Mock implements ErrorInterceptorHandler {}

void main() {
  group('HeaderInterceptor', () {
    late Dio mockDio;
    late HeaderInterceptor interceptor;
    late MockRequestHandler mockRequestHandler;
    late MockErrorHandler mockErrorHandler;

    setUp(() {
      mockDio = MockDio();
      mockRequestHandler = MockRequestHandler();
      mockErrorHandler = MockErrorHandler();
      registerFallbackValue(RequestOptions(path: '/'));
    });

    group('onRequest', () {
      test('sets json content type when configured for json', () async {
        interceptor = HeaderInterceptor(
          dio: mockDio,
          contentType: HeaderContentType.jsonType,
        );

        const testPath = '/test';
        final options = RequestOptions(path: testPath);

        when(() => mockRequestHandler.next(any())).thenAnswer((_) async {});

        await interceptor.onRequest(options, mockRequestHandler);

        expect(options.headers['Content-Type'], 'application/json');
        verify(() => mockRequestHandler.next(options)).called(1);
      });

      test('sets form content type when configured for form', () async {
        interceptor = HeaderInterceptor(
          dio: mockDio,
          contentType: HeaderContentType.formType,
        );

        const testPath = '/test';
        final options = RequestOptions(path: testPath);

        when(() => mockRequestHandler.next(any())).thenAnswer((_) async {});

        await interceptor.onRequest(options, mockRequestHandler);

        expect(options.headers['Content-Type'], 'multipart/form-data');
        verify(() => mockRequestHandler.next(options)).called(1);
      });

      test('sets form content type when configured for file', () async {
        interceptor = HeaderInterceptor(
          dio: mockDio,
          contentType: HeaderContentType.filetype,
        );

        const testPath = '/test';
        final options = RequestOptions(path: testPath);

        when(() => mockRequestHandler.next(any())).thenAnswer((_) async {});

        await interceptor.onRequest(options, mockRequestHandler);

        expect(options.headers['Content-Type'], 'multipart/form-data');
        verify(() => mockRequestHandler.next(options)).called(1);
      });
    });

    group('onError', () {
      test('propagates error through handler', () async {
        interceptor = HeaderInterceptor(dio: mockDio);
        final error = DioException(
          requestOptions: RequestOptions(path: '/error'),
          error: 'Test error',
        );

        when(() => mockErrorHandler.next(error)).thenAnswer((_) async {});

        await interceptor.onError(error, mockErrorHandler);

        verify(() => mockErrorHandler.next(error)).called(1);
      });
    });
  });
}
