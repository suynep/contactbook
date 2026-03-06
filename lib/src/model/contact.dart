import 'package:contact_book_v2/src/model/address.dart';
import 'package:contact_book_v2/src/model/email.dart';
import 'package:contact_book_v2/src/model/phone.dart';
import 'package:uuid/uuid.dart';

class Contact {
  String id = Uuid().v4();
  String name;
  List<Email> emails = [];
  List<Phone> phones = [];
  List<Address> addresses = [];

  Contact({required this.name});

  Contact.fromInfo({
    required this.name,
    required this.emails,
    required this.addresses,
    required this.phones,
  });
}
