import 'dart:ffi';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dice_app/database_helper.dart';
import 'package:dice_app/modules/Contacts/model/contactsm.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dice_app/utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Contact> contacts = [];
  List<Contact> contactsFiltered = [];
  DatabaseHelper _databaseHelper = DatabaseHelper();
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    setState(() {
      isLoading = true;
    });
    await askPermissions();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> askPermissions() async {
    PermissionStatus permissionStatus = await getContactPermissions();
    if (permissionStatus == PermissionStatus.granted) {
      await getAllContacts();
      searchController.addListener(() {
        filterContact();
      });
    } else {
      handleInvalidPermissions(context, permissionStatus);
    }
  }

  Future<void> getAllContacts() async {
    List<Contact> _contacts = await ContactsService.getContacts();
    _contacts = _contacts
        .where((contact) =>
            contact.displayName?.isNotEmpty ??
            false && contact.phones != null && contact.phones!.isNotEmpty)
        .toList();
    setState(() {
      contacts = _contacts;
    });
  }

  String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }

  filterContact() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((element) {
        String serachTerm = searchController.text.toLowerCase();
        String searchTermFlattern = flattenPhoneNumber(serachTerm);
        String contactName = element.displayName!.toLowerCase();
        bool nameMatch = contactName.contains(serachTerm);
        if (nameMatch == true) {
          return true;
        }
        if (searchTermFlattern.isEmpty) {
          return false;
        }
        var phone = element.phones!.firstWhere((p) {
          String phnFlattered = flattenPhoneNumber(p.value!);
          return phnFlattered.contains(searchTermFlattern);
        });
        return phone.value != null;
      });
    }
    setState(() {
      contactsFiltered = _contacts;
      HapticFeedback.mediumImpact();
    });
  }

  void handleInvalidPermissions(
      BuildContext context, PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      dialogueBox(context, "Access to the contacts denied by the user");
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      dialogueBox(context, "Contacts permission permanently denied");
    }
  }

  Future<PermissionStatus> getContactPermissions() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSearchIng = searchController.text.isNotEmpty;
    bool listItemExit = (contactsFiltered.length > 0 || contacts.length > 0);
    return Scaffold(
      body: isLoading
          ? SafeArea(child: Center(child: CircularProgressIndicator()))
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: TextField(
                    autofocus: true,
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: "Search Contacts",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                listItemExit == true
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: isSearchIng == true
                              ? contactsFiltered.length
                              : contacts.length,
                          itemBuilder: (BuildContext context, int index) {
                            Contact contact = isSearchIng == true
                                ? contactsFiltered[index]
                                : contacts[index];
                            return Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 234, 221, 255),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  title: Text(contact.displayName ?? 'No Name'),
                                  subtitle: Text(
                                    contact.phones != null &&
                                            contact.phones!.isNotEmpty
                                        ? contact.phones!.first.value ?? ''
                                        : 'No phone number',
                                  ),
                                  leading: contact.avatar != null &&
                                          contact.avatar!.isNotEmpty
                                      ? CircleAvatar(
                                          backgroundImage:
                                              MemoryImage(contact.avatar!),
                                        )
                                      : CircleAvatar(
                                          child: Text(contact.initials())),
                                  onTap: () {
                                    if (contact.phones!.length > 0) {
                                      HapticFeedback.mediumImpact();
                                      final String phoneNumber =
                                          contact.phones!.elementAt(0).value!;
                                      final String name = contact.displayName!;
                                      _addContact(TContact(phoneNumber, name));
                                    } else {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Oops! phone number of this contact does not exist");
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Container(
                        child: Text("Searching"),
                      ),
              ],
            ),
    );
  }

  void _addContact(TContact newContact) async {
    int result = await _databaseHelper.insertContact(newContact);
    if (result != 0) {
      Fluttertoast.showToast(msg: "contact added successfully");
    } else {
      Fluttertoast.showToast(msg: "failed to add contact");
    }
    Navigator.of(context).pop(true);
  }
}
