import 'package:contact_book_v2/src/model/contact_info.dart';
import 'package:contact_book_v2/src/model/label.dart';

class Address extends ContactInfo {
  String address;

  Address({required this.address, super.label = Label.home});

  @override
  String? formValidator() {
    if (address.isEmpty) {
      return "Address cannot be Empty";
    }

    return null;
  }
}
