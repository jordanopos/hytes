import 'package:flutter/material.dart';
import 'package:hytes_edition/src/ui/views/auth/login/widgets/title.dart';
import 'package:hytes_edition/src/ui/views/auth/login/widgets/registerButton.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm(
      {Key key,
      @required this.height,
      @required TextEditingController usernameController,
      @required this.phoneNumberController,
      @required TextEditingController email,
      @required TextEditingController password,
      @required TextEditingController billingAdressController,
      @required GlobalKey<FormState> formKey,
      @required this.showLoading,
      //  @required this.scaffoldKey,
      @required this.showBar})
      : _usernameController = usernameController,
        _email = email,
        _password = password,
        _billingAdressController = billingAdressController,
        _formKey = formKey,
        super(key: key);

  final double height;

  final Function showBar;
  final Function showLoading;
  final TextEditingController phoneNumberController;
  final TextEditingController _usernameController;
  final TextEditingController _email;
  final TextEditingController _password;
  final TextEditingController _billingAdressController;
  final GlobalKey<FormState> _formKey;
  //final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OposTitle(),
        SizedBox(height: 50),
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Username',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      // autofocus: true,
                      maxLines: 1,
                      controller: _usernameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "The username field cannot be empty";
                        } else if (value.length < 6) {
                          return "the username has to be at least 6 characters long";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: _email,
                      validator: (value) {
                        if (value.isEmpty) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(value))
                            return 'Please make sure your email address is valid';
                          else
                            return null;
                        }
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      // autofocus: true,
                      maxLines: 1,
                      controller: _password,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "The password field cannot be empty";
                        } else if (value.length < 6) {
                          return "the password has to be at least 6 characters long";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Delivery Information',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      autofocus: false,
                      maxLines: 1,
                      controller: _billingAdressController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This field cannot be empty";
                        } else if (value.length < 6) {
                          return "the delivry info has to be at least 6 characters long";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Eg : Namugongo -Kampala',
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Phone number',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      autofocus: false,
                      maxLines: 1,
                      controller: phoneNumberController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This field cannot be empty";
                        } else if (value.length != 10) {
                          return "Please enter a valid phone number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'eg 0771234567',
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true))
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        RegisterButton(
          showBar,
          _email,
          _password,
          _formKey,
          _billingAdressController,
          _usernameController,
          phoneNumberController.text,
          showLoading
        ),
        SizedBox(height: height * .015),
      ],
    );
  }
}
