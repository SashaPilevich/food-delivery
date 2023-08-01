import 'package:core/core.dart';

extension CategoryExtension on Category {
  String getStringValue() {
    switch (this) {
      case Category.All:
        return 'All';
      default:
        return '';
    }
  }
}
