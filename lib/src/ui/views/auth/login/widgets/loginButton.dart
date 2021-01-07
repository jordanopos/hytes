import 'package:flutter/material.dart';
import 'package:hytes_edition/src/services/auth.dart';
import 'package:hytes_edition/src/services/shared_preferences.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController _email;
  final TextEditingController _password;
  final GlobalKey<FormState> formKey;
  AuthService _auth = AuthService();
  final Function showBar;
  final Function showLoading;

  LoginButton(this._email, this._password, this.formKey, this.showBar, this.showLoading);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (formKey.currentState.validate()) {
          showLoading();
          var result = await _auth.signIn(_email.text, _password.text);

          if (result == null) {
            //   Navigator.pop(context);
            showBar();
          }

          await sharedPrefs.setuid(userId);
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
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
