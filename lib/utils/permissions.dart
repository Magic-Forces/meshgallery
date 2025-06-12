import 'package:permission_handler/permission_handler.dart';

class PermissionRequestResult {
  final bool allGranted;
  final bool isPermanentlyDenied;
  final String? errorMessage;

  PermissionRequestResult(
    this.allGranted,
    this.isPermanentlyDenied, [
    this.errorMessage,
  ]);
}

Future<PermissionRequestResult> requestPermissions() async {
  try {
    final statuses = await [Permission.photos, Permission.videos].request();

    final allGranted = statuses.values.every(
      (status) => status == PermissionStatus.granted,
    );

    final isPermanentlyDenied = statuses.values.any(
      (status) => status == PermissionStatus.permanentlyDenied,
    );

    return PermissionRequestResult(allGranted, isPermanentlyDenied);
  } catch (e) {
    return PermissionRequestResult(
      false,
      false,
      'Failed to request permissions: ${e.toString()}',
    );
  }
}
