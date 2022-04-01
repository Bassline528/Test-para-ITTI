import 'package:flutter/material.dart';
import 'package:test_itti/models/user_db.dart';

class UserFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  // UserDB user;

  // UserFormProvider(this.user);

  bool isValidForm() {

    return formKey.currentState?.validate() ?? false;
  }







}