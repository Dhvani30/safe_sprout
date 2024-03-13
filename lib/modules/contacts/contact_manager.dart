// contact_manager.dart
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactManager {
  Future<List<Contact>> getDeviceContacts() async {
    // Implement the logic to fetch contacts here
    Iterable<Contact> contacts = await ContactsService.getContacts();
    return contacts.toList();
  }

  Future<List<Contact>> loadContacts() async {
    bool permissionGranted = await requestContactsPermission();
    if (permissionGranted) {
      List<Contact> contacts = await getDeviceContacts();
      return contacts;
    } else {
      // Handle permission denied
      return [];
    }
  }

  Future<bool> requestContactsPermission() async {
    var status = await Permission.contacts.request();
    return status.isGranted;
  }
}
