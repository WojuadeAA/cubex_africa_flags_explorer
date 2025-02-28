import 'package:cubex_africa_flags_explorer/src/core/network/response_processor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockResponse extends Mock implements Response<Map<String, dynamic>> {}

void main() {
  group('processResponse', () {
    final mockResponse = MockResponse();
    const testData = {'key': 'value'};
    final testSerializer = (dynamic json) => json['key'] as String;

    setUp(() {
      reset(mockResponse);
    });

    group('Success cases', () {
      test('returns serialized data for successful status code (200)',
          () async {
        when(() => mockResponse.statusCode).thenReturn(200);
        when(() => mockResponse.data).thenReturn(testData);

        final result = await processResponse(
          response: mockResponse,
          serializer: testSerializer,
        );

        expect(result, 'value');
      });

      test('handles success code threshold (successCode + 90)', () async {
        when(() => mockResponse.statusCode).thenReturn(289);
        when(() => mockResponse.data).thenReturn(testData);

        final result = await processResponse(
          response: mockResponse,
          serializer: testSerializer,
          successCode: 200,
        );

        expect(result, 'value');
      });
    });

    group('Error cases', () {
      test('throws custom serialized error when provided', () async {
        when(() => mockResponse.statusCode).thenReturn(400);
        when(() => mockResponse.data).thenReturn({'error': 'details'});

        expect(
          () async => processResponse(
            response: mockResponse,
            serializer: testSerializer,
            serializeError: (data) => Exception(data['error'] as String),
          ),
          throwsA(isA<Exception>()
              .having((e) => e.toString(), 'message', contains('details'))),
        );
      });

      test('parses message from error response (string message)', () async {
        when(() => mockResponse.statusCode).thenReturn(400);
        when(() => mockResponse.data).thenReturn({'message': 'Error occurred'});

        expect(
            () async => processResponse(
                  response: mockResponse,
                  serializer: testSerializer,
                ),
            throwsA(
              isA<Exception>().having(
                  (e) => e.toString(), 'message', contains('Error occurred')),
            ));
      });

      test('handles list-type error messages', () async {
        when(() => mockResponse.statusCode).thenReturn(400);
        when(() => mockResponse.data).thenReturn({
          'message': ['First error', 'Second error']
        });

        expect(
            () async => processResponse(
                  response: mockResponse,
                  serializer: testSerializer,
                ),
            throwsA(
              isA<Exception>().having((e) => e.toString(), 'message',
                  contains('First error, Second error')),
            ));
      });

      test('handles missing status code', () async {
        when(() => mockResponse.statusCode).thenReturn(null);
        when(() => mockResponse.data).thenReturn({'message': 'Missing status'});

        expect(
          () async => processResponse(
            response: mockResponse,
            serializer: testSerializer,
          ),
          throwsA(isA<Exception>()),
        );
      });

      test('cleans error message format', () async {
        when(() => mockResponse.statusCode).thenReturn(400);
        when(() => mockResponse.data)
            .thenReturn({'message': 'errors:[{test:value}]'});

        expect(
            () async => processResponse(
                  response: mockResponse,
                  serializer: testSerializer,
                ),
            throwsA(
              isA<Exception>().having((e) => e.toString(), 'message',
                  allOf([contains('testvalue'), isNot(contains('['))])),
            ));
      });
    });
  });
}
