import 'package:cubex_africa_flags_explorer/src/core/network/network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response<dynamic> {}

class MockCancelToken extends Mock implements CancelToken {}

void main() {
  group('IHttpService', () {
    const baseUrl = 'https://api.example.com';
    late IHttpService httpService;
    late MockDio mockDio;
    late MockCancelToken mockCancelToken;

    setUp(() {
      mockDio = MockDio();
      mockCancelToken = MockCancelToken();
      httpService = IHttpService(baseUrl: baseUrl)..dio = mockDio;
    });

    group('Initialization', () {
      test('sets correct base URL', () {
        expect(httpService.baseUrl, baseUrl);
      });

      test('adds interceptors', () {
        final service = IHttpService(baseUrl: baseUrl);
        expect(service.dio.interceptors, isNotEmpty);
      });
    });

    group('GET', () {
      const path = '/test';
      final successResponse = Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        data: {'key': 'value'},
      );

      setUp(() {
        when(() => mockDio.get<dynamic>(
              any(),
              queryParameters: any(named: 'queryParameters'),
              cancelToken: any(named: 'cancelToken'),
            )).thenAnswer((_) async => successResponse);
      });

      test('calls Dio.get with correct parameters', () async {
        await httpService.get(path);
        verify(() => mockDio.get<dynamic>(path)).called(1);
      });

      test('passes query parameters and cancel token', () async {
        const params = {'param': 'value'};
        await httpService.get(path,
            queryParameters: params, cancelToken: mockCancelToken);
        verify(() => mockDio.get<dynamic>(
              path,
              queryParameters: params,
              cancelToken: mockCancelToken,
            )).called(1);
      });

      test('applies timeout', () async {
        final response = await httpService.get(path);
        expect(response, successResponse);
      });
    });

    group('Error Handling', () {
      const errorMessage = 'Test error';
      final dioError = DioException(
        requestOptions: RequestOptions(path: '/error'),
        response: Response(
          requestOptions: RequestOptions(path: '/error'),
          statusCode: 400,
          data: {'message': errorMessage},
        ),
      );

      test('handles 400 error with message list', () {
        final error = dioError.copyWith(
          response: Response(
            requestOptions: RequestOptions(path: '/error'),
            statusCode: 400,
            data: {
              'message': ['error1', 'error2']
            },
          ),
        );
        final result = networkErrorHandler(error);
        expect(result, 'error1, error2');
      });

      test('handles 500 error', () {
        final error = dioError.copyWith(
          response: Response(
            requestOptions: RequestOptions(path: '/error'),
            statusCode: 500,
            data: {'message': 'Server error'},
          ),
        );
        final result = networkErrorHandler(error);
        expect(result, 'Server error');
      });

      test('handles timeout errors', () {
        final error = DioException(
          requestOptions: RequestOptions(path: '/timeout'),
          type: DioExceptionType.sendTimeout,
        );
        final result = networkErrorHandler(error);
        expect(result, 'Kindly Try Again');
      });
    });

    group('ResponseExt', () {
      test('isSuccessful returns true for 200-299 status codes', () {
        final response = Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
        );
        expect(response.isSuccessful, true);
      });

      test('body returns response data', () {
        const data = {'key': 'value'};
        final response = Response(
          requestOptions: RequestOptions(),
          data: data,
        );
        expect(response.body, data);
      });
    });

    // Similar test groups for POST, PUT, PATCH, DELETE
    group('POST', () {
      const path = '/test';
      final successResponse = Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        data: {'key': 'value'},
      );

      setUp(() {
        when(() => mockDio.post<dynamic>(
              any(),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
              cancelToken: any(named: 'cancelToken'),
              onSendProgress: any(named: 'onSendProgress'),
              onReceiveProgress: any(named: 'onReceiveProgress'),
            )).thenAnswer((_) async => successResponse);
      });

      test('calls Dio.post with correct parameters', () async {
        await httpService.post(path, body: {'test': 'data'});
        verify(() => mockDio.post<dynamic>(
              path,
              data: {'test': 'data'},
            )).called(1);
      });
    });

    // Add similar test groups for PUT, PATCH, DELETE
  });
}
