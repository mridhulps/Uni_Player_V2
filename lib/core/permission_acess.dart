import 'package:permission_handler/permission_handler.dart';

class StatPermissions {
  Future<PermissionType> status(Permission permission) async {
    final stat = await permission.status;

    PermissionType type = PermissionType.initial;

    if (!stat.isGranted) {
      final isgrand = await permission.request();

      if (isgrand.isGranted) {
        return type = PermissionType.granded;
      } else if (isgrand.isDenied) {
        return type = PermissionType.denied;
      } else {
        return PermissionType.permanentdenied;
      }
    }
    return type;
  }
}

enum PermissionType {
  initial,
  granded,
  denied,
  permanentdenied,
}
