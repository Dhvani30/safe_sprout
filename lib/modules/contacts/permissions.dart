// permissions.dart
import 'package:permission_handler/permission_handler.dart';

// Function to request contacts permission
Future<bool> requestContactsPermission() async {
  // Request the contacts permission
  PermissionStatus status = await Permission.contacts.request();

  // Return true if permission is granted, false otherwise
  return status == PermissionStatus.granted;
}
