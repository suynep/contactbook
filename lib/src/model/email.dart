import 'package:contact_book_v2/src/model/contact_info.dart';
import 'package:contact_book_v2/src/model/label.dart';

class Email extends ContactInfo {
  String email;

  Email({required this.email, super.label = Label.home});

  @override
  String? formValidator() {
    if (email.contains(RegExp(r"^[\w-\.]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,})+$"))) {
      return null;
    }

    return "Invalid Email Address";
  }
}
