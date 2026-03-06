import 'package:contact_book_v2/src/model/contact_info.dart';
import 'package:contact_book_v2/src/model/label.dart';

class Phone extends ContactInfo {
  String phone;

  Phone({required this.phone, super.label = Label.home});

  @override
  String? formValidator() {
    if (phone.contains(RegExp(r"[a-zA-Z?#@!]+"))) {
      return "Invalid Phone Number";
    }

    return null;
  }
}
