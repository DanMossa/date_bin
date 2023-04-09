library date_bin;

DateTime dateBin(Duration stride, DateTime source, DateTime origin) {
  // Calculate the number of whole strides between the origin and source timestamps.
  Duration difference = source.difference(origin);
  int strideCount = (difference.inMicroseconds / stride.inMicroseconds).floor();

  // Calculate the timestamp of the beginning of the bin that the source timestamp falls into.
  DateTime binStart = origin.add(stride * strideCount);

  return binStart;
}
