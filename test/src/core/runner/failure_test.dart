import 'package:cubex_africa_flags_explorer/src/core/runner/failure.dart';
import 'package:flutter_test/flutter_test.dart';

// Import your failure classes here
// import 'package:your_app/core/failures/failures.dart';

void main() {
  group('Failure Classes', () {
    group('Failure base class', () {
      test('props contains title and message', () {
        // Arrange
        const title = 'Test Title';
        const message = 'Test Message';
        const failure = _TestFailure(title, message);

        // Act
        final props = failure.props;

        // Assert
        expect(props, [title, message]);
        expect(props.length, 2);
      });

      test('props equality works correctly', () {
        // Arrange
        const failure1 = _TestFailure('Title', 'Message');
        const failure2 = _TestFailure('Title', 'Message');
        const failure3 = _TestFailure('Different', 'Message');

        // Assert
        expect(failure1.props, equals(failure2.props));
        expect(failure1.props, isNot(equals(failure3.props)));
      });
    });

    group('ServerFailure', () {
      test('initializes correctly', () {
        // Arrange
        const title = 'Server Error';
        const message = 'Failed to connect to server';

        // Act
        const failure = ServerFailure(title, message);

        // Assert
        expect(failure.title, title);
        expect(failure.message, message);
        expect(failure.props, [title, message]);
      });

      test('subclass maintains props behavior', () {
        // Arrange
        const failure1 = ServerFailure('Title', 'Message');
        const failure2 = ServerFailure('Title', 'Message');
        const failure3 = ServerFailure('Different', 'Message');

        // Assert
        expect(failure1.props, equals(failure2.props));
        expect(failure1.props, isNot(equals(failure3.props)));
      });
    });

    group('CommonFailure', () {
      test('initializes correctly', () {
        // Arrange
        const title = 'Common Error';
        const message = 'Something went wrong';

        // Act
        const failure = CommonFailure(title, message);

        // Assert
        expect(failure.title, title);
        expect(failure.message, message);
        expect(failure.props, [title, message]);
      });

      test('different failure types with same properties have same props', () {
        // Arrange
        const serverFailure = ServerFailure('Error', 'Message');
        const commonFailure = CommonFailure('Error', 'Message');

        // Assert
        expect(serverFailure.props, equals(commonFailure.props));
      });
    });

    group('InternetFailure', () {
      test('initializes correctly', () {
        // Arrange
        const title = 'No Internet';
        const message = 'Please check your internet connection';

        // Act
        const failure = InternetFailure(title, message);

        // Assert
        expect(failure.title, title);
        expect(failure.message, message);
        expect(failure.props, [title, message]);
      });
    });

    group('Type checking', () {
      test('each failure is instance of base Failure', () {
        // Arrange
        const serverFailure = ServerFailure('Error', 'Message');
        const commonFailure = CommonFailure('Error', 'Message');
        const internetFailure = InternetFailure('Error', 'Message');

        // Assert
        expect(serverFailure, isA<Failure>());
        expect(commonFailure, isA<Failure>());
        expect(internetFailure, isA<Failure>());
      });

      test('failures are instances of their specific types', () {
        // Arrange
        const serverFailure = ServerFailure('Error', 'Message');
        const commonFailure = CommonFailure('Error', 'Message');
        const internetFailure = InternetFailure('Error', 'Message');

        // Assert
        expect(serverFailure, isA<ServerFailure>());
        expect(commonFailure, isA<CommonFailure>());
        expect(internetFailure, isA<InternetFailure>());
      });
    });
  });
}

class _TestFailure extends Failure {
  const _TestFailure(super.title, super.message);
}
