import 'package:contact_book_v2/src/model/address.dart';
import 'package:contact_book_v2/src/model/contact.dart';
import 'package:contact_book_v2/src/model/email.dart';
import 'package:contact_book_v2/src/model/label.dart';
import 'package:contact_book_v2/src/model/phone.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

List<Contact> getMockContacts(int n) {
  int count = 0;

  var contacts = <Contact>[];

  while (n > 0 && count < n) {
    contacts.add(
      Contact.fromInfo(
        name: loremIpsum(words: 2),
        emails: [
          Email(email: "abcd@efgh.com"),
          Email(email: "hugabuga@gmail.com", label: Label.work),
        ],
        addresses: [
          Address(address: "Mars"),
          Address(address: "Earth", label: Label.work),
        ],
        phones: [Phone(phone: "9812345677")],
      ),
    );

    count++;
  }

  return contacts;
}
