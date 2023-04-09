import 'package:date_bin/date_bin.dart';
import 'package:intl/intl.dart';

void main() {
  Duration stride = Duration(minutes: 15);
  DateTime source = DateTime.parse('2020-02-11 15:44:17');
  DateTime origin = DateTime.parse('2001-01-01');

  DateTime binStart = dateBin(stride, source, origin);

  print(DateFormat('yyyy-MM-dd HH:mm:ss')
      .format(binStart)); // Output: 2020-02-11 15:30:00
}
