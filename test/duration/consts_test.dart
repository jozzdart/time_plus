import 'package:test/test.dart';
import 'package:time_plus/duration/consts.dart';

void main() {
  group('TimePlusDurationConsts', () {
    test('daysInWeek should be 7', () {
      expect(TimePlusDurationConsts.daysInWeek, equals(7));
    });

    test('daysInMonth should be 30', () {
      expect(TimePlusDurationConsts.daysInMonth, equals(30));
    });

    test('daysInYear should be 365', () {
      expect(TimePlusDurationConsts.daysInYear, equals(365));
    });

    test('yearsInDecade should be 10', () {
      expect(TimePlusDurationConsts.yearsInDecade, equals(10));
    });

    test('yearsInCentury should be 100', () {
      expect(TimePlusDurationConsts.yearsInCentury, equals(100));
    });

    test('decadesInCentury should be 10', () {
      expect(TimePlusDurationConsts.decadesInCentury, equals(10));
    });

    test('daysInDecade should be calculated correctly', () {
      expect(
        TimePlusDurationConsts.daysInDecade,
        equals(TimePlusDurationConsts.daysInYear *
            TimePlusDurationConsts.yearsInDecade),
      );
    });

    test('daysInCentury should be calculated correctly', () {
      expect(
        TimePlusDurationConsts.daysInCentury,
        equals(TimePlusDurationConsts.daysInDecade *
            TimePlusDurationConsts.decadesInCentury),
      );
    });
  });
}
