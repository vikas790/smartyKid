class RawDataConverter {
  static String getString(dynamic val) {
    return (val is String) ? val : "";
  }

  static int getInt(dynamic val) {
    return (val is double)
        ? val.toInt()
        : (val is int)
        ? val
        : 0;
  }

  static double getDouble(dynamic val) {
    return double.parse(((val is int)
        ? (val).toDouble()
        : (val is double)
        ? val
        : 0.0)
        .toStringAsFixed(10));
  }

  static double getDoubles(dynamic val) {
    return (val is int)
        ? val.toDouble()
        : (val is double)
        ? val
        : 0.0;
  }

  static bool getBool(dynamic val) {
    return (val is bool) ? val : false;
  }
}