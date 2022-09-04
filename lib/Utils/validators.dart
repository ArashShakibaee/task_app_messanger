import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Validators {
  static MultiValidator nameValidator(BuildContext context) {
    return MultiValidator([RequiredValidator(errorText: "name is required")]);
  }

  static MultiValidator emailValidator(BuildContext context) {
    return MultiValidator([
      RequiredValidator(errorText: "email address is Required"),
      PatternValidator(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
          errorText: "email address is wrong!")
    ]);
  }
}
