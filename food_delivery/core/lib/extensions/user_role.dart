import 'package:core/core.dart';

extension UserRoleExtension on UserRole {
  String getStringValue() {
    switch (this) {
      case UserRole.admin:
        return 'admin';
      case UserRole.user:
        return 'user';
      default:
        return '';
    }
  }
}
