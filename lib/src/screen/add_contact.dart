import 'package:contact_book_v2/src/model/address.dart';
import 'package:contact_book_v2/src/model/contact.dart';
import 'package:contact_book_v2/src/model/email.dart';
import 'package:contact_book_v2/src/model/label.dart';
import 'package:contact_book_v2/src/model/phone.dart';
import 'package:contact_book_v2/src/screen/all_contacts.dart';
import 'package:flutter/material.dart';

class AddContactCard extends StatefulWidget {
  Contact contact = Contact(name: "");
  List<Contact> allContacts;

  AddContactCard({super.key, required this.allContacts});

  @override
  State<StatefulWidget> createState() {
    return _AddContactCardState();
  }
}

class _AddContactCardState extends State<AddContactCard> {
  var addFormKey = GlobalKey<FormState>();

  void addToAllContactsList() {
    widget.allContacts.insert(0, widget.contact);
    var snackbar = SnackBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      content: Text("Added Successfully"),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(24),

      child: Form(
        key: addFormKey,
        child: SingleChildScrollView(
          child: Column(
            spacing: 14,
            children: [
              Text(
                "Add Contact",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 24,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Name"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                initialValue: widget.contact.name,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Cannot be empty";
                  }

                  return null;
                },

                onSaved: (value) => widget.contact.name =
                    value!, // since nullability is checked by the validator
              ),

              TextFormField(
                decoration: InputDecoration(
                  label: Text("Home Email"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                initialValue:
                    widget.contact.emails
                        .where((e) => e.label == Label.home)
                        .isNotEmpty
                    ? widget.contact.emails
                          .where((e) => e.label == Label.home)
                          .toList()
                          .first
                          .email
                    : "",

                validator: (value) {
                  if (value != null &&
                      value.contains(
                        RegExp(r"^[\w-\.]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,})+$"),
                      )) {
                    return null;
                  }

                  if (value == null || value.isEmpty) {
                    return null;
                  }

                  return "Invalid Email Address";
                },

                onSaved: (value) {
                  // since nullability is checked by the validator
                  var homeEmails = widget.contact.emails
                      .where((element) => element.label == Label.home)
                      .toList();

                  if (value == null || value.isEmpty) {
                    widget.contact.emails = widget.contact.emails
                        .where((e) => e.label != Label.home)
                        .toList();
                  } else {
                    if (homeEmails.isEmpty) {
                      widget.contact.emails.add(
                        Email(email: value, label: Label.home),
                      );
                    } else {
                      homeEmails.first.email = value;
                    }
                  }
                },
              ),

              TextFormField(
                decoration: InputDecoration(
                  label: Text("Work Email"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                initialValue:
                    widget.contact.emails
                        .where((e) => e.label == Label.work)
                        .isNotEmpty
                    ? widget.contact.emails
                          .where((e) => e.label == Label.work)
                          .toList()
                          .first
                          .email
                    : "",

                validator: (value) {
                  if (value != null &&
                      value.contains(
                        RegExp(r"^[\w-\.]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,})+$"),
                      )) {
                    return null;
                  }

                  if (value == null || value.isEmpty) {
                    return null;
                  }

                  return "Invalid Email Address";
                },

                onSaved: (value) {
                  var workEmails = widget.contact.emails
                      .where((element) => element.label == Label.work)
                      .toList();

                  if (value == null || value.isEmpty) {
                    widget.contact.emails = widget.contact.emails
                        .where((e) => e.label != Label.work)
                        .toList();
                  } else {
                    if (workEmails.isEmpty) {
                      widget.contact.emails.add(
                        Email(email: value, label: Label.work),
                      );
                    } else {
                      workEmails.first.email = value;
                    }
                  }
                },
              ),

              TextFormField(
                decoration: InputDecoration(
                  label: Text("Home Phone"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                initialValue:
                    widget.contact.phones
                        .where((e) => e.label == Label.home)
                        .isNotEmpty
                    ? widget.contact.phones
                          .where((e) => e.label == Label.home)
                          .toList()
                          .first
                          .phone
                    : "",

                validator: (value) {
                  if (value != null &&
                      value.contains(RegExp(r"[a-zA-Z?#@!]+"))) {
                    return "Invalid Phone Number";
                  }

                  return null;
                },

                onSaved: (value) {
                  var homePhones = widget.contact.phones
                      .where((element) => element.label == Label.home)
                      .toList();

                  if (value == null || value.isEmpty) {
                    widget.contact.phones = widget.contact.phones
                        .where((e) => e.label != Label.home)
                        .toList();
                  } else {
                    if (homePhones.isEmpty) {
                      widget.contact.phones.add(
                        Phone(phone: value, label: Label.home),
                      );
                    } else {
                      homePhones.first.phone = value;
                    }
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Work Phone"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                initialValue:
                    widget.contact.phones
                        .where((e) => e.label == Label.work)
                        .isNotEmpty
                    ? widget.contact.phones
                          .where((e) => e.label == Label.work)
                          .toList()
                          .first
                          .phone
                    : "",

                validator: (value) {
                  if (value != null &&
                      value.contains(RegExp(r"[a-zA-Z?#@!]+"))) {
                    return "Invalid Phone Number";
                  }

                  return null;
                },

                onSaved: (value) {
                  var workPhones = widget.contact.phones
                      .where((element) => element.label == Label.work)
                      .toList();

                  if (value == null || value.isEmpty) {
                    widget.contact.phones = widget.contact.phones
                        .where((e) => e.label != Label.work)
                        .toList();
                  } else {
                    if (workPhones.isEmpty) {
                      widget.contact.phones.add(
                        Phone(phone: value, label: Label.work),
                      );
                    } else {
                      workPhones.first.phone = value;
                    }
                  }
                },
              ),

              TextFormField(
                decoration: InputDecoration(
                  label: Text("Home Address"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                initialValue:
                    widget.contact.addresses
                        .where((e) => e.label == Label.home)
                        .isNotEmpty
                    ? widget.contact.addresses
                          .where((e) => e.label == Label.home)
                          .toList()
                          .first
                          .address
                    : "",

                onSaved: (value) {
                  var homeAddresses = widget.contact.addresses
                      .where((e) => e.label == Label.home)
                      .toList();

                  if (value == null || value.isEmpty) {
                    widget.contact.addresses = widget.contact.addresses
                        .where((e) => e.label != Label.home)
                        .toList();
                  } else {
                    if (homeAddresses.isEmpty) {
                      widget.contact.addresses.add(
                        Address(address: value, label: Label.home),
                      );
                    } else {
                      homeAddresses.first.address = value;
                    }
                  }
                },
              ),

              TextFormField(
                decoration: InputDecoration(
                  label: Text("Work Address"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                initialValue:
                    widget.contact.addresses
                        .where((e) => e.label == Label.work)
                        .isNotEmpty
                    ? widget.contact.addresses
                          .where((e) => e.label == Label.work)
                          .toList()
                          .first
                          .address
                    : "",

                onSaved: (value) {
                  var workAddresses = widget.contact.addresses
                      .where((e) => e.label == Label.work)
                      .toList();

                  if (value == null || value.isEmpty) {
                    widget.contact.addresses = widget.contact.addresses
                        .where((e) => e.label != Label.work)
                        .toList();
                  } else {
                    if (workAddresses.isEmpty) {
                      widget.contact.addresses.add(
                        Address(address: value, label: Label.work),
                      );
                    } else {
                      workAddresses.first.address = value;
                    }
                  }
                },
              ),

              ActionPanel(
                addFormKey: addFormKey,
                allContacts: widget.allContacts,
                callback: addToAllContactsList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionPanel extends StatelessWidget {
  final GlobalKey<FormState> addFormKey;
  final VoidCallback callback;
  List<Contact> allContacts;

  ActionPanel({
    super.key,
    required this.addFormKey,
    required this.allContacts,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: Theme.of(context).colorScheme.surfaceBright,
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,

        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            highlightColor: Theme.of(context).colorScheme.secondary,
            customBorder: CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back, size: 32),
            ),
          ),
          InkWell(
            onTap: () {
              if (addFormKey.currentState!.validate()) {
                addFormKey.currentState!.save();
                callback();

                print("Form Saved");

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AllContactsScreen(contacts: allContacts),
                  ),
                );
              }
            },
            highlightColor: Theme.of(context).colorScheme.secondary,
            customBorder: CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.check, size: 32),
            ),
          ),
        ],
      ),
    );
  }
}
