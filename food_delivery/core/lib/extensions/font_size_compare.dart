extension FontSizeValueCompareExtensions on double {
  bool isBetween(double lowerBound, double upperBound) {
    return this >= lowerBound && this < upperBound;
  }

  bool isExactly(double value) {
    return this == value;
  }
}
