import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dice_app/utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Contact> contacts = [];
  List<Contact> contactsFiltered = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    askPermissions();
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
    });
  }

  Future<void> askPermissions() async {
    PermissionStatus permissionStatus = await getContactPermissions();
    if (permissionStatus == PermissionStatus.granted) {
      getAllContacts();
      searchController.addListener(() {
        filterContact();
      });
    } else {
      handleInvalidPermissions(context, permissionStatus);
    }
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

  getAllContacts() async {
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

  @override
  Widget build(BuildContext context) {
    bool isSearchIng = searchController.text.isNotEmpty;
    bool listItemExit = (contactsFiltered.length > 0 || contacts.length > 0);
    return Scaffold(
      body: contacts.isEmpty
          ? SafeArea(child: Center(child: const CircularProgressIndicator()))
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
}
