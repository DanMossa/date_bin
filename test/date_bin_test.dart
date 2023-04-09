import 'package:date_bin/date_bin.dart';
import 'package:test/test.dart';

void main() {
  group('dateBin', () {
    test('bins timestamp into 15-minute strides', () {
      Duration stride = Duration(minutes: 15);
      DateTime source = DateTime.parse("2023-04-09 15:52:58.862189Z");
      DateTime origin = DateTime.parse("2001-01-01T00:00:00.000Z");

      DateTime result = dateBin(stride, source, origin);

      expect(result.toIso8601String(), equals("2023-04-09T15:45:00.000Z"));
    });

    test('bins source into 15-minute intervals with offset', () {
      Duration stride = Duration(minutes: 15);
      DateTime source = DateTime.parse("2023-04-09 15:52:58.862189 +00:00");
      DateTime origin = DateTime.parse("2001-01-01 00:00:00.000000 +00:00");

      DateTime result = dateBin(stride, source, origin);

      expect(result.toIso8601String(), equals("2023-04-09T15:45:00.000Z"));
    });

    test('bins timestamp into 1-hour strides', () {
      Duration stride = Duration(hours: 1);
      DateTime source = DateTime.parse("2023-04-09 15:52:58.862189Z");
      DateTime origin = DateTime.parse("2001-01-01T00:00:00.000Z");

      DateTime result = dateBin(stride, source, origin);

      expect(result.toIso8601String(), equals("2023-04-09T15:00:00.000Z"));
    });

    test('bins timestamp into 1-day strides', () {
      Duration stride = Duration(days: 1);
      DateTime source = DateTime.parse("2023-04-09 15:52:58.862189Z");
      DateTime origin = DateTime.parse("2001-01-01T00:00:00.000Z");

      DateTime result = dateBin(stride, source, origin);

      expect(result.toIso8601String(), equals("2023-04-09T00:00:00.000Z"));
    });
  });

  test('bins source into 7-day intervals', () {
    Duration stride = Duration(days: 7);
    DateTime source = DateTime.parse("2023-04-09 15:52:58.862189 +00:00");
    DateTime origin = DateTime.parse("2001-01-01 00:00:00.000000 +00:00");

    DateTime result = dateBin(stride, source, origin);

    expect(result.toIso8601String(), equals("2023-04-03T00:00:00.000Z"));
  });

  test('bins source into 30-day intervals', () {
    Duration stride = Duration(days: 30);
    DateTime source = DateTime.parse("2023-04-09 15:52:58.862189 +00:00");
    DateTime origin = DateTime.parse("2001-01-01 00:00:00.000000 +00:00");

    DateTime result = dateBin(stride, source, origin);

    expect(result.toIso8601String(), equals("2023-04-06T00:00:00.000Z"));
  });
}
