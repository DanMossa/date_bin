# date_bin
A Dart library that provides a dateBin function for binning timestamps into a specified interval aligned with a 
specified origin, similar to the date_bin function in Postgres. This library allows you to truncate timestamps 
to an arbitrary interval and supports various interval units such as seconds, minutes, hours, and days. 
With dateBin, you can easily group timestamps and perform time-series analysis on your data in Dart.

## Features
* `dateBin` function that bins timestamps into a specified interval aligned with a specified origin
* Supports various interval units such as seconds, minutes, hours, and days
* Truncates timestamps to an arbitrary interval, allowing you to group timestamps for time-series analysis
* Easy-to-use API that allows you to quickly bin timestamps and manipulate time-series data in Dart
* Lightweight and fast implementation that can handle large datasets and high-throughput applications
* Fully tested with comprehensive unit tests and integration tests to ensure reliability and correctness
* Open-source with a permissive license, allowing you to use, modify, and distribute the library freely

## Installation
To use `date_bin` in your Dart project, add it as a dependency in your pubspec.yaml file:

```yaml
dependencies:
  date_bin:
```

## Usage
Import the `date_bin` library in your Dart code:

```dart
import 'package:date_bin/date_bin.dart';
```
Then, you can use the `dateBin` function to bin timestamps into a specified interval aligned with a specified origin. 
Here's an example:

```dart
import 'package:date_bin/date_bin.dart';

void main() {
  DateTime source = DateTime.parse("2023-04-09 15:52:58.862189Z");
  DateTime origin = DateTime.parse("2001-01-01T00:00:00.000Z");
  Duration interval = Duration(minutes: 15);

  DateTime result = dateBin(source, interval, origin);

  print(result); // Output: 2023-04-09 15:45:00.000Z
}
```

In this example, we bin the source timestamp into 15-minute intervals aligned with the origin timestamp. 
The resulting binned timestamp is stored in the result variable and printed to the console.

You can also use different interval units such as seconds, hours, and days, 
as well as different DateTime constructors for the source and origin timestamps.