import 'package:flutter/material.dart';
import 'package:hytes_edition/src/services/auth.dart';
import 'package:hytes_edition/src/services/database.dart';
import 'package:hytes_edition/src/services/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class RegisterButton extends StatelessWidget {
  final Function showBar;
  final TextEditingController _userName;
  final TextEditingController _billing;
  final TextEditingController _email;
  final TextEditingController _password;
  final GlobalKey<FormState> formKey;
  final String phoneNumber;
  final Function showLoading;
  //final GlobalKey<ScaffoldState> scaffoldKey;
  AuthService _auth = AuthService();

  RegisterButton(this.showBar, this._email, this._password, this.formKey,
      this._billing, this._userName, this.phoneNumber, this.showLoading
      //  this.scaffoldKey
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (formKey.currentState.validate()) {
          showLoading();
          dynamic result = await _auth.register(_email.text, _password.text);

          if (result == null) {
           // Navigator.pop(context);
            showBar();
          }

         await sharedPrefs.setuid(userId);

          DataBaseService(userId).updateUserData(
              userName: _userName.text,
              billingAdress: _billing.text,
              phoneNumber: phoneNumber);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xffDC143C), Color(0xffDC143C)])),
        child: Text(
          'Register',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
